package com.owus.common.dto;
/*
 * author          :
 * date            : 2022-05-01
 * time            : 오후 2:26
 * description     :
 * ================================================
 */


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor

public class ListResponseDTO<E> {
    private List<E> dtoList;
    private Integer total;
}
