package com.owus.admin.config;
/*
 * author          :
 * date            : 2022-06-02
 * time            : 오후 8:01
 * description     :
 * ================================================
 */

import com.google.gson.Gson;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class GsonConfig {

    @Bean
    public Gson getGson() {
        return new Gson();
    }
}
