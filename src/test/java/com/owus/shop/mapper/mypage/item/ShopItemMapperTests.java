package com.owus.shop.mapper.mypage.item;
/*
 * author          :
 * date            : 2022-06-07
 * time            : 오후 3:58
 * description     :
 * ================================================
 */

import com.owus.admin.domain.shop.member.ShopItemVO;
import com.owus.common.domain.AttachFileVO;
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

public class ShopItemMapperTests {

    @Autowired(required = false)
    private ShopItemMapper shopItemMapper;

    @Autowired(required = false)
    private ShopItemFileMapper shopItemFileMapper;

    @Test
    public void testGetList() {
        ListDTO listDTO = new ListDTO();

        Integer mno = 167;

        shopItemMapper.selectList(listDTO, mno).forEach(log::info);



    }

    @Test
    public void testGetOne() {
        ShopItemVO vo = shopItemMapper.selectOne(1);
        List<AttachFileVO> avoList = shopItemFileMapper.selectFiles(1);

        log.info(avoList);
    }

}
