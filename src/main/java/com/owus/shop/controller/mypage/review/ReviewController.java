package com.owus.shop.controller.mypage.review;

import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.common.util.PageMaker;
import com.owus.shop.dto.mypage.review.ReplyDTO;
import com.owus.shop.dto.mypage.review.ReviewDTO;
import com.owus.shop.dto.mypage.review.ReviewResponseDTO;
import com.owus.shop.service.mypage.review.ReviewReplyService;
import com.owus.shop.service.mypage.review.ReviewService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/shop/mypage/review")
@Controller
@Log4j2
@RequiredArgsConstructor
public class ReviewController {

    private final ReviewService reviewService;
    private final ReviewReplyService reviewReplyService;


    @GetMapping(value = {"/",""})
    public String review(ListDTO listDTO, Model model){
        ListResponseDTO<ReviewDTO> listResponseDTO = reviewService.getList(listDTO);
        List<ReviewDTO> dtoList = listResponseDTO.getDtoList();
        int total = listResponseDTO.getTotal();

        model.addAttribute("dtoList",dtoList);
        model.addAttribute("pgMaker", PageMaker.pg().total(total).page(listDTO.getPage()).size(listDTO.getSize()).build());
        return "/shop/mypage/review/main";
    }

    @GetMapping("/read/{rno}")
    public String read( @PathVariable("rno") Integer rno,  ListDTO listDTO, Model model){
        log.info("========================rno================================");
        log.info(rno);
        ReviewResponseDTO reviewResponseDTO = reviewService.getOne(rno);
        ReviewDTO reviewDTO = reviewResponseDTO.getReviewDTO();
        ReplyDTO replyDTO = reviewResponseDTO.getReplyDTO();

        model.addAttribute("review",reviewDTO);
        model.addAttribute("reply",replyDTO);

        return "/shop/mypage/review/read";
    }

    @PostMapping("/answer")
    public String addReply(ReplyDTO replyDTO,ListDTO listDTO){
        log.info("+addRely-----------------====================================");
        reviewReplyService.insert(replyDTO);

        return "redirect:/shop/mypage/review"+listDTO.getLink();
    }

    @PostMapping("/modify")
    public String modifyReply(ReplyDTO replyDTO,ListDTO listDTO){

        log.info("수정 Post");
        reviewReplyService.modify(replyDTO);
        Integer rno = replyDTO.getRno();
        return "redirect:/shop/mypage/review/read/"+rno+listDTO.getLink();
    }

    @PostMapping("/delete")
    public String delete(Integer rno, ListDTO listDTO){

        reviewReplyService.delete(rno);
        return "redirect:/shop/mypage/review/read/"+rno+listDTO.getLink();
    }


}
