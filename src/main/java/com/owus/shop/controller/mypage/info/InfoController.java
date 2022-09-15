package com.owus.shop.controller.mypage.info;

import com.owus.admin.dto.shop.member.ShopMemberDTO;

import com.owus.common.dto.ListResponseDTO;
import com.owus.common.util.PageMaker;
import com.owus.shop.dto.mypage.info.FacilityDTO;
import com.owus.shop.dto.mypage.info.ListDTO;
import com.owus.shop.dto.mypage.info.TutorDTO;
import com.owus.shop.service.mypage.info.InfoDetailsService;
import com.owus.shop.service.mypage.info.InfoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/shop/mypage/info")
@Log4j2
public class InfoController {

    private final InfoService infoService;
    private final InfoDetailsService infoDetailsService;

    @GetMapping("")
    public String root(@AuthenticationPrincipal User user, Model model){
        String id = user.getUsername();
        ShopMemberDTO shopMemberDTO = infoService.getOne(id);
//        log.info("mypAGE ====================================================================================");
//        log.info(shopMemberDTO);
        model.addAttribute("dto",shopMemberDTO);
        return "/shop/mypage/info/main";
    }

    // shop 수정 페이지 GET
    @GetMapping("/modify")
    public String modfiyGet(@AuthenticationPrincipal User user, Model model){
        String id = user.getUsername();
        ShopMemberDTO shopMemberDTO = infoService.getOne(id);

        model.addAttribute("dto",shopMemberDTO);
        return "/shop/mypage/info/modify";
    }

    // shop 수정 처리 POST
    @PostMapping("/modify/shopinfo")
    public String modfiyPost(TutorDTO tutorDTO , Model model){
        log.info("modfiyPost=============================sdfsdfsdfsdfsdf=====================");
        infoService.update(tutorDTO);
        log.info(tutorDTO);
        return "redirect:/shop/mypage/info";
    }

//    diver 추가 페이지 GET
    @GetMapping("/tutorAdd")
    public String tutorListGet(ShopMemberDTO shopMemberDTO, ListDTO listDTO, Model model){

        ListResponseDTO<TutorDTO> listResponseDTO = infoService.getTutorList(listDTO);
        Integer total = listResponseDTO.getTotal();
        List<TutorDTO> dtoList = listResponseDTO.getDtoList();
        log.info(shopMemberDTO.getMno());
        model.addAttribute("mno",shopMemberDTO.getMno());
        model.addAttribute("dto",dtoList);
        model.addAttribute("pgMaker", PageMaker.pg()
                .total(total)
                .page(listDTO.getPage())
                .size(listDTO.getSize())
                .build());
        return "/shop/mypage/info/tutorAdd";

    }
// 다이버 추가 POST
    @PostMapping("/tutorAdd/add")
    public String tutorAddPost(TutorDTO tutorDTO){

        infoService.updateTutor(tutorDTO);

        log.info(tutorDTO.getDivers());
        log.info(tutorDTO.getMno());
        return "redirect:/shop/mypage/info";
    }

    //다이버 삭제 페지이 Get
    @GetMapping("/diverRemove")
    public String tutorListGet (ListDTO listDTO,ShopMemberDTO shopMemberDTO, Model model){
        Integer smno = shopMemberDTO.getMno();
        List<TutorDTO> dtoList = infoService.getTutorListOfShop(smno);
        model.addAttribute("dto",dtoList);
        log.info("Remove ====================");
        return "/shop/mypage/info/tutorRemove";
    }

    //다이버 삭제 POST
    @PostMapping("/diverRemove/remove")
    public String tutorRemovePost(TutorDTO tutorDTO){
            log.info("삭제 Post-====--............................");
            infoService.updateTutorOfShop(tutorDTO);
        return "redirect:/shop/mypage/info";
    }

    //부대시설 추가 페이지 GET
    @GetMapping("/facilityAdd")
    public String facilityAdd(FacilityDTO facilityDTO,Model model){
        Integer mno = facilityDTO.getMno();
        List<FacilityDTO> dtoListOfShop =  infoDetailsService.getFacilityListOfShop(mno);
        List<FacilityDTO> dtoList = infoService.getFacilityList();


        model.addAttribute("dto",dtoList);
        model.addAttribute("dtoOfShop",dtoListOfShop);
//        log.info("facilityAdd Page Get==================");
//        log.info(mno);

        return "/shop/mypage/info/facility";
    }

    //부대시설 추가 Post
    @PostMapping("/facilityAdd/add")
    public String facilityAddPost(FacilityDTO facilityDTO){

        log.info("부대시설 추가  Post========================");
        log.info("mno : " + facilityDTO.getMno());
        facilityDTO.getFnoList().forEach(facility -> log.info(facility));
        infoService.insertFacility(facilityDTO);

        return "redirect:/shop/mypage/info";
    }
    
    //부대시설 삭제 페이지 GET
    @GetMapping("/facilityRemove")
    public String facilityRemove(FacilityDTO facilityDTO, Model model){

        Integer mno = facilityDTO.getMno();
        List<FacilityDTO> dtoListOfShop =  infoDetailsService.getFacilityListOfShop(mno);
        model.addAttribute("dto",dtoListOfShop);

        return "/shop/mypage/info/facilityRemove";
    }

    //부대시설 삭제 Post
    @PostMapping("/facilityRemove/remove")
    public String facilityRemovePost(FacilityDTO facilityDTO){

        log.info("부대시설 추가  Post========================");
        log.info("mno : " + facilityDTO.getMno());
        facilityDTO.getFnoList().forEach(facility -> log.info(facility));
        infoService.deleteFacility(facilityDTO);

        return "redirect:/shop/mypage/info";
    }

//    이미지 업로드 페이지 GET
    @GetMapping("/imageAdd")
    public String galleryAddGet(FacilityDTO facilityDTO){



        return "/shop/mypage/info/imageAdd";
    }

//    이미지 업로드 Post
    @PostMapping("/imageAdd/upload")
    public String galleryAddPost(FacilityDTO facilityDTO){

        infoService.writeOne(facilityDTO);
        return "redirect:/shop/mypage/info";

    }


}













