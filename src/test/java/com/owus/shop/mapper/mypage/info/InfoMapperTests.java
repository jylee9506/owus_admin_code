package com.owus.shop.mapper.mypage.info;


import com.owus.admin.domain.diver.member.TutorVO;
import com.owus.admin.domain.shop.member.ShopMemberVO;

import com.owus.shop.domain.mypage.info.FacilityVO;
import com.owus.shop.dto.mypage.info.ListDTO;
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
public class InfoMapperTests {

    @Autowired(required = false)
    private InfoMapper infoMapper;


    @Test
    public void selectOneTest(){
//        ShopMemberVO shopMemberVO = infoMapper.selectOne(1);
//        log.info(shopMemberVO);
    }

    @Test
    public void updateTest(){
        TutorVO tutorVO = TutorVO.builder()
                        .mno(167)
                        .name("믹스다이빙")
                        .build();
        infoMapper.update(tutorVO);
    }
    @Test
    public void selecTutorListTest(){
        ListDTO listDTO = new ListDTO();
        List<TutorVO> voList = infoMapper.selectTutorList(listDTO);
        voList.stream().forEach(tutorVO -> {
            log.info(tutorVO);
        });
    }

    @Test
    public void totalTest(){
        ListDTO listDTO = new ListDTO();
        Integer total = infoMapper.getTotal(listDTO);
        log.info(total);
    }

    @Test
    public void TutorListofShopTest(){
        List<TutorVO> voList = infoMapper.selectListOfShop(167);
        voList.stream().forEach(tutorVO -> log.info(tutorVO));
    }

    @Test
    public void FacilityListTest(){

        List<FacilityVO> voList = infoMapper.selectFacilityList();
        voList.stream().forEach(facilityVO -> log.info(facilityVO));
    }

    @Test
    public void insertFacilityTest(){
        infoMapper.insertFacilityOfShop(167,2);
    }

    @Test
    public void deleteFacilityTest(){
        infoMapper.deleteFacility(167,1);
    }



}
