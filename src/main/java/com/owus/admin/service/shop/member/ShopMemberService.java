package com.owus.admin.service.shop.member;
/*
 * author          :
 * date            : 2022-05-29
 * time            : 오후 12:26
 * description     :
 * ================================================
 */

import com.owus.admin.dto.shop.member.ShopMemberDTO;
import com.owus.common.service.BoardService;

public interface ShopMemberService extends BoardService<ShopMemberDTO> {
    void updateStateOne(ShopMemberDTO dto);
}
