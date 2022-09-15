package com.owus.admin.controller.dashboard;
/*
 * author          :
 * date            : 2022-05-06
 * time            : 오후 7:49
 * description     :
 * ================================================
 */

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminDashBoardController {

    @GetMapping(value = {"", "/"})
    public String getList() {
        return "/admin/dashboard/main";
    }
}
