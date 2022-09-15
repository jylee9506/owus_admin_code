package com.owus.shop.domain.weather;

import lombok.*;

import java.time.LocalDate;

/*
 * author          :
 * date            : 2022-06-02
 * time            : 오후 7:52
 * description     :
 * ================================================
 */
@Getter
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class WeatherVO {

    private String airTemperature80m;
    private String cloudCover;
    private String precipitation;
    private String waterTemperature;
    private String waveHeight;
    private String windSpeed;
    private LocalDate pubDate;
    private Integer geoID;
}
