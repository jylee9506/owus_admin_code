package com.owus.admin.controller.ask;
/*
 * author          :
 * date            : 2022-05-23
 * time            : 오후 6:02
 * description     :
 * ================================================
 */

import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ReplyDTO;
import com.owus.admin.service.common.ReplyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Log4j2
@RestController
@RequiredArgsConstructor
@RequestMapping("/ask/reply")
public class AskReplyController {

    private final ReplyService<ReplyDTO> replyService;

    @GetMapping("/list/{bno}")
    public List<ReplyDTO> getList(@PathVariable("bno") Integer bno, ListDTO listDTO) {
        log.info("==========================");
        log.info(bno);
        log.info(listDTO);

        List<ReplyDTO> dtoList = replyService.getList(bno, listDTO);

        dtoList.forEach(log::info);

        return dtoList;
    }

    @GetMapping("/sublist/{bno}/{rno}")
    public List<ReplyDTO> getList(@PathVariable("bno") Integer bno, @PathVariable("rno") Integer rno) {
        log.info("==========================");
        log.info(bno);
        log.info(rno);

        List<ReplyDTO> dtoList = replyService.getSubList(bno, rno);

        dtoList.forEach(log::info);

        return dtoList;
    }

    @PostMapping("/")
    public Map<String, Integer> addReply(@RequestBody ReplyDTO replyDTO) {
        int total = replyService.addOne(replyDTO);

        return Map.of("result", total);
    }

    @DeleteMapping("/{rno}")
    public Map<String, String> removeReply(@PathVariable("rno") Integer rno, @RequestBody ReplyDTO replyDTO) {
        log.info("---------------del");
        log.info(rno);
        log.info(replyDTO);

        if(!rno.equals(replyDTO.getRno())) {
            return Map.of("result", "오류");
        }

        replyService.removeOne(replyDTO);

        return Map.of("result", "삭제된 댓글");
    }

    @PatchMapping("/{rno}")
    public  Map<String, String> updateReply(@PathVariable("rno") Integer rno, @RequestBody ReplyDTO replyDTO) {
        replyService.updateOne(replyDTO);

        return Map.of("result", "updated");
    }
}
