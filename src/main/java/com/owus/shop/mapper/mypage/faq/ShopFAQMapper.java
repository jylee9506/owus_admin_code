package com.owus.shop.mapper.mypage.faq;
/*
 * author          :
 * date            : 2022-06-13
 * time            : 오후 2:35
 * description     :
 * ================================================
 */

import com.owus.common.mapper.GenericMapper;
import com.owus.shop.domain.mypage.faq.FaqVO;

import java.util.List;

public interface ShopFAQMapper extends GenericMapper<FaqVO, Integer> {
    List<FaqVO> selectList(Integer mno);
}
