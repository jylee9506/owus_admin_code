package com.owus.admin.dto.shop.member;
/*
 * author          :
 * date            : 2022-05-31
 * time            : 오후 2:14
 * description     :
 * ================================================
 */

import lombok.Data;

@Data
public class ShopDpointDTO {

    private Integer dpno;
    private Integer mno;
    private String title;
    private String content;
    private float lat;
    private float lng;
    private String mainImg;


}
