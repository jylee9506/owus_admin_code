package com.owus.admin.controller.advice;
/*
 * author          :
 * date            : 2022-06-07
 * time            : 오후 11:13
 * description     :
 * ================================================
 */

import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

@Log4j2
//@ControllerAdvice
public class CustomControllerAdvice {

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String notFount() {
        return "/error/404";
    }

}
