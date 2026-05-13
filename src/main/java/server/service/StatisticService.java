package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import server.dto.response.statistic.BarChartDataset;
import server.dto.response.statistic.BarChartResponse;
import server.dto.response.statistic.ChartResponse;
import server.entity.LegalRelationshipGroup;
import server.repository.JudgeRepository;
import server.repository.LegalRelationshipGroupRepository;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class StatisticService {
    JudgeRepository judgeRepository;
    LegalRelationshipGroupRepository legalRelationshipGroupRepository;

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public BarChartResponse getJudgeStatistics(
            LocalDate startDate,
            LocalDate endDate
    ) {
        List<Object[]> rows = judgeRepository.getStatisticsJudge(startDate, endDate);

        List<LegalRelationshipGroup> allGroups = legalRelationshipGroupRepository.findAll(Sort.by("legalRelationshipGroupId"));
        Map<String, String> allGroupNames = allGroups.stream()
                .collect(Collectors.toMap(
                        LegalRelationshipGroup::getLegalRelationshipGroupId,
                        LegalRelationshipGroup::getLegalRelationshipGroupName,
                        (a, b) -> a,
                        LinkedHashMap::new
                ));

        Map<String, Object[]> judgeInfoMap = new LinkedHashMap<>();
        // Map<officerId, withMediator>
        Map<String, Long> judgeMediatorMap = new LinkedHashMap<>();
        // Map<officerId, Map<groupId, withoutMediator>>
        Map<String, Map<String, Long>> judgeGroupMap = new LinkedHashMap<>();

        for (Object[] row : rows) {
            String officerId = (String) row[0];
            String fullName = (String) row[1];
            String groupId = (String) row[2];
            Long withMediator = row[3] != null ? (Long) row[3] : 0L;
            Long withoutMediator = row[4] != null ? (Long) row[4] : 0L;

            judgeInfoMap.putIfAbsent(officerId, new Object[]{officerId, fullName});
            judgeGroupMap.putIfAbsent(officerId, new LinkedHashMap<>());

            // Cộng dồn tổng án có HGV (độc lập, không theo nhóm)
            judgeMediatorMap.merge(officerId, withMediator, Long::sum);

            // Án không có HGV theo từng nhóm
            if (groupId != null) {
                judgeGroupMap.get(officerId).merge(groupId, withoutMediator, Long::sum);
            }
        }

        List<String> judgeIds = new ArrayList<>(judgeInfoMap.keySet());

        // labels = tên thẩm phán
        List<String> labels = judgeInfoMap.values().stream()
                .map(info -> (String) info[1])
                .toList();

        List<BarChartDataset> datasets = new ArrayList<>();

        // Dataset 1: Tổng án có hòa giải viên (độc lập)
        BarChartDataset withMediatorDataset = new BarChartDataset();
        withMediatorDataset.setLabel("Có hòa giải viên");
        withMediatorDataset.setData(judgeIds.stream()
                .map(id -> (double) judgeMediatorMap.getOrDefault(id, 0L))
                .toList());
        datasets.add(withMediatorDataset);

        // Dataset theo từng nhóm QHPL: số án KHÔNG có hòa giải viên
        for (Map.Entry<String, String> groupEntry : allGroupNames.entrySet()) {
            String groupId = groupEntry.getKey();
            String groupName = groupEntry.getValue();

            BarChartDataset groupDataset = new BarChartDataset();
            groupDataset.setLabel(groupName);
            groupDataset.setData(judgeIds.stream()
                    .map(id -> (double) judgeGroupMap
                            .getOrDefault(id, Collections.emptyMap())
                            .getOrDefault(groupId, 0L))
                    .toList());
            datasets.add(groupDataset);
        }

        BarChartResponse response = new BarChartResponse();
        response.setChartName("Thống kê án theo thẩm phán");
        response.setXAxisName("Thẩm phán");
        response.setYAxisName("Số lượng án");
        response.setLabels(labels);
        response.setDatasets(datasets);

        return response;
    }
}
