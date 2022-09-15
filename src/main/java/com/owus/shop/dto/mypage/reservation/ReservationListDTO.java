package com.owus.shop.dto.mypage.reservation;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Builder
public class ReservationListDTO {
    private Integer rsvNo;
    private String pdName;
    private String name;
    private Integer tutorCnt;
    private Integer normalCnt;
    private Integer price;

    private LocalDateTime regDate;
    private LocalDateTime startDate;
    private LocalDateTime endDate;

    private Long state;
}
