package com.owus.admin;
/*
 * author          :
 * date            : 2022-06-04
 * time            : 오후 3:28
 * description     :
 * ================================================
 */

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")

public class NormalTests {

    @Test
    public void testOne() {

//        AskListDTO listDTO = new AskListDTO();
//
//        AskListDTO.builder().
//        log.info(listDTO.getPage());


    }

}
