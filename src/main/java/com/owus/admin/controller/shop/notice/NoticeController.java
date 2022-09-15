package com.owus.admin.controller.shop.notice;


import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.admin.dto.shop.notice.NoticeDTO;
import com.owus.admin.service.shop.notice.NoticeService;
import com.owus.common.util.PageMaker;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/shop/notice")
public class NoticeController {

    private final NoticeService noticeService;

    //공지 목록
    @GetMapping(value = {"/",""})
    public String notice(ListDTO listDTO,Model model){
        ListResponseDTO<NoticeDTO> listResponseDTO = noticeService.getListResp(listDTO);
          List<NoticeDTO> dtoList = listResponseDTO.getDtoList();
          int page = listDTO.getPage();
          int size = listDTO.getSize();
          int total = listResponseDTO.getTotal();

          model.addAttribute("dtoList",dtoList);
          model.addAttribute("pgMaker", PageMaker.pg().page(page).size(size).total(total).build());
        return "admin/shop/notice/main";
    }

    //read
    @GetMapping("/read/{bno}")
    public String read(@PathVariable("bno")Integer bno,Model model,ListDTO listDTO){
        NoticeDTO noticeDTO = noticeService.getOne(bno);
        model.addAttribute("noticeDTO",noticeDTO);
        model.addAttribute("uploads",noticeDTO.getUploads());
        return "admin/shop/notice/read";
    }

    //write
    @GetMapping("/write")
    public String write(ListDTO listDTO){
        return "admin/shop/notice/write";
    }

    //write post
    @PostMapping("/write/register")
    public String register(ListDTO listDTO, NoticeDTO noticeDTO){

        noticeService.writeOne(noticeDTO);
        return "redirect:/admin/shop/notice";
    }


    //modify
    @GetMapping("/modify/{bno}")
    public String modify(@PathVariable("bno") Integer bno, Model model,ListDTO listDTO ){
        log.info("===================modify controller=====================");
        NoticeDTO noticeDTO = noticeService.getOne(bno);
        model.addAttribute("noticeDTO",noticeDTO);
        model.addAttribute("uploads",noticeDTO.getUploads());
        return "admin/shop/notice/modify";
    }

    //modifyPost
    @PostMapping("/modify")
    public String modifyPost(NoticeDTO noticeDTO,ListDTO listDTO){
//        log.info(noticeDTO);
        noticeService.updateOne(noticeDTO);
        int bno = noticeDTO.getBno();
        return "redirect:/admin/shop/notice/read/"+bno+listDTO.getLink();
    }

    @PostMapping("/remove/{bno}")
    public String remove(@PathVariable("bno") Integer bno, ListDTO listDTO){
        noticeService.removeOne(bno);
        return "redirect:/admin/shop/notice"+listDTO.getLink();
    }
}
