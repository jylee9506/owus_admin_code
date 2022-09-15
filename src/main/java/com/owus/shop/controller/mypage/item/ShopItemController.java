package com.owus.shop.controller.mypage.item;
/*
 * author          :
 * date            : 2022-06-07
 * time            : 오후 3:22
 * description     :
 * ================================================
 */

import com.owus.admin.dto.shop.member.ShopItemDTO;
import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.security.dto.MemberDTO;
import com.owus.shop.dto.mypage.item.ShopItemDpointDTO;
import com.owus.shop.service.mypage.item.ShopItemService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/shop/mypage/item")

public class ShopItemController {

    private final ShopItemService shopItemService;

    @GetMapping(value = {"", "/"})
    public String root(@AuthenticationPrincipal MemberDTO auth, ListDTO listDTO, Model model) {
        ListResponseDTO<ShopItemDTO> resDTO = shopItemService.getListResp(listDTO, auth.getMno());

        model.addAttribute("dtoList", resDTO.getDtoList());

        return "/shop/mypage/item/main";
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/write")
    public String writeGET(@AuthenticationPrincipal MemberDTO auth, Model model) {
        model.addAttribute("dpointList", shopItemService.getListDpoint(auth.getMno()));

        return "/shop/mypage/item/write";
    }

    @PreAuthorize("authentication.principal.mno == #shopItemDTO.mno")
    @PostMapping("/write")
    public String writePOST(ShopItemDTO shopItemDTO) {
        log.info("=========================");
        log.info(shopItemDTO);
        shopItemService.writeOne(shopItemDTO);

        return "redirect:/shop/mypage/item";
    }

    @GetMapping("/read/{pdno}")
    public String read(@PathVariable("pdno") Integer pdno, Model model) {
        ShopItemDTO dto = shopItemService.getOne(pdno);

        log.info(dto);

        model.addAttribute("dto", dto);

        return "/shop/mypage/item/read";
    }

    @PreAuthorize("authentication.principal.mno == #mno")
    @PostMapping("/delete")
    public String deletePOST(Integer mno, Integer pdno) {
        shopItemService.removeOne(pdno);

        return "redirect:/shop/mypage/item";
    }

    @PreAuthorize("authentication.principal.mno == #mno")
    @GetMapping("/update")
    public String updateGET(Integer mno, Integer pdno, Model model) {
        model.addAttribute("dto", shopItemService.getOne(pdno));
        model.addAttribute("dpointList", shopItemService.getListDpoint(mno));
        model.addAttribute("modify", true);

        return "/shop/mypage/item/write";
    }

    @PreAuthorize("authentication.principal.mno == #shopItemDTO.mno")
    @PostMapping("/update")
    public String updatePOST(ShopItemDTO shopItemDTO) {
        shopItemService.updateOne(shopItemDTO);

        return "redirect:/shop/mypage/item/read/" + shopItemDTO.getPdno();
    }


}
