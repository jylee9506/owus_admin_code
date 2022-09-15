package com.owus.shop.service.mypage.review;

import com.owus.shop.domain.mypage.review.ReplyVO;
import com.owus.shop.dto.mypage.review.ReplyDTO;
import com.owus.shop.mapper.mypage.review.ReviewReplyMapper;
import com.owus.shop.mapper.mypage.review.ReviewMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Log4j2
public class ReviewReplyServiceImpl implements ReviewReplyService {

    private final ReviewReplyMapper reviewReplyMapper;
    private final ReviewMapper reviewMapper;
    private final ModelMapper modelMapper;

    @Override
    public ReplyDTO getOne(Integer rno) {
        ReplyVO replyVO = reviewReplyMapper.selectOne(rno);

        return modelMapper.map(replyVO,ReplyDTO.class);
    }

    @Override
    public void insert(ReplyDTO replyDTO) {
        ReplyVO replyVO = modelMapper.map(replyDTO, ReplyVO.class);
        reviewReplyMapper.insert(replyVO);
        reviewMapper.updateState(replyVO.getRno() ,1);
    }

    @Override
    public void modify(ReplyDTO replyDTO) {
        ReplyVO replyVO = modelMapper.map(replyDTO, ReplyVO.class);
        reviewReplyMapper.update(replyVO);
    }

    @Override
    public void delete(Integer rno) {
        reviewReplyMapper.delete(rno);
        reviewMapper.updateState(rno,0);
    }


}
