package com.owus.admin.controller.shop.ask;
/*
 * author          :
 * date            : 2022-05-23
 * time            : 오전 10:39
 * description     :
 * ================================================
 */

import com.owus.admin.controller.ask.AskBaseController;
import com.owus.admin.dto.ask.AskControllerDTO;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;
import java.util.TreeMap;

@Log4j2
@Controller
@RequestMapping("/admin/shop/ask")
public class ShopAskController extends AskBaseController {
    public ShopAskController() {
        super(AskControllerDTO.builder()
                .category(new TreeMap<>(Map.of(11L, "신규관련", 12L, "상품관련", 13L, "해지관련")))
                .base("/admin/shop/ask")
                .mtype(1)
                .build()
        );
    }
}
