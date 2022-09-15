package com.owus.admin.dto.job;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor

public class JobBoardListResponseDTO<E> {

    private List<E> dtoList;

    private List<E> noticedtoList;

    private Integer total;
}
