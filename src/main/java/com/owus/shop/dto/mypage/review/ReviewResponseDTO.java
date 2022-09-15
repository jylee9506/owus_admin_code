package com.owus.shop.dto.mypage.review;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ReviewResponseDTO {
    ReviewDTO reviewDTO;
    ReplyDTO replyDTO;
}
