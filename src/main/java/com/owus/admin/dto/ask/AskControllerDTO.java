package com.owus.admin.dto.ask;
/*
 * author          :
 * date            : 2022-05-31
 * time            : 오후 10:50
 * description     :
 * ================================================
 */

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import java.util.TreeMap;

@Data
@Builder
@AllArgsConstructor
public class AskControllerDTO {

    private TreeMap<Long, String> category;
    private String base;
    private Integer mtype;

}
