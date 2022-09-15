package com.owus.shop.domain.mypage.review;

import lombok.*;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDateTime;

@ToString
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReplyVO {

    private Integer mno;
    private Integer rno;
    private String name;
    private String content;
    private int delflag;
    private LocalDateTime regdate;
    private LocalDateTime updatedate;

}
