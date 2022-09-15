package com.owus.chatbot.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.owus.chatbot.service.ChatBotService;
import com.owus.chatbot.util.RichMsgMaker;
import com.owus.chatbot.util.ResponseRegState;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RequiredArgsConstructor
@Log4j2
@RestController
@RequestMapping(value = "/bot", produces = "application/text; charset=utf-8")
public class ChatBotController {
    private final ChatBotService chatBotService;
    private final Gson gson = new Gson();

    @PostMapping("")
    public ResponseEntity<String> webhook(@RequestBody Map<String, Object> map) throws ChatBotService.NotFoundEmailException {
        JsonObject jo = gson.toJsonTree(map).getAsJsonObject();

        String fulfillmentInfo = jo.getAsJsonObject("fulfillmentInfo").get("tag").getAsString();

        log.info("============= bot fulfillment");
        log.info(jo);

        log.info("============= fulfillmentInfo");
        log.info(fulfillmentInfo); // reqAuthEmail

        String email = jo.getAsJsonObject("sessionInfo").getAsJsonObject("parameters").get("email").getAsString();
        log.info("============= email");
        log.info(email);

        String rst = chatBotService.verifyEmail(email);

        return ResponseEntity.status(HttpStatus.OK).body(rst);
    }
}
