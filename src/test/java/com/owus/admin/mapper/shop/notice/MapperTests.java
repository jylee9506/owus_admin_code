package com.owus.admin.mapper.shop.notice;

import com.owus.admin.domain.shop.notice.NoticeVO;
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
public class MapperTests {

    @Autowired(required = false)
    private NoticeMapper noticeMapper;

    @Test
    public void selectTest(){
        ListDTO listDTO = new ListDTO();
        List<NoticeVO> voList = noticeMapper.selectList(listDTO);
        log.info(voList);
    }

    @Test
    public void selectOne(){
        NoticeVO noticeVO = noticeMapper.selectOne(98279);
        log.info(noticeVO);

    }

    @Test
    public void insertTest(){
        NoticeVO noticeVO = NoticeVO.builder().title("공지 사항!!!!!!!!!!!!!!!!!!!!!!!!").content("공지 ㅁㄴㅇㄻㄴㅇㄹ").mno(1).build();
        noticeMapper.insert(noticeVO);
    }

    @Test
    public void fileinsertTest(){
//        AttachFileVO attachFile = AttachFileVO.builder().uuid("uuid 입니다.").fpath("/121/121/21").fname("테스트.jpg").img(0).build();
//        noticeMapper.insertAttach(attachFile);
    }

    @Test
    public void fileSelectTest(){
//        List <AttachFileVO> attachFiles = noticeMapper.selectFiles(131105);
//        log.info(attachFiles);
    }

    @Test
    public void fileDelteTest(){
        noticeMapper.delete(131124);
    }


    @Test
    public void updateTest(){
        NoticeVO noticeVO = NoticeVO.builder()
                        .bno(131135)
                        .title("수정")
                        .content("수정 합니다.")
                                .build();

        noticeMapper.update(noticeVO);
    }
}
