package com.owus.shop.service.mypage.faq;
/*
 * author          :
 * date            : 2022-06-13
 * time            : 오후 2:57
 * description     :
 * ================================================
 */

import com.owus.shop.dto.mypage.faq.FaqDTO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")

public class ShopFAQServiceTests {

    @Autowired
    private ShopFAQService shopFAQService;

    @Test
    public void testGetList() {

        log.info(shopFAQService.getListResp(null, 167));

    }

    @Test
    public void testWrite() {
        FaqDTO dto = new FaqDTO();
        dto.setTitle("aaaaaaa");
        dto.setContent("bbbbbbbb");
        dto.setMno(167);

        shopFAQService.writeOne(dto);

    }


}
