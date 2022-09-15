package com.owus.shop.domain.message;
/*
 * author          :
 * date            : 2022-06-23
 * time            : 오후 6:30
 * description     :
 * ================================================
 */

import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Getter
@AllArgsConstructor
@RequiredArgsConstructor
@ToString
@Builder
public class MsgSendVO {

    private Integer fmno;
    private String content;

    private List<Integer> tnoList = new ArrayList<>();

}
