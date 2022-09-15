package com.owus.shop.mapper.mypage.review;

import com.owus.common.mapper.GenericMapper;
import com.owus.shop.domain.mypage.review.ReplyVO;
import com.owus.shop.domain.mypage.review.ReviewVO;
import org.apache.ibatis.annotations.Param;

public interface ReviewMapper extends GenericMapper<ReviewVO,Integer> {

    void updateState(@Param("rno") Integer rno,@Param("state") Integer state);
    ReplyVO selectOneOfAnswer(Integer rno);

}
