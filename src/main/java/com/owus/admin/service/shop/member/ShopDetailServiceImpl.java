package com.owus.admin.service.shop.member;
/*
 * author          :
 * date            : 2022-05-30
 * time            : 오후 5:26
 * description     :
 * ================================================
 */

import com.owus.admin.domain.shop.member.ShopDpointVO;
import com.owus.admin.dto.shop.member.ShopDpointDTO;
import com.owus.admin.dto.shop.member.ShopItemDTO;
import com.owus.admin.mapper.shop.member.ShopDetailMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class ShopDetailServiceImpl implements ShopDetailService {
    private final ShopDetailMapper shopItemMapper;
    private final ModelMapper modelMapper;

    @Override
    public List<ShopItemDTO> getItems(Integer mno) {
        List<ShopItemDTO> dtoList = shopItemMapper.selectItems(mno).stream()
                .map(vo -> modelMapper.map(vo, ShopItemDTO.class))
                .collect(Collectors.toList());
        return dtoList;
    }

    @Override
    public List<ShopDpointDTO> getDpoints(Integer mno) {
        List<ShopDpointDTO> dtoList = shopItemMapper.selectDpoints(mno).stream()
                .map(vo -> modelMapper.map(vo, ShopDpointDTO.class))
                .collect(Collectors.toList());
        return dtoList;
    }

    @Override
    public List<ShopDpointDTO> getDpoint(Integer dpno) {
        ShopDpointDTO dto = modelMapper.map(shopItemMapper.selectDpoint(dpno), ShopDpointDTO.class);



        return List.of(dto);
    }
}
