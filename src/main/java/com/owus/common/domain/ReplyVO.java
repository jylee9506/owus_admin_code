package com.owus.common.domain;

import lombok.*;

import java.time.LocalDateTime;

/*
 * author          :
 * date            : 2022-05-02
 * time            : 오후 9:45
 * description     :
 * ================================================
 */
@Getter
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ReplyVO {

    private Integer rno;
    private Integer bno;
    private Integer mno;
    private Integer mtype;
    private Integer cnt;

    private String nickname;
    private String content;

    private Integer parent;

    private boolean delFlag;

    private LocalDateTime regDate;
    private LocalDateTime updateDate;
}
