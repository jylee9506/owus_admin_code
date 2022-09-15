package com.owus.shop.domain.support.request;


import lombok.*;

import java.time.LocalDateTime;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class ShopAllVO {
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
