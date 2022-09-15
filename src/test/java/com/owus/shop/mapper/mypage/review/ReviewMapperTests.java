package com.owus.shop.mapper.mypage.review;

import com.owus.common.dto.ListDTO;
import com.owus.shop.domain.mypage.review.ReplyVO;
import com.owus.shop.domain.mypage.review.ReviewVO;

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
public class ReviewMapperTests {

    @Autowired(required = false)
    private ReviewMapper reviewMapper;

    @Autowired(required = false)
    private ReviewReplyMapper reviewReplyMapper;

    @Test
    public void selectTest(){
        ListDTO listDTO = new ListDTO();
        List<ReviewVO> voList = reviewMapper.selectList(listDTO);
        voList.forEach(vo -> log.info(vo));
    }

    @Test
    public void getTotal(){
        ListDTO listDTO = new ListDTO();
        Integer total = reviewMapper.getTotal(listDTO);
        log.info(total);
    }

    @Test
    public void selectOneTest(){

        ReviewVO reviewVO =  reviewMapper.selectOne(12);
        log.info(reviewVO);
    }

    @Test
    public void insertTest(){
        String answer = "고객님 불편을 드려서 죄송합니다. 다음에 방문하실 때 좀더 친절하게 응대하겠습니다.";
        ReplyVO replyVO = ReplyVO.builder().mno(98).rno(1).content(answer).build();
        reviewReplyMapper.insert(replyVO);
        log.info(replyVO);
    }

    @Test
    public void selectOneReplyTest(){

        ReplyVO replyVO =  reviewReplyMapper.selectOne(5);
        log.info(replyVO);
    }

    @Test
    public void delete(){
       reviewReplyMapper.delete(5);

    }

    @Test
    public void update(){
        reviewMapper.updateState(3,0);
    }

}
