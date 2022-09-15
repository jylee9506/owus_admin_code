package com.owus.shop.mapper.weather;
/*
 * author          :
 * date            : 2022-06-02
 * time            : 오후 7:53
 * description     :
 * ================================================
 */

import com.owus.shop.domain.weather.WeatherVO;
import com.owus.shop.dto.weather.WeatherSearchDTO;

import java.util.List;

public interface WeatherMapper {

    List<WeatherVO> selectListMonth(WeatherSearchDTO weatherSearchDTO);
    List<WeatherVO> selectListWeek(WeatherSearchDTO weatherSearchDTO);


}
