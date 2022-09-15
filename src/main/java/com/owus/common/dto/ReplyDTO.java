package com.owus.common.dto;
/*
 * author          :
 * date            : 2022-05-02
 * time            : 오후 10:07
 * description     :
 * ================================================
 */

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@RequiredArgsConstructor

public class ReplyDTO {

    private Integer rno;
    private Integer bno;
    private Integer mno;
    private Integer mtype;
    private Integer cnt;

    private String nickname;
    private String content;

    private Integer parent;

    private boolean delFlag;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
    private LocalDateTime regDate;
    private LocalDateTime updateDate;
}
