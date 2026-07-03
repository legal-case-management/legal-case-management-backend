package com.qlatakv9dt.dto.response.statistic;

import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@SuperBuilder(toBuilder = true)
@FieldDefaults(level = AccessLevel.PRIVATE)
@AllArgsConstructor
public class BarChartResponse extends ChartResponse {
    String xAxisName;
    String yAxisName;
    List<String> labels;
    List<BarChartDataset> datasets;
}
