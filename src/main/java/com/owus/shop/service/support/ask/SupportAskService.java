package com.owus.shop.service.support.ask;
/*
 * author          :
 * date            : 2022-06-09
 * time            : 오후 8:33
 * description     :
 * ================================================
 */

import com.owus.admin.dto.ask.AskDTO;
import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.common.service.BoardService;

public interface SupportAskService {
    ListResponseDTO<AskDTO> getListResp(ListDTO listDTO, Integer mno);

    AskDTO getOne(Integer bno);

    Integer writeOne(AskDTO askDTO);

    void removeOne(Integer bno);

    void updateOne(AskDTO dto);

}
