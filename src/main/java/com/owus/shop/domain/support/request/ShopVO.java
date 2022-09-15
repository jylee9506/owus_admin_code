package com.owus.shop.domain.support.request;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class ShopVO {

    private Integer mno;
    private String bzNum;
    private String cfBz;
    private String cfAssoc;
    private String cfMof;
    private String cfSafety;
    private String cfCharging;
    private Long state;
    private LocalDateTime regDate;
    private LocalDateTime updateDate;


}
