package com.owus.common.service;
/*
 * author          :
 * date            : 2022-05-01
 * time            : 오후 2:28
 * description     :
 * ================================================
 */

import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.common.exception.NotExistContentException;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface BoardService<E> {

    ListResponseDTO<E> getListResp(ListDTO listDTO);

    E getOne(Integer id) throws NotExistContentException;

    void updateOne(E dto);

    void removeOne(Integer id);

    Integer writeOne(E dto);


}
