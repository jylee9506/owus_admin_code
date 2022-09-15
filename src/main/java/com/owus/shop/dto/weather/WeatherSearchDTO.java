package com.owus.shop.dto.weather;
/*
 * author          :
 * date            : 2022-05-15
 * time            : 오후 2:35
 * description     :
 * ================================================
 */

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WeatherSearchDTO {

    private Integer year;
    private Integer month;
    private Integer day;
    private Integer geoID;

    public LocalDateTime getDateTime() {
        return LocalDate.of(year, month, day == null ? 1 : day).atStartOfDay();
    }
}
