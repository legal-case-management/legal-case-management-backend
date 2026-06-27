package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import server.dto.response.statistic.*;
import server.entity.LegalCaseType;
import server.entity.LegalRelationshipGroup;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.repository.JudgeRepository;
import server.repository.LegalCaseRepository;
import server.repository.LegalCaseTypeRepository;
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
    LegalCaseTypeRepository legalCaseTypeRepository;
    LegalCaseRepository legalCaseRepository;

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public BarChartResponse getStatisticsJudgeByLegalRelationshipGroup(
            LocalDate startDate,
            LocalDate endDate
    ) {
        if(startDate == null || endDate == null)
            throw new AppException(ErrorCode.INVALID_PARAMETERS);

        if (startDate.isAfter(endDate))
            throw new AppException(ErrorCode.START_DATE_AFTER_END_DATE);

        List<Object[]> rows = judgeRepository.getStatisticsJudgeByLegalRelationshipGroup(startDate, endDate);

        Map<String, String> allGroupNames = legalRelationshipGroupRepository.findAll(Sort.by("legalRelationshipGroupId"))
                .stream()
                .collect(Collectors.toMap(
                        LegalRelationshipGroup::getLegalRelationshipGroupId,
                        LegalRelationshipGroup::getLegalRelationshipGroupName,
                        (a, b) -> a,
                        LinkedHashMap::new
                ));

        Map<String, Object[]> judgeInfoMap = new LinkedHashMap<>();
        // Map<officerId, withMediator>
        Map<String, Long> judgeMediatorMap = new LinkedHashMap<>();
        // Map<officerId, withoutMediator> — tổng tất cả nhóm
        Map<String, Long> judgeWithoutMediatorMap = new LinkedHashMap<>();
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

            // Cộng dồn tổng án KHÔNG có HGV (độc lập, không theo nhóm)
            judgeWithoutMediatorMap.merge(officerId, withoutMediator, Long::sum);

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

        // Dataset 2: Tổng án KHÔNG có hòa giải viên (độc lập)
        BarChartDataset withoutMediatorDataset = new BarChartDataset();
        withoutMediatorDataset.setLabel("Không có hòa giải viên");
        withoutMediatorDataset.setData(judgeIds.stream()
                .map(id -> (double) judgeWithoutMediatorMap.getOrDefault(id, 0L))
                .toList());
        datasets.add(withoutMediatorDataset);

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
        response.setChartName("Thống kê án số lượng án của thẩm phán theo nhóm quan hệ pháp luật");
        response.setXAxisName("Thẩm phán");
        response.setYAxisName("Số lượng án");
        response.setLabels(labels);
        response.setDatasets(datasets);

        return response;
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public BarChartResponse getStatisticsJudgeByLegalCaseType(
            LocalDate startDate,
            LocalDate endDate
    ) {
        if(startDate == null || endDate == null)
            throw new AppException(ErrorCode.INVALID_PARAMETERS);

        if (startDate.isAfter(endDate))
            throw new AppException(ErrorCode.START_DATE_AFTER_END_DATE);

        List<Object[]> rows = judgeRepository.getStatisticsJudgeByLegalCaseType(startDate, endDate);

        // Lấy tất cả loại án để đảm bảo đủ cột kể cả khi = 0
        Map<String, String> allCaseTypeNames = legalCaseTypeRepository.findAll(Sort.by("legalCaseTypeId")).stream()
                .collect(Collectors.toMap(
                        LegalCaseType::getLegalCaseTypeId,
                        LegalCaseType::getLegalCaseTypeName,
                        (a, b) -> a,
                        LinkedHashMap::new
                ));

        // Map<officerId, Object[]{officerId, fullName}>
        Map<String, Object[]> judgeInfoMap = new LinkedHashMap<>();
        // Map<officerId, Map<legalCaseTypeId, count>>
        Map<String, Map<String, Long>> judgeCaseTypeMap = new LinkedHashMap<>();

        for (Object[] row : rows) {
            String officerId = (String) row[0];
            String fullName = (String) row[1];
            String caseTypeId = (String) row[2];
            Long count = row[3] != null ? ((Number) row[3]).longValue() : 0L;

            judgeInfoMap.putIfAbsent(officerId, new Object[]{officerId, fullName});
            judgeCaseTypeMap.putIfAbsent(officerId, new LinkedHashMap<>());

            if (caseTypeId != null) {
                judgeCaseTypeMap.get(officerId).merge(caseTypeId, count, Long::sum);
            }
        }

        List<String> judgeIds = new ArrayList<>(judgeInfoMap.keySet());

        // labels = tên thẩm phán
        List<String> labels = judgeInfoMap.values().stream()
                .map(info -> (String) info[1])
                .toList();

        // Mỗi loại án = 1 dataset
        List<BarChartDataset> datasets = new ArrayList<>();

        for (Map.Entry<String, String> entry : allCaseTypeNames.entrySet()) {
            String caseTypeId = entry.getKey();
            String caseTypeName = entry.getValue();

            BarChartDataset dataset = new BarChartDataset();
            dataset.setLabel(caseTypeName);
            dataset.setData(judgeIds.stream()
                    .map(id -> (double) judgeCaseTypeMap
                            .getOrDefault(id, Collections.emptyMap())
                            .getOrDefault(caseTypeId, 0L))
                    .toList());
            datasets.add(dataset);
        }

        BarChartResponse response = new BarChartResponse();
        response.setChartName("Thống kê án số lượng án của thẩm phán theo loại vụ án");
        response.setXAxisName("Thẩm phán");
        response.setYAxisName("Số lượng án");
        response.setLabels(labels);
        response.setDatasets(datasets);

        return response;
    }

    public PieChartResponse getPieByLegalCaseType(
            LocalDate startDate,
            LocalDate endDate
    ) {
        if(startDate == null || endDate == null)
            throw new AppException(ErrorCode.INVALID_PARAMETERS);

        if (startDate.isAfter(endDate))
            throw new AppException(ErrorCode.START_DATE_AFTER_END_DATE);

        // Query cũ — chỉ trả về loại có vụ
        List<Object[]> rows = legalCaseRepository.getPieByLegalCaseType(startDate, endDate);

        // Map kết quả từ query
        Map<String, Double> countMap = rows.stream()
                .collect(Collectors.toMap(
                        row -> (String) row[1], // legalCaseTypeName
                        row -> ((Number) row[2]).doubleValue()
                ));

        // Lấy tất cả loại án, fill 0 nếu không có trong kết quả
        List<LegalCaseType> allTypes = legalCaseTypeRepository.findAll(Sort.by("legalCaseTypeId"));

        List<String> labels = new ArrayList<>();
        List<Double> values = new ArrayList<>();

        for (LegalCaseType type : allTypes) {
            labels.add(type.getLegalCaseTypeName());
            values.add(countMap.getOrDefault(type.getLegalCaseTypeName(), 0.0));
        }

        PieChartResponse response = new PieChartResponse();
        response.setChartName("Thống kê án theo loại vụ án");
        response.setLabels(labels);
        response.setValues(values);
        return response;
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public PieChartResponse getPieByLegalRelationshipGroup(
            LocalDate startDate,
            LocalDate endDate
    ) {
        if (startDate == null || endDate == null)
            throw new AppException(ErrorCode.INVALID_PARAMETERS);

        if (startDate.isAfter(endDate))
            throw new AppException(ErrorCode.START_DATE_AFTER_END_DATE);

        List<Object[]> rows = legalCaseRepository.getPieByLegalRelationshipGroup(startDate, endDate);

        List<String> labels = new ArrayList<>();
        List<Double> values = new ArrayList<>();

        double totalWithMediator = 0;

        for (Object[] row : rows) {
            String groupName = row[0] != null
                    ? (String) row[0]
                    : "Không xác định";

            long withMediator = row[1] != null
                    ? (Long) row[1]
                    : 0L;

            long withoutMediator = row[2] != null
                    ? (Long) row[2]
                    : 0L;

            // Tổng án có hòa giải viên
            totalWithMediator += withMediator;

            // Án không có hòa giải viên theo từng nhóm QHPL
            labels.add(groupName);
            values.add((double) withoutMediator);
        }

        // Thêm phần án có hòa giải viên
        labels.addFirst("Có hòa giải viên");
        values.addFirst(totalWithMediator);

        PieChartResponse response = new PieChartResponse();
        response.setChartName("Thống kê án số lượng án theo nhóm quan hệ pháp luật");
        response.setLabels(labels);
        response.setValues(values);

        return response;
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public LineChartResponse getTimelineByLegalCaseType(
            LocalDate startDate,
            LocalDate endDate,
            String granularity
    ) {
        if (startDate == null || endDate == null)
            throw new AppException(ErrorCode.INVALID_PARAMETERS);

        if (startDate.isAfter(endDate))
            throw new AppException(ErrorCode.START_DATE_AFTER_END_DATE);

        List<Object[]> rows = switch (granularity) {
            case "MONTH"   -> legalCaseRepository.getTimelineByLegalCaseTypeMonth(startDate, endDate);
            case "QUARTER" -> legalCaseRepository.getTimelineByLegalCaseTypeQuarter(startDate, endDate);
            case "YEAR"    -> legalCaseRepository.getTimelineByLegalCaseTypeYear(startDate, endDate);
            default        -> throw new AppException(ErrorCode.INVALID_PARAMETERS);
        };

        Map<String, String> allCaseTypeNames = legalCaseTypeRepository
                .findAll(Sort.by("legalCaseTypeId"))
                .stream()
                .collect(Collectors.toMap(
                        LegalCaseType::getLegalCaseTypeId,
                        LegalCaseType::getLegalCaseTypeName,
                        (a, b) -> a,
                        LinkedHashMap::new
                ));

        Set<String> periodSet = new LinkedHashSet<>();
        // Map<caseTypeId, Map<period, count>>
        Map<String, Map<String, Long>> caseTypeTimeMap = new LinkedHashMap<>();

        for (Object[] row : rows) {
            String period;
            String caseTypeId;
            Long count;

            if ("YEAR".equals(granularity)) {
                // row: [year, caseTypeId, caseTypeName, count]
                period     = String.valueOf(((Number) row[0]).intValue());
                caseTypeId = (String) row[1];
                count      = row[3] != null ? ((Number) row[3]).longValue() : 0L;
            } else {
                // row: [year, month/quarter, caseTypeId, caseTypeName, count]
                int year    = ((Number) row[0]).intValue();
                int period2 = ((Number) row[1]).intValue();
                period      = "MONTH".equals(granularity)
                        ? String.format("%d-%02d", year, period2)
                        : String.format("%d-Q%d", year, period2);
                caseTypeId  = (String) row[2];
                count       = row[4] != null ? ((Number) row[4]).longValue() : 0L;
            }

            periodSet.add(period);

            if (caseTypeId != null) {
                caseTypeTimeMap
                        .computeIfAbsent(caseTypeId, k -> new LinkedHashMap<>())
                        .merge(period, count, Long::sum);
            }
        }

        List<String> labels = new ArrayList<>(periodSet);

        List<LineChartDataset> datasets = new ArrayList<>();
        for (Map.Entry<String, String> entry : allCaseTypeNames.entrySet()) {
            String caseTypeId   = entry.getKey();
            String caseTypeName = entry.getValue();

            LineChartDataset dataset = new LineChartDataset();
            dataset.setLabel(caseTypeName);
            dataset.setData(labels.stream()
                    .map(period -> (double) caseTypeTimeMap
                            .getOrDefault(caseTypeId, Collections.emptyMap())
                            .getOrDefault(period, 0L))
                    .toList());
            datasets.add(dataset);
        }

        LineChartResponse response = new LineChartResponse();
        response.setChartName("Thống kê số lượng án theo thời gian và loại vụ án");
        response.setXAxisName("Thời gian");
        response.setYAxisName("Số lượng án");
        response.setGranularity(granularity);
        response.setLabels(labels);
        response.setDatasets(datasets);

        return response;
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public LineChartResponse getTimelineByLegalRelationshipGroup(
            LocalDate startDate,
            LocalDate endDate,
            String granularity
    ) {
        if (startDate == null || endDate == null)
            throw new AppException(ErrorCode.INVALID_PARAMETERS);

        if (startDate.isAfter(endDate))
            throw new AppException(ErrorCode.START_DATE_AFTER_END_DATE);

        List<Object[]> rows = switch (granularity) {
            case "MONTH"   -> legalCaseRepository.getTimelineByLegalRelationshipGroupMonth(startDate, endDate);
            case "QUARTER" -> legalCaseRepository.getTimelineByLegalRelationshipGroupQuarter(startDate, endDate);
            case "YEAR"    -> legalCaseRepository.getTimelineByLegalRelationshipGroupYear(startDate, endDate);
            default        -> throw new AppException(ErrorCode.INVALID_PARAMETERS);
        };

        Map<String, String> allGroupNames = legalRelationshipGroupRepository
                .findAll(Sort.by("legalRelationshipGroupId"))
                .stream()
                .collect(Collectors.toMap(
                        LegalRelationshipGroup::getLegalRelationshipGroupId,
                        LegalRelationshipGroup::getLegalRelationshipGroupName,
                        (a, b) -> a,
                        LinkedHashMap::new
                ));

        Set<String> periodSet = new LinkedHashSet<>();
        Map<String, Long> withMediatorTimeMap    = new LinkedHashMap<>();
        Map<String, Long> withoutMediatorTimeMap = new LinkedHashMap<>();
        // Map<groupId, Map<period, withoutMediator>>
        Map<String, Map<String, Long>> groupTimeMap = new LinkedHashMap<>();

        for (Object[] row : rows) {
            String period;
            String groupId;
            Long withMediator;
            Long withoutMediator;

            if ("YEAR".equals(granularity)) {
                // row: [year, groupId, groupName, withMediator, withoutMediator]
                period          = String.valueOf(((Number) row[0]).intValue());
                groupId         = (String) row[1];
                withMediator    = row[3] != null ? ((Number) row[3]).longValue() : 0L;
                withoutMediator = row[4] != null ? ((Number) row[4]).longValue() : 0L;
            } else {
                // row: [year, month/quarter, groupId, groupName, withMediator, withoutMediator]
                int year    = ((Number) row[0]).intValue();
                int period2 = ((Number) row[1]).intValue();
                period      = "MONTH".equals(granularity)
                        ? String.format("%d-%02d", year, period2)
                        : String.format("%d-Q%d", year, period2);
                groupId         = (String) row[2];
                withMediator    = row[4] != null ? ((Number) row[4]).longValue() : 0L;
                withoutMediator = row[5] != null ? ((Number) row[5]).longValue() : 0L;
            }

            periodSet.add(period);

            withMediatorTimeMap.merge(period, withMediator, Long::sum);
            withoutMediatorTimeMap.merge(period, withoutMediator, Long::sum);

            if (groupId != null) {
                groupTimeMap
                        .computeIfAbsent(groupId, k -> new LinkedHashMap<>())
                        .merge(period, withoutMediator, Long::sum);
            }
        }

        List<String> labels = new ArrayList<>(periodSet);

        List<LineChartDataset> datasets = new ArrayList<>();

        LineChartDataset withMediatorDataset = new LineChartDataset();
        withMediatorDataset.setLabel("Có hòa giải viên");
        withMediatorDataset.setData(labels.stream()
                .map(period -> (double) withMediatorTimeMap.getOrDefault(period, 0L))
                .toList());
        datasets.add(withMediatorDataset);

        LineChartDataset withoutMediatorDataset = new LineChartDataset();
        withoutMediatorDataset.setLabel("Không có hòa giải viên");
        withoutMediatorDataset.setData(labels.stream()
                .map(period -> (double) withoutMediatorTimeMap.getOrDefault(period, 0L))
                .toList());
        datasets.add(withoutMediatorDataset);

        for (Map.Entry<String, String> entry : allGroupNames.entrySet()) {
            String groupId   = entry.getKey();
            String groupName = entry.getValue();

            LineChartDataset groupDataset = new LineChartDataset();
            groupDataset.setLabel(groupName);
            groupDataset.setData(labels.stream()
                    .map(period -> (double) groupTimeMap
                            .getOrDefault(groupId, Collections.emptyMap())
                            .getOrDefault(period, 0L))
                    .toList());
            datasets.add(groupDataset);
        }

        LineChartResponse response = new LineChartResponse();
        response.setChartName("Thống kê số lượng án theo thời gian và nhóm quan hệ pháp luật");
        response.setXAxisName("Thời gian");
        response.setYAxisName("Số lượng án");
        response.setGranularity(granularity);
        response.setLabels(labels);
        response.setDatasets(datasets);

        return response;
    }
}
