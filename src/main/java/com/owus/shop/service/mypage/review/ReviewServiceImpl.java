package com.owus.shop.service.mypage.review;

import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.shop.domain.mypage.review.ReplyVO;
import com.owus.shop.domain.mypage.review.ReviewVO;
import com.owus.shop.dto.mypage.review.ReplyDTO;
import com.owus.shop.dto.mypage.review.ReviewDTO;
import com.owus.shop.dto.mypage.review.ReviewResponseDTO;
import com.owus.shop.mapper.mypage.review.ReviewMapper;
import com.owus.shop.mapper.mypage.review.ReviewReplyMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Log4j2
public class ReviewServiceImpl implements ReviewService {

    private final ReviewReplyMapper reviewReplyMapper;
    private final ReviewMapper reviewMapper;
    private final ModelMapper modelMapper;
    @Override
    public ListResponseDTO<ReviewDTO> getList(ListDTO listDTO) {

        List<ReviewVO> voList = reviewMapper.selectList(listDTO);
        List<ReviewDTO> dtoList = voList.stream().map(vo ->  modelMapper.map(vo,ReviewDTO.class)).collect(Collectors.toList());


        return ListResponseDTO.<ReviewDTO>builder()
                .dtoList(dtoList)
                .total(reviewMapper.getTotal(listDTO)).build();
    }

    public ReviewResponseDTO getOne(Integer rno){
        ReviewVO reviewVO = reviewMapper.selectOne(rno);
        ReplyVO replyVO = reviewReplyMapper.selectOne(rno);
        ReplyDTO replyDTO =null;

        ReviewDTO reviewDTO = modelMapper.map(reviewVO, ReviewDTO.class);


        if(replyVO != null){
            replyDTO = modelMapper.map(replyVO, ReplyDTO.class);
        }

        return ReviewResponseDTO.builder().reviewDTO(reviewDTO).replyDTO(replyDTO).build();
    }




}
