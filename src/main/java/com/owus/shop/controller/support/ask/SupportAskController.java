package com.owus.shop.controller.support.ask;
/*
 * author          :
 * date            : 2022-06-06
 * time            : 오후 11:57
 * description     :
 * ================================================
 */

import com.owus.admin.dto.ask.AskDTO;
import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.common.util.PageMaker;
import com.owus.security.dto.MemberDTO;
import com.owus.shop.service.support.ask.SupportAskService;
import com.owus.shop.service.support.ask.SupportAskServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/shop/support/ask")
public class SupportAskController {

    private final SupportAskService supportAskService;
    private final TreeMap<Long, String> category = new TreeMap<>(Map.of(11L, "신규관련", 12L, "상품관련", 13L, "해지관련"));

    @GetMapping(value = {"", "/"})
    public String root(@AuthenticationPrincipal MemberDTO auth, ListDTO listDTO, Model model) {
        ListResponseDTO<AskDTO> listResponseDTO = supportAskService.getListResp(listDTO, auth.getMno());

        PageMaker pgm = PageMaker.pg()
                .page(listDTO.getPage())
                .size(listDTO.getSize())
                .total(listResponseDTO.getTotal())
                .build();

        model.addAttribute("dtoList", listResponseDTO.getDtoList());
        model.addAttribute("pgMaker", pgm);
        model.addAttribute("total", listResponseDTO.getTotal());
        model.addAttribute("category", category);

        return "/shop/support/ask/main";
    }

    @GetMapping("/read/{bno}")
    public String read(@PathVariable("bno") Integer bno, ListDTO listDTO, Model model) {
        AskDTO dto = supportAskService.getOne(bno);

        model.addAttribute("dto", dto);

        return "/shop/support/ask/read";
    }

    @GetMapping("/write")
    public String writeGET(ListDTO listDTO, Model model) {
        model.addAttribute("category", category);
        return "/shop/support/ask/write";
    }

    @PostMapping("/write")
    public String writePOST(AskDTO askDTO, ListDTO listDTO, RedirectAttributes rttr) {
        log.info("---------------------------------");
        log.info(askDTO);

        Integer bno = supportAskService.writeOne(askDTO);

        return "redirect:/shop/support/ask/read/" + bno + listDTO.getLink();
    }

    @PostMapping("/remove/{bno}")
    public String removePOST(@PathVariable("bno") Integer bno, ListDTO listDTO, RedirectAttributes rttr) {
        supportAskService.removeOne(bno);

        return "redirect:/shop/support/ask" + listDTO.getLinkWithoutPage();
    }

    @GetMapping("/modify/{bno}")
    public String modifyGET(@PathVariable("bno") Integer bno, ListDTO listDTO, Model model) {
        AskDTO dto = supportAskService.getOne(bno);
        model.addAttribute("dto", dto);
        model.addAttribute("category", category);
        model.addAttribute("modify", true);

        return "/shop/support/ask/write";
    }

    @PostMapping("/modify/{bno}")
    public String modifyPOST(@PathVariable("bno") Integer bno, AskDTO askDTO, ListDTO listDTO, RedirectAttributes rttr) {
        supportAskService.updateOne(askDTO);

        return "redirect:/shop/support/ask/read/" + bno + listDTO.getLink();
    }

}
