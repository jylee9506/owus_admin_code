package com.owus.shop.domain.support.request;


import lombok.*;

import java.time.LocalDateTime;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class MemberVO {

    private Integer mno;
    private String id;
    private String pw;
    private String name;
    private String phone;
    private String email;
    private String address;
    private Long mtype;
    private Long itype;
    private Long delflag;
    private LocalDateTime regdate;
    private LocalDateTime updatedate;




}
