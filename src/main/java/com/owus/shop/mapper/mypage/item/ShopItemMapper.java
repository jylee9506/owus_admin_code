package com.owus.shop.mapper.mypage.item;
/*
 * author          :
 * date            : 2022-06-07
 * time            : 오후 3:37
 * description     :
 * ================================================
 */

import com.owus.admin.domain.shop.member.ShopDpointVO;
import com.owus.admin.domain.shop.member.ShopItemVO;
import com.owus.common.dto.ListDTO;
import com.owus.common.mapper.GenericMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShopItemMapper extends GenericMapper<ShopItemVO, Integer> {

    List<ShopItemVO> selectList(@Param("listDTO") ListDTO listDTO, @Param("mno") Integer mno);

    List<ShopDpointVO> selectDpointList(Integer mno);

    ShopDpointVO selectDpoint(Integer dpno);
}
