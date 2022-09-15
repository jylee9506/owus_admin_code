package com.owus.shop.service.dashboard;
/*
 * author          :
 * date            : 2022-06-21
 * time            : 오전 12:35
 * description     :
 * ================================================
 */

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class ShopDashBoardServiceTests {

    @Autowired
    private ShopDashBoardService shopDashBoardService;

    @Test
    public void getSum() {

        shopDashBoardService.summary(167).forEach(log::info);

    }

    @Test
    public void getRecentRsv() {
        log.info(shopDashBoardService.recentRsv(167));

    }
}
