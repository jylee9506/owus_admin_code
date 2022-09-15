package com.owus.chatbot.controller.advice;
/*
 * author          :
 * date            : 2022-06-19
 * time            : 오후 4:01
 * description     :
 * ================================================
 */

import com.owus.chatbot.service.ChatBotService;
import com.owus.chatbot.util.RichMsgMaker;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Log4j2
@RestControllerAdvice
public class BasicRestControllerAdvice {

    @ExceptionHandler(ChatBotService.NotFoundEmailException.class)
    @ResponseStatus(HttpStatus.EXPECTATION_FAILED)
    public ResponseEntity<String> notFoundEmailHandler() {

        return ResponseEntity
                .status(HttpStatus.EXPECTATION_FAILED)
                .body(RichMsgMaker.INSTANCE.text("이메일이 존재하지 않습니다"));
    }
}
