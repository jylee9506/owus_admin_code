package com.owus.shop.dto.dashboard;
/*
 * author          :
 * date            : 2022-06-21
 * time            : 오후 6:13
 * description     :
 * ================================================
 */

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
public class RecentRsvDTO {

    private Integer rsvno;

    private String pdName;
    private Integer pdLimit;
    private Long tutorCnt;
    private Long normalCnt;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yy-MM-dd", timezone = "Asia/Seoul")
    private LocalDate startDate;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yy-MM-dd", timezone = "Asia/Seoul")
    private LocalDate endDate;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
    private LocalDateTime regDate;

}
