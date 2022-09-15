package com.owus.shop.service.support.request;

import com.owus.shop.dto.support.request.MemberDTO;
import com.owus.shop.dto.support.request.ShopAllDTO;
import com.owus.shop.dto.support.request.ShopDTO;

public interface ShopService {


    ShopAllDTO selectOneAll(Integer mno);

    void insert(ShopDTO shopRegisterDTO);


//    void update(ShopDTO shopDTO);


    void modify(ShopDTO shopDTO);

}
