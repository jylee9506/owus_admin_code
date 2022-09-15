package com.owus.admin.controller.diver.member;


import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.admin.dto.diver.member.TutorDTO;
import com.owus.admin.service.diver.member.TutorService;
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

@Controller
@Log4j2
@RequestMapping("/admin/diver/member")
@RequiredArgsConstructor
public class TutorController {

    private final TutorService tutorService;


    @GetMapping(value = {"", "/"})
    public String list(ListDTO listDTO, Model model) {

//        log.info("list ==================------------------------------------------");
        ListResponseDTO<TutorDTO> dto = tutorService.selectList(listDTO);

        int page = listDTO.getPage();
        int size = listDTO.getSize();
        int total = dto.getTotal();
        log.info(listDTO.getState());
        model.addAttribute("total", total);
        model.addAttribute("dtoList", dto.getDtoList());
        model.addAttribute("pgMaker", new PageMaker(page, size, total));

        log.info("====================");
        log.info("====================");
        log.info(listDTO);
        log.info("====================");
        log.info("====================");

        return "/admin/diver/member/main";

    }


    @PostMapping("/read/approve")
    public String approve(TutorDTO tutorDTO,ListDTO listDTO, RedirectAttributes rttr) {
        log.info(tutorDTO);

        tutorService.approve(tutorDTO);
        rttr.addFlashAttribute("approve", "approved");

        return "redirect:/admin/diver/member/read/" +tutorDTO.getMno() +listDTO.getLink();
    }

    @GetMapping("/read/{mno}")
    public String getOne(@PathVariable("mno") Integer mno,ListDTO listDTO, Model model) {


        TutorDTO tutorDTO=tutorService.getOne(mno);

        model.addAttribute("tutorDTO", tutorDTO);

        return "/admin/diver/member/read";
    }


}
