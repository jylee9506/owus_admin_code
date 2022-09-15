package com.owus.admin.mapper.shop.member;
/*
 * author          :
 * date            : 2022-05-30
 * time            : 오후 5:22
 * description     :
 * ================================================
 */

import com.owus.admin.domain.shop.member.ShopDpointVO;
import com.owus.admin.domain.shop.member.ShopItemVO;

import java.util.List;

public interface ShopDetailMapper {

    List<ShopItemVO> selectItems(Integer mno);
    List<ShopDpointVO> selectDpoints(Integer mno);
    ShopDpointVO selectDpoint(Integer dpno);
}
