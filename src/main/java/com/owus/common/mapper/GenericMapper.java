package com.owus.common.mapper;
/*
 * author          :
 * date            : 2022-05-23
 * time            : 오전 11:23
 * description     :
 * ================================================
 */

import com.owus.common.dto.ListDTO;

import java.util.List;

public interface GenericMapper<E, K> {

    void insert(E vo);

    void delete(K id);

    E selectOne(K id);

    void update(E vo);

    List<E> selectList(ListDTO listDTO);

    int getTotal(ListDTO listDTO);
}
