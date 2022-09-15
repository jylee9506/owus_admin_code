package com.owus.shop.domain.mypage.reservation;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReservationVO {
    private Integer rsvNo;
    private Integer mno;
    private Integer pdNo;
    private Integer price;
    private LocalDateTime startDate;
    private LocalDateTime endDate;
    private Integer tutorCnt;
    private Integer normalCnt;
    private Long state;
    private LocalDateTime regDate;
    private LocalDateTime updateDate;
    private String rejectCause;
}
