package com.owus.shop.dto.mypage.reservation;

import com.owus.shop.domain.mypage.reservation.ReservationDetailVO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReservationDTO {
    private Integer rsvNo;
    private String pdName;
    private String rsvName;
    private Integer tutorCnt;
    private Integer normalCnt;
    private Integer price;

    private LocalDateTime regDate;
    private LocalDateTime startDate;
    private LocalDateTime endDate;

    private String rejectCause;

    private Long state;

    private List<ReservationDetailVO> detailList;
}
