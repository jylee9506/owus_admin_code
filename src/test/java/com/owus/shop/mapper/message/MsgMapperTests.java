package com.owus.shop.mapper.message;
/*
 * author          :
 * date            : 2022-06-22
 * time            : 오후 6:59
 * description     :
 * ================================================
 */

import com.owus.shop.dto.message.MsgListDTO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class MsgMapperTests {

    @Autowired(required = false)
    private MsgMapper msgMapper;

    @Test
    public void getFromList() {
        MsgListDTO msgListDTO = new MsgListDTO();
        msgListDTO.setMno(160);
        msgListDTO.setType("c");
        msgListDTO.setKeyword("1231111");

        log.info(msgListDTO);

        log.info(msgMapper.selectList(msgListDTO));
    }
}
