package com.owus.shop.mapper.support.request;


import com.owus.common.mapper.GenericMapper;
import com.owus.shop.domain.support.request.MemberVO;
import com.owus.shop.domain.support.request.ShopAllVO;
import com.owus.shop.domain.support.request.ShopVO;
import com.owus.shop.dto.support.request.ShopDTO;

public interface ShopRegisterMapper extends GenericMapper<ShopVO,Integer> {


    //MemberVO selectOne(Integer mno);

    ShopAllVO selectOneAll(Integer mno);

    void insert(ShopVO shopRegisterVO);

    void update(Integer mno);

    void modify(ShopVO shopVO);

}
