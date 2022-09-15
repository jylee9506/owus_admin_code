package com.owus.shop.controller.message;
/*
 * author          :
 * date            : 2022-06-22
 * time            : 오후 3:57
 * description     :
 * ================================================
 */

import com.owus.common.dto.ListResponseDTO;
import com.owus.shop.dto.message.MsgSendDTO;
import com.owus.shop.dto.message.MsgUserDTO;
import com.owus.shop.dto.message.MsgDTO;
import com.owus.shop.dto.message.MsgListDTO;
import com.owus.shop.service.message.MsgService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/shop/mypage/message")
public class ShopMsgController {

    private final MsgService msgService;

    @GetMapping(value = {"", "/"})
    public String root(Model model) {

        return "/shop/message/main";
    }

    @PreAuthorize("authentication.principal.mno == #msgListDTO.mno")
    @GetMapping("/list")
    @ResponseBody
    public ListResponseDTO<MsgDTO> msgList(MsgListDTO msgListDTO) {
        log.info("=======msgList======");
        log.info(msgListDTO);

        return msgService.getList(msgListDTO);
    }

//    @PreAuthorize("authentication.principal.mno == #msgDTO.fmno")
    @PostMapping("/post")
    @ResponseBody
    public Map<String, Object> sendMsg(@RequestBody MsgSendDTO msgSendDTO) {
        log.info("======sendMsg=======");
        log.info(msgSendDTO);

        msgService.sendMsg(msgSendDTO);

        return Map.of("result", "success");
    }

    @PostMapping("/find")
    @ResponseBody
    public List<MsgUserDTO> findUsers(@RequestBody Map<String, String> obj) {
        log.info("======findUsers======");
        log.info(obj);

        List<MsgUserDTO> dtoList = msgService.getDivers(obj.get("keyword"));

        log.info("=================dtoList");
        log.info(dtoList);

        return dtoList;
    }

    @GetMapping("/get")
    @ResponseBody
    public MsgUserDTO getMsg(Integer bno) {
        log.info(bno);

        return null;
    }

}
