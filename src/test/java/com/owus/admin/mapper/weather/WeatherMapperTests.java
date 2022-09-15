package com.owus.admin.mapper.weather;
/*
 * author          :
 * date            : 2022-06-02
 * time            : 오후 7:57
 * description     :
 * ================================================
 */

import com.owus.shop.mapper.weather.WeatherMapper;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class WeatherMapperTests {
    @Autowired(required = false)
    private WeatherMapper weatherMapper;

    @Test
    public void testSelectMonth() {

//        weatherMapper.selectListMonth(1).forEach(log::info);

    }

}
