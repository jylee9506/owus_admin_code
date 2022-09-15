package com.owus.shop.controller.support.request;

import com.owus.security.dto.MemberDTO;
import com.owus.shop.dto.support.request.ShopAllDTO;
import com.owus.shop.dto.support.request.ShopDTO;
import com.owus.shop.service.support.request.ShopService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/shop/support/request")
public class ShopRegisterController {

    private final ShopService service;

    @GetMapping(value = {"", "/"})
    public String root(@AuthenticationPrincipal MemberDTO auth, Model model) {

        ShopAllDTO shopAllDTO = service.selectOneAll(auth.getMno());
        model.addAttribute("dto", shopAllDTO);

        log.info(shopAllDTO);

        return "/shop/support/request/writer";

    }

    @PreAuthorize("authentication.principal.mno == #shopDTO.mno")
    @PostMapping("/register")
    public String register(ShopDTO shopDTO, RedirectAttributes rttr) {
        log.info(shopDTO);
        log.info("==========register================");

        service.insert(shopDTO);

        rttr.addFlashAttribute("result", 123);

        return "redirect:/shop/support/request";

    }

    @PreAuthorize("authentication.principal.mno == #shopDTO.mno")
    @PostMapping("/modify")
    public String update(ShopDTO shopDTO, RedirectAttributes rttr) {

        log.info(shopDTO);
        service.modify(shopDTO);


        rttr.addFlashAttribute("register", "registered");


        return "redirect:/shop/support/request/";
    }

//    @PreAuthorize("authentication.principal.mno == #shopDTO.mno")
//    @PostMapping("/modify")
//    public String modify(ShopDTO shopDTO, RedirectAttributes rttr) {
//
//        service.modify(shopDTO);
//
//        rttr.addFlashAttribute("modify","modified");
//
//
//        return "redifect:/shop/support/request/";
//    }
}

