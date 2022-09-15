package com.owus.shop.dto.support.request;


import lombok.*;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberDTO {

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
