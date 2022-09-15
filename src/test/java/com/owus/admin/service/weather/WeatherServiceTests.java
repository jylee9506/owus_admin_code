package com.owus.admin.service.weather;
/*
 * author          :
 * date            : 2022-06-02
 * time            : 오후 8:36
 * description     :
 * ================================================
 */

import com.owus.shop.dto.weather.WeatherSearchDTO;
import com.owus.shop.service.weather.WeatherService;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class WeatherServiceTests {

    @Autowired
    private WeatherService weatherService;

    @Test
    public void testGetListMonth() {
        WeatherSearchDTO dto = new WeatherSearchDTO();
        dto.setGeoID(1);

        weatherService.getListMonth(dto).forEach(log::info);

    }

    @Test
    public void testGetListWeek() {
        WeatherSearchDTO dto = new WeatherSearchDTO();
        dto.setGeoID(1);

        weatherService.getListWeek(dto).forEach(log::info);

    }
}
