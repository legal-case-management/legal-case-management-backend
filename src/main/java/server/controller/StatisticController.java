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

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/statistic")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class StatisticController {
    StatisticService statisticService;
    @GetMapping("/judge")
    public ApiResponse<BarChartResponse> getJudgeStatistic(
            @RequestParam(defaultValue = "2025-10-01") LocalDate startDate,
            @RequestParam(defaultValue = "2026-09-30") LocalDate endDate
    ) {
        return ApiResponse.<BarChartResponse>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(statisticService.getJudgeStatistics(startDate, endDate))
                .build();
    }
}
