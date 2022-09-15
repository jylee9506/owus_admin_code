package com.owus.admin.diver.member;

import com.owus.admin.domain.diver.member.TutorVO;
import com.owus.common.dto.ListDTO;
import com.owus.admin.mapper.diver.member.TutorMapper;
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
public class tutorMapperTests {

    @Autowired(required = false)
    private TutorMapper tutorMapper;


    @Test
    public void test1(){
        ListDTO listDTO = new ListDTO();
        List<TutorVO> voList = tutorMapper.selectList(listDTO);
        log.info(voList);
    }

    @Test
    public void test2(){

     int total=tutorMapper.getTotal(new ListDTO());

     log.info(total);
    }
    @Test
    public void test3(){
       tutorMapper.selectOne(16);
    }
    @Test
    public void test4(){
        TutorVO tutorVO = TutorVO.builder()
                .mno(16)
                .state(2)
                .build();

        tutorMapper.approve(tutorVO);

        log.info(tutorVO);
    }
    @Test
    public void test5(){

        TutorVO tutorVO = tutorMapper.getOne(16);
        log.info(tutorVO);
    }
}
