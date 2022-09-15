package com.owus.shop.mapper.message;
/*
 * author          :
 * date            : 2022-06-22
 * time            : 오후 5:10
 * description     :
 * ================================================
 */

import com.owus.shop.domain.message.MsgSendVO;
import com.owus.shop.domain.message.MsgUserVO;
import com.owus.shop.domain.message.MsgVO;
import com.owus.shop.dto.message.MsgListDTO;

import java.util.List;

public interface MsgMapper {

    List<MsgVO> selectList(MsgListDTO msgListDTO);

    Integer selectTotal(MsgListDTO msgListDTO);

    List<MsgUserVO> selectDivers(String keyword);

    void insertMsg(MsgSendVO msgSendVO);

    MsgVO selectOne(Integer bno);
}
