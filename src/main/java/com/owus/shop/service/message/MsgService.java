package com.owus.shop.service.message;
/*
 * author          :
 * date            : 2022-06-22
 * time            : 오후 7:06
 * description     :
 * ================================================
 */

import com.owus.common.dto.ListResponseDTO;
import com.owus.shop.dto.message.MsgDTO;
import com.owus.shop.dto.message.MsgListDTO;
import com.owus.shop.dto.message.MsgSendDTO;
import com.owus.shop.dto.message.MsgUserDTO;

import java.util.List;

public interface MsgService {

    ListResponseDTO<MsgDTO> getList(MsgListDTO msgListDTO);

    Integer getTotal(MsgListDTO msgListDTO);

    List<MsgUserDTO> getDivers(String keyword);

    void sendMsg(MsgSendDTO msgSendDTO);

    MsgDTO getMsg(Integer bno);
}
