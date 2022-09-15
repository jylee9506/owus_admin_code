package com.owus.shop.dto.mypage.review;

import lombok.*;

import java.time.LocalDateTime;

@Data
public class ReviewDTO {
    //상품
    private Integer pdno;
    private Integer mno;
    private String pdContent;
    private Integer pdlimit;
    private String mainimg;
    private Integer price;
    private Integer resprice;
    private Integer dprice;
    private LocalDateTime pdRegdate;
    private LocalDateTime pdUpdatedate;
    // 리뷰
    private Integer rno;
    private String pdname;
    private Integer rsvno;
    private Integer score;
    private String content;
    private int deldate;
    private LocalDateTime regdate;
    private LocalDateTime updatedate;
    private int state;
    private String name;

}
