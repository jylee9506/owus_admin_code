package com.owus.common.interceptor;
/*
 * author          :
 * date            : 2022-05-02
 * time            : 오전 12:12
 * description     :
 * ================================================
 */

import lombok.extern.log4j.Log4j2;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Log4j2
public class NoCacheInterceptor implements HandlerInterceptor {
    // 조회, 수정, 삭제 페이지에 대한 브라우저 캐싱 방지
    // 네이버 카페 작동방식 참고
    // servlet-context.xml에 interceptors Mapping

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        log.info("interceptor.......");

        response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT");
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        response.setHeader("Pragma", "no-cache");

        return false;
    }


}
