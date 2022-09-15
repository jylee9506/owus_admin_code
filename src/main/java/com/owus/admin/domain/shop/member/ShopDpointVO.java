package com.owus.admin.domain.shop.member;
/*
 * author          :
 * date            : 2022-05-31
 * time            : 오후 2:14
 * description     :
 * ================================================
 */

import lombok.*;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor

public class ShopDpointVO {

    private Integer dpno;
    private Integer mno;
    private String title;
    private String content;
    private float lat;
    private float lng;
    private String mainImg;

}
