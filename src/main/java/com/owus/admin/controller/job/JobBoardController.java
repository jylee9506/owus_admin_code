package com.owus.admin.controller.job;

import com.owus.admin.dto.job.JobBoardDTO;
import com.owus.admin.dto.job.JobBoardListResponseDTO;
import com.owus.admin.service.job.JobBoardService;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Log4j2
@Controller
@RequestMapping("/admin/job")
@RequiredArgsConstructor
public class JobBoardController {

    private final JobBoardService jobBoardService;

//    @GetMapping("")
//    public String basic(){
//        return "redirect:/admin/job/main";
//    }

    @GetMapping(value = {"/", ""})
    public String getJobBoardList(ListDTO listDTO, Model model) {

        ListResponseDTO<JobBoardDTO> listResponseDTO = jobBoardService.getListResp(listDTO);

        JobBoardListResponseDTO<JobBoardDTO> jobBoardListResponseDTO = jobBoardService.getNoticeList(listDTO);

        List<JobBoardDTO> dtoList = listResponseDTO.getDtoList();

        List<JobBoardDTO> notList = jobBoardListResponseDTO.getNoticedtoList();

        PageMaker pageMaker = PageMaker.pg()
                .page(listDTO.getPage())
                .size(listDTO.getSize())
                .total(listResponseDTO.getTotal())
                .build();

        model.addAttribute("dtoList",dtoList);
        model.addAttribute("notList",notList);
        model.addAttribute("pageMaker", pageMaker);
        return "/admin/job/main";
    }


    @GetMapping("/read/{bno}")
    public String read(@PathVariable("bno") Integer bno, ListDTO listDTO, Model model){

        log.info("====================================================================");
        log.info("====================================================================");
        log.info("====================================================================");
        log.info(listDTO);

        JobBoardDTO jobBoardDTO = jobBoardService.getOne(bno);
        model.addAttribute("jobBoardDTO",jobBoardDTO);
        model.addAttribute("uploads",jobBoardDTO.getUploads());

        return "/admin/job/read";
    }

    @GetMapping("/modify/{bno}")
    public String modify(@PathVariable("bno") Integer bno, ListDTO listDTO, Model model){

        JobBoardDTO jobBoardDTO = jobBoardService.getOne(bno);

        model.addAttribute("jobBoardDTO",jobBoardDTO);

        return "/admin/job/modify";
    }


    @PostMapping("/modify/{bno}")
    public String modify(ListDTO listDTO, JobBoardDTO jobBoardDTO, RedirectAttributes rttr){

        jobBoardService.modify(jobBoardDTO);

        rttr.addFlashAttribute("reslut", "succes");

        log.info(jobBoardDTO);

        return "redirect:/admin/job/modify/" + jobBoardDTO.getBno() + listDTO.getLink();

    }

    @GetMapping("/noticeModify/{bno}")
    public String noticeModify(@PathVariable("bno") Integer bno, ListDTO listDTO, Model model){

        ListResponseDTO<JobBoardDTO> listResponseDTO = jobBoardService.getListResp(listDTO);

        JobBoardDTO jobBoardDTO = jobBoardService.getOne(bno);

        model.addAttribute("jobBoardDTO", jobBoardDTO);
        model.addAttribute("uploads", jobBoardDTO.getUploads());

        return "/admin/job/noticeModify";
    }


    @PostMapping("/noticeModify/{bno}")
    public String noticeModify(ListDTO listDTO, JobBoardDTO jobBoardDTO, RedirectAttributes rttr){

        rttr.addFlashAttribute("reslut", "succes");

        log.info(jobBoardDTO);

        return "redirect:/admin/job/noticeModify/" + jobBoardDTO.getBno() + listDTO.getLink();

    }



    @PostMapping("/write")
    public String write(JobBoardDTO jobBoardDTO, ListDTO listDTO , RedirectAttributes rttr){

        Integer bno = jobBoardService.writeOne(jobBoardDTO);

        log.info(jobBoardDTO.getUploads());

        rttr.addFlashAttribute("result", "success");

        return "redirect:/admin/job/noticeModify/" + bno + listDTO.getLink();
    }

    @GetMapping("/write")
    public String writeGET(ListDTO listDTO, Model model){

        model.addAttribute("category",listDTO.getCategory());

        return "/admin/job/write";
    }

    @GetMapping("/remove/{bno}")
    public String removeGet(JobBoardDTO jobBoardDTO) {
        return "redirect:/admin/job";
    }


    @PostMapping("/remove/{bno}")
    public String remove(JobBoardDTO jobBoardDTO, RedirectAttributes rttr) {
        log.info("remove controller....");

        jobBoardService.hideContent(jobBoardDTO);

        rttr.addFlashAttribute("result", "hide");

        return "redirect:/admin/job";
    }
}


