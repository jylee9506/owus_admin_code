package com.owus.shop.service.weather;
/*
 * author          :
 * date            : 2022-06-02
 * time            : 오후 8:05
 * description     :
 * ================================================
 */

import com.owus.shop.domain.weather.WeatherVO;
import com.owus.shop.dto.weather.WeatherSearchDTO;
import com.owus.shop.dto.weather.WeatherMonthDTO;
import com.owus.shop.mapper.weather.WeatherMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class WeatherServiceImpl implements WeatherService{
    private final WeatherMapper weatherMapper;
    private final ModelMapper modelMapper;

    @Override
    public List<WeatherMonthDTO> getListMonth(WeatherSearchDTO weatherSearchDTO) {
        List<WeatherVO> voList = weatherMapper.selectListMonth(weatherSearchDTO);

        List<WeatherMonthDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, WeatherMonthDTO.class))
                .collect(Collectors.toList());

        return dtoList;
    }

    @Override
    public List<WeatherMonthDTO> getListWeek(WeatherSearchDTO weatherSearchDTO) {
        List<WeatherVO> voList = weatherMapper.selectListWeek(weatherSearchDTO);

        List<WeatherMonthDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, WeatherMonthDTO.class))
                .collect(Collectors.toList());

        return dtoList;
    }
}
