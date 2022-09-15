package com.owus.shop.service.mypage.item;
/*
 * author          :
 * date            : 2022-06-07
 * time            : 오후 3:47
 * description     :
 * ================================================
 */

import com.owus.admin.dto.shop.member.ShopDpointDTO;
import com.owus.admin.dto.shop.member.ShopItemDTO;
import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.common.service.BoardService;
import com.owus.shop.dto.mypage.item.ShopItemDpointDTO;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface ShopItemService {

    Integer writeOne(ShopItemDTO dto);
    void removeOne(Integer pdno);
    void updateOne(ShopItemDTO dto);

    ListResponseDTO<ShopItemDTO> getListResp(ListDTO listDTO, Integer mno);

    List<ShopDpointDTO> getListDpoint(Integer mno);

    ShopItemDTO getOne(Integer pdno);

}
