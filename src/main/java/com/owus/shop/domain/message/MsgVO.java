package com.owus.shop.domain.message;
/*
 * author          :
 * date            : 2022-06-22
 * time            : 오후 5:09
 * description     :
 * ================================================
 */

import lombok.*;

import java.time.LocalDateTime;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MsgVO {

    private Integer bno;
    private Integer fmno;
    private Integer tmno;

    private Integer fmtype;
    private Integer tmtype;

    private String fnickname;
    private String tnickname;

    private String content;

    private LocalDateTime sendDate;
    private LocalDateTime readDate;
}
