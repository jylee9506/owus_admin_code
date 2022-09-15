package com.owus.shop.dto.weather;
/*
 * author          :
 * date            : 2022-05-14
 * time            : 오후 8:54
 * description     :
 * ================================================
 */

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class WeatherMonthDTO {

//    private List<Double> airTemperature80m;
//    private List<Double> waterTemperature;
//    private List<Double> waveHeight;
//    private List<Double> cloudCover;
//    private List<Double> precipitation;
//    private List<Double> windSpeed;

    private String airTemperature80m;
    private String cloudCover;
    private String precipitation;
    private String waterTemperature;
    private String waveHeight;
    private String windSpeed;
    private LocalDate pubDate;
    private Integer geoID;

    public String getStringPubDate() {
        return pubDate.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
    }

}
