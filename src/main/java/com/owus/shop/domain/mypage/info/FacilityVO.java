package com.owus.shop.domain.mypage.info;

import lombok.*;
import lombok.extern.log4j.Log4j2;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
@Getter
public class FacilityVO {

    private Integer mno;
    private Integer fno;
    private String name;
}
