package com.owus;
/*
 * author          :
 * date            : 2022-06-19
 * time            : 오후 3:25
 * description     :
 * ================================================
 */

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")

public class JsonTests {


    @Test
    public void parsingTest() {

        String aa = "{\"detectIntentResponseId\": \"a7441c09-bee8-43ef-9992-8fcd9e531f48\",\"pageInfo\":{\"currentPage\": \"projects/owus-chatbot-dev/locations/asia-northeast1/agents/3b004f92-a34a-453d-b9b4-3f5250395096/flows/e2a3167a-8beb-4e8e-b963-25ee69dea78d/pages/96ea98e3-d39a-42b2-8c35-743a2300622e\",\"displayName\": \"사용자인증Webhook페이지\"},\"sessionInfo\":{\"session\": \"projects/owus-chatbot-dev/locations/asia-northeast1/agents/3b004f92-a34a-453d-b9b4-3f5250395096/sessions/73795611\",\"parameters\":{\"email\": \"123@12.com\",\"reg_withdraw\": \"상태\",\"yes_no\": \"yes\"}},\"fulfillmentInfo\":{\"tag\": \"reqAuthEmail\"},\"payload\":{\"messageSource\": \"1\",\"attachments\": [],\"groupId\": \"73795611\",\"from\": \"hXSznEPuyi9NfkNZRuDguhepfmRKSaVu\",\"botId\": \"owus-jyigv\",\"applicationId\": \"2fede9011e390ab0dae39795757a7b196\"},\"text\": \"확인\\n이메일 : 123@12.com\",\"languageCode\": \"ko\"}";

        Gson gson = new Gson();

        JsonObject jo = JsonParser.parseString(aa).getAsJsonObject();

        log.info(jo.getAsJsonObject("sessionInfo").getAsJsonObject("parameters").get("email").getAsString());
        log.info(jo.getAsJsonObject("fulfillmentInfo").get("tag").getAsString());

    }

}
