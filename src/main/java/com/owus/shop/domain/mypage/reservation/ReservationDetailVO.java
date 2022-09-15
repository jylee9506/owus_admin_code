package com.owus.shop.domain.mypage.reservation;

import lombok.*;

@Getter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReservationDetailVO {
    private Integer rdNo;
    private Integer rsvNo;
    private String name;
    private String birth;
    private Long gender;
    private Long rentalFlag;
    private Integer footSize;
    private Integer height;
    private Integer weight;
    private Long tutorFlag;
    private String certAssoc;
    private String certNum;
}
