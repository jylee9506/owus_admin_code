package com.owus.shop.dto.message;
/*
 * author          :
 * date            : 2022-06-23
 * time            : 오후 6:30
 * description     :
 * ================================================
 */

import lombok.Builder;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class MsgSendDTO {

    private Integer fmno;
    private String content;

    private List<Integer> tmnoList = new ArrayList<>();

}
