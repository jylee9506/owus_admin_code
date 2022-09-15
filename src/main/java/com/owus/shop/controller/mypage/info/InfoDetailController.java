package com.owus.shop.controller.mypage.info;


import com.owus.common.dto.UploadResultDTO;
import com.owus.shop.dto.mypage.info.FacilityDTO;
import com.owus.shop.dto.mypage.info.TutorDTO;
import com.owus.shop.service.mypage.info.InfoDetailsService;
import com.owus.shop.service.mypage.info.InfoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Log4j2
@RestController
@RequiredArgsConstructor
@RequestMapping("/details")
public class InfoDetailController { // todo : 컨트롤 이름 리펙토링 필요

    private final InfoDetailsService infoDetailsService;
    private final InfoService infoService;

    @GetMapping("/tutor/{smno}")
    List<TutorDTO> belongTutorList (@PathVariable("smno") Integer smno){
        log.info("tutorList ====================================================");
        List<TutorDTO> dtoList = infoDetailsService.getList(smno);
//        dtoList.stream().forEach(dto -> log.info(dto));
        return dtoList;
    }

    @GetMapping("/facility/{mno}")
    List<FacilityDTO> tutorList (@PathVariable("mno") Integer mno, Model model){

        log.info("부대시설 리스트 불러오기 ==========================================");
        List<FacilityDTO> dtoList =  infoDetailsService.getFacilityListOfShop(mno);
        return dtoList;
    }

    @GetMapping("/gallery/{mno}")
    List<UploadResultDTO> galleryList(@PathVariable("mno") Integer mno){
        log.info("갤러리 리스트 불러어기 ===================================");
        log.info(mno);
        List<UploadResultDTO> dtoList = infoService.getFiles(mno);
        dtoList.forEach(vo -> {log.info(vo);});

        return dtoList;
    }
}
