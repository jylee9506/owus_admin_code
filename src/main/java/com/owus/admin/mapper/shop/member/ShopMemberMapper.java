package com.owus.admin.mapper.shop.member;
/*
 * author          :
 * date            : 2022-05-29
 * time            : 오전 10:12
 * description     :
 * ================================================
 */

import com.owus.admin.domain.shop.member.ShopMemberVO;
import com.owus.common.mapper.GenericMapper;

public interface ShopMemberMapper extends GenericMapper<ShopMemberVO, Integer> {
    void updateState(ShopMemberVO vo);
    void updateSub(ShopMemberVO vo);
}
