package com.owus.shop.controller.mypage.reservation;

import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.common.util.PageMaker;
import com.owus.security.dto.MemberDTO;
import com.owus.shop.dto.mypage.reservation.ReservationDTO;
import com.owus.shop.dto.mypage.reservation.ReservationListDTO;
import com.owus.shop.service.mypage.reservation.ShopReservationService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;
import java.util.TreeMap;

@Controller
@RequestMapping("/shop/mypage/reservation")
@RequiredArgsConstructor
@Log4j2
public class ShopReservationController {
    private final TreeMap<Long, String> STATE = new TreeMap<>(
            Map.of(0L, "전체", 1L, "대기", 2L, "취소", 3L, "반려", 4L, "완료",5L, "승인")
    );
    private final TreeMap<Long, String> TUTOR = new TreeMap<>(
            Map.of(0L, "일반", 1L, "강사")
    );

    private final TreeMap<Long, String> GENDER = new TreeMap<>(
            Map.of(0L, "남자", 1L, "여자")
    );

    private final ShopReservationService reservationService;

    @GetMapping(value = {"", "/"})
    public String root(@AuthenticationPrincipal MemberDTO auth, ListDTO listDTO, Model model) {
        ListResponseDTO<ReservationListDTO> listResponseDTO = reservationService.selectList(listDTO, auth.getMno());

        model.addAttribute("dtoList", listResponseDTO.getDtoList());
        model.addAttribute("state", STATE);
        model.addAttribute("pgMaker", PageMaker.pg()
                .page(listDTO.getPage())
                .size(listDTO.getSize())
                .total(listResponseDTO.getTotal())
                .build());

        log.info("hello" + STATE + listResponseDTO + listDTO);

        return "/shop/mypage/reservation/main";
    }

    @GetMapping("/read/{rsvno}")
    public String read(@PathVariable("rsvno") Integer rsvNo, ListDTO listDTO, Model model) {

        log.info("========================================");
        log.info("reservation/read" + rsvNo);
        log.info("========================================");
        ReservationDTO reservationDTO = reservationService.selectOne(rsvNo);

        model.addAttribute("dto", reservationDTO);
        model.addAttribute("state", STATE);
        model.addAttribute("tutorFlag", TUTOR);
        model.addAttribute("gender", GENDER);



        log.info(reservationDTO);

        return "/shop/mypage/reservation/read";
    }

    @PostMapping("/update")
    public String updateState(ReservationDTO reservationDTO, ListDTO listDTO, RedirectAttributes rttr) {
        log.info("==================");
        log.info("========update========");
        log.info(listDTO);
        log.info(reservationDTO);

        reservationService.update(reservationDTO);

        rttr.addFlashAttribute("result", "성공");

        return "redirect:/shop/mypage/reservation/read/" + reservationDTO.getRsvNo() + listDTO.getLink();
    }

}
