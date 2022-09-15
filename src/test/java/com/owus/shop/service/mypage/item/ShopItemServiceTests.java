package com.owus.shop.service.mypage.item;
/*
 * author          :
 * date            : 2022-06-08
 * time            : 오전 9:15
 * description     :
 * ================================================
 */

import com.google.cloud.dialogflow.cx.v3.WebhookResponse;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.owus.admin.dto.shop.member.ShopItemDTO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.Map;
import java.util.Optional;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")

public class ShopItemServiceTests {

    @Autowired
    private ShopItemService shopItemService;

    @Test
    public void getOne() {
        ShopItemDTO dto = shopItemService.getOne(3);

//        dto.getUploads();
//        dto.getUploads().

//        String t = Optional.ofNullable(dto.getUploads().get(3).getLink()).orElseGet(() -> "dsdsa");

        log.info(dto);

    }

    @Test
    public void mapTest() {

//        WebhookResponse.FulfillmentResponse.newBuilder().

//        WebhookResponse.newBuilder().setPayload()



//        Gson gson = new Gson();
//        gson.



//        JsonArray ja = new JsonArray();
//        ja.add("일치하는 이메일이 없습니다.");
//
//        JsonObject text2 = new JsonObject();
//        text2.add("text", ja);
//
//        JsonObject text = new JsonObject();
//        text.add("text", text2);
//
//        JsonArray ja2 = new JsonArray();
//        ja2.add(text);
//
//        JsonObject msg = new JsonObject();
//        msg.add("messages", ja2);
//
//        JsonObject fulfillment_response = new JsonObject();
//        fulfillment_response.add("fulfillment_response", msg);
//
//        Gson gson = new Gson();
//
//        log.info(gson.toJson(fulfillment_response));

    }

}
