package com.owus.shop.controller.mypage.faq;
/*
 * author          :
 * date            : 2022-06-13
 * time            : 오후 2:32
 * description     :
 * ================================================
 */


import com.owus.common.dto.ListResponseDTO;
import com.owus.security.dto.MemberDTO;
import com.owus.shop.dto.mypage.faq.FaqDTO;
import com.owus.shop.service.mypage.faq.ShopFAQService;
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
@RequestMapping("/shop/mypage/faq")
public class ShopFAQController {

    private final ShopFAQService shopFAQService;

    @GetMapping(value = {"", "/"})
    public String root(@AuthenticationPrincipal MemberDTO auth, Model model) {
        ListResponseDTO<FaqDTO> listResponseDTO = shopFAQService.getListResp(null, auth.getMno());

        model.addAttribute("dtoList", listResponseDTO.getDtoList());

        return "/shop/mypage/faq/main";
    }

    @PostMapping("/write")
    @PreAuthorize("authentication.principal.mno == #mno")
    public String write(FaqDTO faqDTO, Integer mno, RedirectAttributes rttr) {

        Integer bno = shopFAQService.writeOne(faqDTO);

        rttr.addFlashAttribute("showBno", bno);

        return "redirect:/shop/mypage/faq";
    }

    @PostMapping("/update")
    @PreAuthorize("authentication.principal.mno == #mno")
    public String update(FaqDTO faqDTO, Integer mno, RedirectAttributes rttr) {

        shopFAQService.updateOne(faqDTO);

        rttr.addFlashAttribute("showBno", faqDTO.getBno());
        return "redirect:/shop/mypage/faq";
    }

    @PostMapping("/delete")
    @PreAuthorize("authentication.principal.mno == #mno")
    public String delete(Integer mno, Integer bno) {
        shopFAQService.removeOne(bno);

        return "redirect:/shop/mypage/faq";
    }
}
