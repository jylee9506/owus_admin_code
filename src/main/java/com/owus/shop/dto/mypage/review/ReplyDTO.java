package com.owus.shop.dto.mypage.review;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class ReplyDTO {
    private Integer mno;
    private Integer rno;
    private String name;
    private String content;
    private int delflag;
    private LocalDateTime regdate;
    private LocalDateTime updatedate;
}
