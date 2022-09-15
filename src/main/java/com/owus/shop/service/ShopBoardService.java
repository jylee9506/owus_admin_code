package com.owus.shop.service;
/*
 * author          :
 * date            : 2022-06-13
 * time            : 오후 2:52
 * description     :
 * ================================================
 */

import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.common.exception.NotExistContentException;
import com.owus.shop.dto.mypage.faq.FaqDTO;

public interface ShopBoardService<E> {

    ListResponseDTO<E> getListResp(ListDTO listDTO, Integer no);

    E getOne(Integer id) throws NotExistContentException;

    void updateOne(E dto);

    void removeOne(Integer id);

    Integer writeOne(E dto);
}
