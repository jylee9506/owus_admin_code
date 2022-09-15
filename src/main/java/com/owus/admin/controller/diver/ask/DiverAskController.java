package com.owus.admin.controller.diver.ask;
/*
 * author          :
 * date            : 2022-05-23
 * time            : 오전 10:39
 * description     :
 * ================================================
 */

import com.owus.admin.controller.ask.AskBaseController;
import com.owus.admin.dto.ask.AskControllerDTO;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;
import java.util.TreeMap;

@Log4j2
@Controller
@RequestMapping("/admin/diver/ask")
public class DiverAskController extends AskBaseController {
    public DiverAskController() {
        super(AskControllerDTO.builder()
                .category(new TreeMap<>(Map.of(21L, "예약관련", 22L, "결제관련", 23L, "강사관련")))
                .base("/admin/diver/ask")
                .mtype(2)
                .build()
        );
    }
}
