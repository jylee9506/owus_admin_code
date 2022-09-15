package com.owus.admin.service.shop.member;
/*
 * author          :
 * date            : 2022-05-30
 * time            : 오후 5:21
 * description     :
 * ================================================
 */

import com.owus.admin.dto.shop.member.ShopDpointDTO;
import com.owus.admin.dto.shop.member.ShopItemDTO;

import java.util.List;

public interface ShopDetailService {

    List<ShopItemDTO> getItems(Integer mno);
    List<ShopDpointDTO> getDpoints(Integer mno);
    List<ShopDpointDTO> getDpoint(Integer dpno);


}
