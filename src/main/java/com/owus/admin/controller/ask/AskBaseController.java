package com.owus.admin.controller.ask;
/*
 * author          :
 * date            : 2022-05-31
 * time            : 오후 4:32
 * description     :
 * ================================================
 */

import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.admin.dto.ask.AskDTO;
import com.owus.admin.dto.ask.AskControllerDTO;
import com.owus.admin.service.ask.AskService;
import com.owus.common.util.PageMaker;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Log4j2
@RequiredArgsConstructor
public abstract class AskBaseController {

    @Autowired
    private AskService askService;
    private final AskControllerDTO askControllerDto;

    @GetMapping(value = {"", "/"})
    public String getMain(ListDTO listDTO, Model model) {
        listDTO.setMtype(askControllerDto.getMtype());

        ListResponseDTO<AskDTO> listResponseDTO = askService.getListResp(listDTO);

        PageMaker pgm = PageMaker.pg()
                .page(listDTO.getPage())
                .size(listDTO.getSize())
                .total(listResponseDTO.getTotal())
                .build();

        model.addAttribute("dtoList", listResponseDTO.getDtoList());
        model.addAttribute("pgMaker", pgm);
        model.addAttribute("total", listResponseDTO.getTotal());
        model.addAttribute("category", askControllerDto.getCategory());

        return "/admin/ask/main";
    }

    @GetMapping("/read/{bno}")
    public String read(@PathVariable("bno") Integer bno, ListDTO listDTO, Model model) {

        AskDTO dto = askService.getOne(bno);

        model.addAttribute("dto", dto);

        return "/admin/ask/read";
    }

    @GetMapping("/write")
    public String writeGET(ListDTO listDTO, Model model) {
        model.addAttribute("category", askControllerDto.getCategory());
        return "/admin/ask/write";
    }

    @PostMapping("/write")
    public String writePOST(AskDTO diverAskDTO, ListDTO listDTO, RedirectAttributes rttr) {
        log.info("---------------------------------");
        log.info(diverAskDTO);

        Integer bno = askService.writeOne(diverAskDTO);

        return "redirect:" + askControllerDto.getBase() + "/read/" + bno + listDTO.getLink();
    }

    @PostMapping("/remove/{bno}")
    public String removePOST(@PathVariable("bno") Integer bno, ListDTO listDTO, RedirectAttributes rttr) {
        askService.removeOne(bno);

        return "redirect:" + askControllerDto.getBase() + listDTO.getLinkWithoutPage();
    }

    @GetMapping("/modify/{bno}")
    public String modifyGET(@PathVariable("bno") Integer bno, ListDTO listDTO, Model model) {
        AskDTO dto = askService.getOne(bno);
        model.addAttribute("dto", dto);
        model.addAttribute("category", askControllerDto.getCategory());
        model.addAttribute("modify", true);

        return "/admin/ask/write";
    }

    @PostMapping("/modify/{bno}")
    public String modifyPOST(@PathVariable("bno") Integer bno, AskDTO diverAskDTO, ListDTO listDTO, RedirectAttributes rttr) {
        askService.updateOne(diverAskDTO);

        return "redirect:" + askControllerDto.getBase() + "/read/" + bno + listDTO.getLink();
    }

    @PostMapping("/answer")
    public String answerPOST(Integer bno, ListDTO listDTO, RedirectAttributes rttr) {
        askService.answerToAsk(bno);

        return "redirect:" + askControllerDto.getBase() + "/read/" + bno + listDTO.getLink();
    }
}
