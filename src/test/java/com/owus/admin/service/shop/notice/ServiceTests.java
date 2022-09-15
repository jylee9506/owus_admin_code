package com.owus.admin.service.shop.notice;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class ServiceTests {

    @Autowired
    NoticeService noticeService;

    @Test
    public void selectTest(){
//        ListDTO listDTO = new ListDTO();
//        ListResponseDTO<NoticeDTO> dtoList = noticeService.getList(listDTO);
//        log.info(dtoList.getDtoList());

    }
}
