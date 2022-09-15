package com.owus.shop.mapper.mypage.info;

import com.owus.admin.domain.diver.member.TutorVO;
import com.owus.admin.dto.diver.member.TutorDTO;
import com.owus.common.domain.AttachFileVO;
import com.owus.common.dto.ListDTO;
import com.owus.shop.domain.mypage.info.FacilityVO;
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
public class InfoDetailsMapperTests {

    @Autowired(required = false)
    private InfoDetailsMapper infoDetailsMapper;

    @Autowired(required = false)
    private InfoFileMapper infoFileMapper;

    @Test
    public void selectListTest(){
        List<TutorVO> voList = infoDetailsMapper.selectList(167);
        voList.stream().forEach(tutorVO -> log.info(tutorVO));
    }


    @Test
    public void selectFacilityTest(){
        List<FacilityVO> voList = infoDetailsMapper.selectListFacility(167);
        voList.stream().forEach(facilityVO -> log.info(facilityVO));
    }

    @Test
    public void selectFilesTest(){
        List<AttachFileVO> voList = infoFileMapper.selectFiles(167);
        voList.stream().forEach(attachFileVO -> {log.info(attachFileVO);});
    }

    @Test
    public void deleteFilesTest(){
        infoFileMapper.delete(167);
    }

}
