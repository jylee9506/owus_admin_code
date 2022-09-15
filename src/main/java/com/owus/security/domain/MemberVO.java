package com.owus.security.domain;
/*
 * author          :
 * date            : 2022-05-16
 * time            : 오전 11:33
 * description     :
 * ================================================
 */

import lombok.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Getter
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor

public class MemberVO {
    private Integer mno;
    private String id, pw, name, nickname, email, phone, address ;
    private Integer mtype, ltype;
    private boolean delFlag;
    private LocalDateTime regDate, updateDate;

    @Builder.Default
    private List<AuthVO> authList = new ArrayList<>();

}
