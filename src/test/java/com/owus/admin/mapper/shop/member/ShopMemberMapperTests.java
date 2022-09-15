package com.owus.admin.mapper.shop.member;
/*
 * author          :
 * date            : 2022-05-29
 * time            : 오전 11:02
 * description     :
 * ================================================
 */

import com.owus.admin.domain.shop.member.ShopMemberVO;
import com.owus.common.dto.ListDTO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")

public class ShopMemberMapperTests {
    @Autowired(required = false)
    private ShopMemberMapper mapper;

    @Test
    public void testGetList() {
        ListDTO listDTO = new ListDTO();
        listDTO.setType("n");
        listDTO.setKeyword("6828852728");

        List<ShopMemberVO> voList = mapper.selectList(listDTO);

        voList.forEach(log::info);

    }
}
