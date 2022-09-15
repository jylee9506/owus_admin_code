package com.owus.shop.dto.mypage.faq;
/*
 * author          :
 * date            : 2022-06-13
 * time            : 오후 2:36
 * description     :
 * ================================================
 */

import lombok.*;

import java.time.LocalDateTime;

@Data
public class FaqDTO {

    private Integer bno;
    private Integer mno;
    private String title;
    private String content;
    private boolean delFlag;
    private LocalDateTime regDate;
    private LocalDateTime updateDate;

}
