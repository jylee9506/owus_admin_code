package com.owus.shop.domain.message;
/*
 * author          :
 * date            : 2022-06-23
 * time            : 오후 3:25
 * description     :
 * ================================================
 */

import lombok.*;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class MsgUserVO {

    private Integer mno;
    private String id;
    private String name;
    private String nickname;

}
