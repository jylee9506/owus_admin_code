package com.owus.shop.domain.dashboard;
/*
 * author          :
 * date            : 2022-06-21
 * time            : 오후 6:13
 * description     :
 * ================================================
 */

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RecentRsvVO {

    private Integer rsvno;

    private String pdName;
    private Integer pdLimit;
    private Long tutorCnt;
    private Long normalCnt;

    private LocalDate startDate;
    private LocalDate endDate;
    private LocalDateTime regDate;

}
