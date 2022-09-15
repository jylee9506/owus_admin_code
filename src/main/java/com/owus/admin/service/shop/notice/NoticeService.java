package com.owus.admin.service.shop.notice;

import com.owus.admin.dto.shop.notice.NoticeDTO;
import com.owus.common.service.BoardService;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface NoticeService extends BoardService<NoticeDTO> {

//    ListResponseDTO<NoticeDTO> getList(ListDTO listDTO);
//    NoticeDTO getOne(Integer bno);
//    void register(NoticeDTO noticeDTO);
//    void updateOne(NoticeDTO noticeDTO);
//    void updateDelflag(Integer bno);
}
