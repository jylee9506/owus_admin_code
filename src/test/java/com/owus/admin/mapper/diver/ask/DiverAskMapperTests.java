package com.owus.admin.mapper.diver.ask;
/*
 * author          :
 * date            : 2022-05-23
 * time            : 오후 12:28
 * description     :
 * ================================================
 */

import com.owus.common.domain.ReplyVO;
import com.owus.admin.domain.ask.AskVO;
import com.owus.common.dto.ListDTO;
import com.owus.admin.mapper.ask.AskMapper;
import com.owus.admin.mapper.common.ReplyMapper;
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

public class DiverAskMapperTests {

    @Autowired(required = false)
    private AskMapper mapper;
    @Autowired(required = false)
    private ReplyMapper replyMapper;

    @Test
    public void testGetList() {
        ListDTO listDTO = new ListDTO();

//        listDTO.setKeyword("예약");
//        listDTO.setType("t");

        listDTO.setCategory(21L);

         mapper.selectList(listDTO).forEach(log::info);
    }

    @Test
    public void testGetOne() {
        AskVO vo = mapper.selectOne(788);

        log.info(vo);
    }

    @Test
    public void testReplyList() {
        ListDTO listDTO = new ListDTO();
        listDTO.setPage(2);

        List<ReplyVO> voList = replyMapper.selectList(788, listDTO);

        voList.forEach(log::info);


    }

    @Test
    public void testInsert() {
        AskVO vo = AskVO.builder().mno(1).title("111111").content("222222222").category(22L).build();

        mapper.insert(vo);
    }

}
