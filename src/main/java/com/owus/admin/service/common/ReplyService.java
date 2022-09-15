package com.owus.admin.service.common;
/*
 * author          :
 * date            : 2022-05-23
 * time            : 오후 7:11
 * description     :
 * ================================================
 */

import com.owus.common.dto.ListDTO;

import java.util.List;

public interface ReplyService<E>{

    List<E> getList(Integer bno, ListDTO listDTO);

    List<E> getSubList(Integer bno, Integer rno);

    int addOne(E replyDTO);
    //
    void updateOne(E replyDTO);

    void removeOne(E replyDTO);
}
