package com.owus.shop.service.mypage.review;

import com.owus.shop.dto.mypage.review.ReplyDTO;

public interface ReviewReplyService {

    ReplyDTO getOne(Integer rno);
    void insert(ReplyDTO replyDTO);
    void modify(ReplyDTO replyDTO);
    void delete(Integer rno);

}
