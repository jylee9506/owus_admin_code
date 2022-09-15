package com.owus.shop.dto.mypage.item;
/*
 * author          :
 * date            : 2022-06-08
 * time            : 오후 5:51
 * description     :
 * ================================================
 */

import com.owus.admin.dto.shop.member.ShopDpointDTO;
import com.owus.admin.dto.shop.member.ShopItemDTO;
import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class ShopItemDpointDTO {

    private ShopItemDTO shopItemDTO;
    private ShopDpointDTO shopDpointDTO;

}
