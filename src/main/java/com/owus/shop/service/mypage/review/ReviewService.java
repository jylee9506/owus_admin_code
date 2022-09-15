package com.owus.shop.service.mypage.review;

import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.shop.dto.mypage.review.ReviewDTO;
import com.owus.shop.dto.mypage.review.ReviewResponseDTO;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface ReviewService  {

    ListResponseDTO<ReviewDTO> getList(ListDTO listDTO);
    ReviewResponseDTO getOne(Integer rno);
}
