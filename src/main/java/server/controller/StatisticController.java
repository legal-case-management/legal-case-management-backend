package server.controller;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import server.dto.response.ApiResponse;
import server.dto.response.mediator.MediatorResponse;
import server.dto.response.statistic.BarChartResponse;
import server.service.StatisticService;
import server.utils.DateUtils;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/statistic")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class StatisticController {
    StatisticService statisticService;
    @GetMapping("/judge/legal-relationship-group")
    public ApiResponse<BarChartResponse> getStatisticsJudgeByLegalRelationshipGroup(
            @RequestParam(required = false) LocalDate startDate,
            @RequestParam(required = false) LocalDate endDate,
            @RequestParam(required = false) Integer year
    ) {
        if (
                (year == null && (startDate == null || endDate == null))
                || (year != null && (startDate != null || endDate != null))
        ) {
            return ApiResponse.<BarChartResponse>builder()
                    .success(false)
                    .status(400)
                    .message("Thống kê phải theo năm hoặc theo khoảng thời gian")
                    .build();
        }

        if (year != null)
            return ApiResponse.<BarChartResponse>builder()
                    .success(true)
                    .status(200)
                    .message("Thành công")
                    .data(statisticService.getStatisticsJudgeByLegalRelationshipGroup(
                            DateUtils.getMilestoneStartDate(year),
                            DateUtils.getMilestoneEndDate(year)
                    ))
                    .build();
        else
            return ApiResponse.<BarChartResponse>builder()
                    .success(true)
                    .status(200)
                    .message("Thành công")
                    .data(statisticService.getStatisticsJudgeByLegalRelationshipGroup(startDate, endDate))
                    .build();
    }

    @GetMapping("/judge/legal-case-type")
    public ApiResponse<BarChartResponse> getStatisticsJudgeByLegalLegalCaseType(
            @RequestParam(required = false) LocalDate startDate,
            @RequestParam(required = false) LocalDate endDate,
            @RequestParam(required = false) Integer year
    ) {
        if (
                (year == null && (startDate == null || endDate == null))
                        || (year != null && (startDate != null || endDate != null))
        ) {
            return ApiResponse.<BarChartResponse>builder()
                    .success(false)
                    .status(400)
                    .message("Thống kê phải theo năm hoặc theo khoảng thời gian")
                    .build();
        }

        if (year != null)
            return ApiResponse.<BarChartResponse>builder()
                    .success(true)
                    .status(200)
                    .message("Thành công")
                    .data(statisticService.getJudgeStatisticsByLegalCaseType(
                            DateUtils.getMilestoneStartDate(year),
                            DateUtils.getMilestoneEndDate(year)
                    ))
                    .build();
        else
            return ApiResponse.<BarChartResponse>builder()
                    .success(true)
                    .status(200)
                    .message("Thành công")
                    .data(statisticService.getJudgeStatisticsByLegalCaseType(startDate, endDate))
                    .build();
    }
}
