package com.owus.admin.domain.ask;

import lombok.*;

import java.time.LocalDateTime;

/*
 * author          :
 * date            : 2022-05-23
 * time            : 오전 11:25
 * description     :
 * ================================================
 */
@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor

public class AskVO {
    private Integer bno;
    private Integer mno;
    private Integer mtype;
    private Integer replyCount;
    private Long category;

    private String nickname;
    private String title;
    private String content;

    private String mainImg;

    private LocalDateTime regDate;
    private LocalDateTime answerDate;

}
