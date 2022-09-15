package com.owus.admin.service.ask;
/*
 * author          :
 * date            : 2022-05-24
 * time            : 오후 8:19
 * description     :
 * ================================================
 */

import com.owus.admin.dto.ask.AskDTO;
import com.owus.common.service.BoardService;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface AskService extends BoardService<AskDTO> {
    void answerToAsk(Integer bno);
}
