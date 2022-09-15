package com.owus.admin.domain.shop.notice;

import lombok.*;

import java.sql.Timestamp;
import java.time.LocalDateTime;

@ToString
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class NoticeVO {

    private Integer bno;
    private Integer mno;
    private String name;
    private String title;
    private String content;
    private int delflag;
    private String mainImage;

    private LocalDateTime regDate;
    private LocalDateTime updateDate;

}
