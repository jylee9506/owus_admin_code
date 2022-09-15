package com.owus.shop.dto.message;
/*
 * author          :
 * date            : 2022-06-23
 * time            : 오후 3:25
 * description     :
 * ================================================
 */

import lombok.Builder;
import lombok.Data;

@Data
public class MsgUserDTO {

    private Integer mno;
    private String id;
    private String name;
    private String nickname;

}
