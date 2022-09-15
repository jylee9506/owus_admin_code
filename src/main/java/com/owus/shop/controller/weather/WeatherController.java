package com.owus.shop.controller.weather;
/*
 * author          :
 * date            : 2022-05-14
 * time            : 오후 12:45
 * description     :
 * ================================================
 */


import com.google.gson.Gson;

import com.owus.shop.dto.weather.WeatherSearchDTO;
import com.owus.shop.dto.weather.WeatherMonthDTO;
import com.owus.shop.service.weather.WeatherService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;
import java.util.stream.Collectors;

@Log4j2
@Controller
@RequestMapping("/shop/weather")
@RequiredArgsConstructor
public class WeatherController {
    private final Gson gson;
    private final WeatherService weatherService;

    @GetMapping(value = {"/", ""})
    public String month(){

        log.info("------------ month");

        return "/shop/weather/main";

    }

    @GetMapping(value = {"/icon"})
    public void icon(){
        log.info("------------ icon");
    }

    @GetMapping("/data/month/{year}/{month}/{geoID}")
    @ResponseBody
    public Map<String, WeatherMonthDTO> dataMonth(WeatherSearchDTO weatherSearchDTO) {
        log.info("rest month");
        log.info(weatherSearchDTO);

        Map<String, WeatherMonthDTO> map = weatherService.getListMonth(weatherSearchDTO).stream()
                .collect(Collectors.toMap(WeatherMonthDTO::getStringPubDate, dto->dto));

        return map;



//        try(Reader reader = new FileReader("D:\\data\\develop\\py.win\\summary_month.json")) {
//            return gson.fromJson(reader, new TypeToken<Map<String, WeatherMonthDTO>>() {}.getType());
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return Map.of("000000", new WeatherMonthDTO());
    }

    @GetMapping("/data/week/{year}/{month}/{day}/{geoID}")
    @ResponseBody
    public Map<String, WeatherMonthDTO> dataWeek(WeatherSearchDTO weatherSearchDTO) {
        log.info("rest week");
        log.info(weatherSearchDTO);

        Map<String, WeatherMonthDTO> map = weatherService.getListWeek(weatherSearchDTO).stream()
                .collect(Collectors.toMap(WeatherMonthDTO::getStringPubDate, dto->dto));

        log.info(map);

        return map;

//        try(Reader reader = new FileReader("D:\\data\\develop\\py.win\\summary_week.json")) {
//            return gson.fromJson(reader, new TypeToken<Map<String, WeatherMonthDTO>>() {}.getType());
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return Map.of("000000", new WeatherMonthDTO());
    }

}
