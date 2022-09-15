package com.owus.shop.service.weather;
/*
 * author          :
 * date            : 2022-06-02
 * time            : 오후 8:05
 * description     :
 * ================================================
 */

import com.owus.shop.dto.weather.WeatherSearchDTO;
import com.owus.shop.dto.weather.WeatherMonthDTO;

import java.util.List;

public interface WeatherService {

    List<WeatherMonthDTO> getListMonth(WeatherSearchDTO weatherSearchDTO);
    List<WeatherMonthDTO> getListWeek(WeatherSearchDTO weatherSearchDTO);

}
