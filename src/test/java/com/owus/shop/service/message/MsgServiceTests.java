package com.owus.shop.service.message;
/*
 * author          :
 * date            : 2022-06-22
 * time            : 오후 7:44
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
public class MsgServiceTests {
    @Autowired
    private MsgService msgService;

    @Test
    public void getList() {
        MsgListDTO msgListDTO = new MsgListDTO();

        log.info(msgService.getList(msgListDTO));

    }
}
