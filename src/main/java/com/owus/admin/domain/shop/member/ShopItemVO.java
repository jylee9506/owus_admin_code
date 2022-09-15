package com.owus.admin.domain.shop.member;
/*
 * author          :
 * date            : 2022-05-30
 * time            : 오후 4:58
 * description     :
 * ================================================
 */

import lombok.*;

import java.time.LocalDateTime;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ShopItemVO {

    private Integer pdno;
    private Integer mno;
    private String pdName;
    private String content;
    private Integer pdLimit;

    private Long price;
    private Long dprice;

    private String mainImg;

    private Integer dpno;

    private LocalDateTime regDate;
    private LocalDateTime  updateDate;

}
