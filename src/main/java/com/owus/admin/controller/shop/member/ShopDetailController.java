package com.owus.admin.controller.shop.member;
/*
 * author          :
 * date            : 2022-05-30
 * time            : 오후 4:56
 * description     :
 * ================================================
 */

import com.owus.admin.dto.shop.member.ShopDpointDTO;
import com.owus.admin.dto.shop.member.ShopItemDTO;
import com.owus.admin.service.shop.member.ShopDetailService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Log4j2
@RestController
@RequiredArgsConstructor
@RequestMapping("/details")
public class ShopDetailController {
    private final ShopDetailService shopDetailService;

    @GetMapping("/items/{mno}")
    public List<ShopItemDTO> itemList(@PathVariable("mno") Integer mno) {
        return shopDetailService.getItems(mno);
    }

    @GetMapping("/dpoints/{mno}")
    public List<ShopDpointDTO> dpointList(@PathVariable("mno") Integer mno) {
        return shopDetailService.getDpoints(mno);
    }

    @GetMapping("/dpoints/one/{dpno}")
    public List<ShopDpointDTO> dpoint(@PathVariable("dpno") Integer dpno) {
        return shopDetailService.getDpoint(dpno);
    }
}
