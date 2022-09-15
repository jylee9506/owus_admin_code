package com.owus.security.handler;
/*
 * author          :
 * date            : 2022-05-16
 * time            : 오전 10:53
 * description     :
 * ================================================
 */

import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;

@Log4j2

public class CustomLoginFailHandler implements AuthenticationFailureHandler {
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        Arrays.stream(exception.getStackTrace()).forEach(log::info);

        response.sendRedirect("/error/loginError");
    }
}
