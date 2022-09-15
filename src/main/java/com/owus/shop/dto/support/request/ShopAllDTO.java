package com.owus.shop.dto.support.request;


import lombok.Data;

import java.time.LocalDateTime;

@Data
public class ShopAllDTO {

    private Integer mno;
    private String id;
    private String name;
    private String phone;
    private String email;
    private String address;
    private LocalDateTime regdate;
    private LocalDateTime updatedate;

    private String bzNum;
    private String cfBz;
    private String cfAssoc;
    private String cfMof;
    private String cfSafety;
    private String cfCharging;
    private Long state;
}
