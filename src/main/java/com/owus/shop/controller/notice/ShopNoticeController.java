package com.owus.shop.controller.notice;


import com.owus.admin.dto.shop.notice.NoticeDTO;
import com.owus.admin.service.shop.notice.NoticeService;
import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.common.util.PageMaker;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/shop/notice")
public class ShopNoticeController {

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
        return "/shop/notice/main";
    }

    //read
    @GetMapping("/read/{bno}")
    public String read(@PathVariable("bno")Integer bno,Model model,ListDTO listDTO){
        NoticeDTO noticeDTO = noticeService.getOne(bno);
        model.addAttribute("noticeDTO",noticeDTO);
        model.addAttribute("uploads",noticeDTO.getUploads());
        return "/shop/notice/read";
    }

}
