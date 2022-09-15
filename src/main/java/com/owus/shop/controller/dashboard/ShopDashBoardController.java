package com.owus.shop.controller.dashboard;
/*
 * author          :
 * date            : 2022-05-06
 * time            : 오후 7:49
 * description     :
 * ================================================
 */

import com.owus.security.dto.MemberDTO;
import com.owus.shop.dto.dashboard.RecentRsvDTO;
import com.owus.shop.dto.dashboard.ReservationSummaryDTO;
import com.owus.shop.dto.dashboard.ResponseRsvSummaryDTO;
import com.owus.shop.service.dashboard.ShopDashBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Log4j2
@Controller
@RequestMapping("/shop")
@RequiredArgsConstructor
public class ShopDashBoardController {

    private final ShopDashBoardService shopDashBoardService;

    @GetMapping(value = {"", "/"})
    public String root() {
        return "/shop/dashboard/main";
    }

    @GetMapping("/dash/summary")
    @ResponseBody
    public List<ReservationSummaryDTO> summary(@AuthenticationPrincipal MemberDTO auth) {

        List<ReservationSummaryDTO> dtoList = shopDashBoardService.summary(auth.getMno());

        return dtoList;
    }

    @GetMapping("/dash/recentRsv")
    @ResponseBody
    public List<RecentRsvDTO> recentRsv(@AuthenticationPrincipal MemberDTO auth) {
        List<RecentRsvDTO> dtoList = shopDashBoardService.recentRsv(auth.getMno());

        return dtoList;
    }
}
