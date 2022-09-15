package com.owus.admin.dto.shop.member;
/*
 * author          :
 * date            : 2022-05-29
 * time            : 오전 10:14
 * description     :
 * ================================================
 */

import lombok.*;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDateTime;

@Data
@Log4j2
public class ShopMemberDTO {

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
    private Long newState;

    private LocalDateTime requestDate;
    private LocalDateTime approveDate;

    public void setNewState(Long newState) {
        this.newState = newState;
        this.state = newState;
    }

    public void setState(Long state) {
        this.state = this.newState == null ? state : this.newState;
    }
}
