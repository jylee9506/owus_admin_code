package com.owus.admin.controller.shop.member;
/*
 * author          :
 * date            : 2022-05-29
 * time            : 오전 11:27
 * description     :
 * ================================================
 */

import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.admin.dto.shop.member.ShopMemberDTO;
import com.owus.admin.service.shop.member.ShopMemberService;
import com.owus.common.util.PageMaker;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;
import java.util.TreeMap;

@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/admin/shop/member")
public class ShopMemberController {

    private final TreeMap<Long, String> STATE = new TreeMap<>(
            Map.of(0L, "상태전체", 1L, "활동중", 2L, "등록요청", 3L, "해지요청", 4L, "해지완료")
    );
    private final ShopMemberService shopMemberService;

    @GetMapping(value = {"", "/"})
    public String getMain(ListDTO listDTO, Model model) {
        log.info("==============");
        log.info("==============");
        log.info(listDTO);
        ListResponseDTO<ShopMemberDTO> listResponseDTO = shopMemberService.getListResp(listDTO);

        model.addAttribute("dtoList", listResponseDTO.getDtoList());
        model.addAttribute("state", STATE);
        model.addAttribute("pgMaker", PageMaker.pg()
                .page(listDTO.getPage())
                .size(listDTO.getSize())
                .total(listResponseDTO.getTotal())
                .build());

        return "/admin/shop/member/main";
    }

    @GetMapping("/read/{mno}")
    public String read(@PathVariable("mno") Integer mno, ListDTO listDTO, Model model) {
        ShopMemberDTO dto = shopMemberService.getOne(mno);
        model.addAttribute("dto", dto);
        model.addAttribute("state", STATE);

        return "/admin/shop/member/read";
    }

    @PostMapping("/update/state")
    public String updateState(ShopMemberDTO shopMemberDTO, ListDTO listDTO, RedirectAttributes rttr) {
        log.info("==================");
        log.info("========update========");
        log.info(shopMemberDTO);

        shopMemberService.updateStateOne(shopMemberDTO);

        return "redirect:/admin/shop/member/read/" + shopMemberDTO.getMno() + listDTO.getLink();
    }

    @PostMapping("/update/info")
    public String updateInfo(ShopMemberDTO shopMemberDTO, ListDTO listDTO, RedirectAttributes rttr) {

        shopMemberService.updateOne(shopMemberDTO);

        return "redirect:/admin/shop/member/read/" + shopMemberDTO.getMno() + listDTO.getLink();

    }



}
