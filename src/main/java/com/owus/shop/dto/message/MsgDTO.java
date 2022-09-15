package com.owus.shop.dto.message;
/*
 * author          :
 * date            : 2022-06-22
 * time            : 오후 4:58
 * description     :
 * ================================================
 */

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class MsgDTO {

    private Integer bno;
    private Integer fmno;
    private Integer tmno;

    private Integer fmtype;
    private Integer tmtype;

    private String fnickname;
    private String tnickname;

    private String content;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private LocalDateTime sendDate;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private LocalDateTime readDate;

}
