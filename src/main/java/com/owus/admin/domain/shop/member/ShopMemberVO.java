package com.owus.admin.domain.shop.member;
/*
 * author          :
 * date            : 2022-05-29
 * time            : 오전 10:14
 * description     :
 * ================================================
 */

import lombok.*;

import java.time.LocalDateTime;

@Getter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class ShopMemberVO {

    private Integer mno;
    private String id;
//    private String pw;
    private String name;
    private String email;
    private String phone;
    private String address;

    private Integer mtype;
    private boolean delFlag;

    private LocalDateTime regDate;
    private LocalDateTime updateDate;

    private String bzNum;
    private String cfBz;
    private String cfAssoc;
    private String cfMof;
    private String cfSafety;
    private String cfCharging;
    private Long state;

    private LocalDateTime requestDate;
    private LocalDateTime approveDate;
}
