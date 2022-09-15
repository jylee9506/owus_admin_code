package com.owus.security.controller;
/*
 * author          :
 * date            : 2022-05-16
 * time            : 오전 9:49
 * description     :
 * ================================================
 */

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Log4j2
@Controller

public class SecurityController {
    @GetMapping("/sign")
    public void sign() {}

    @GetMapping("/error/accessError")
    public void accessError() {}

    @GetMapping("/error/loginError")
    public void loginError() {}

}
