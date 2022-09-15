package com.owus.shop.service.support.request;


import com.owus.common.domain.AttachFileVO;
import com.owus.shop.domain.support.request.MemberVO;
import com.owus.shop.domain.support.request.ShopAllVO;
import com.owus.shop.domain.support.request.ShopVO;
import com.owus.shop.dto.support.request.MemberDTO;
import com.owus.shop.dto.support.request.ShopAllDTO;
import com.owus.shop.dto.support.request.ShopDTO;
import com.owus.shop.mapper.support.request.RegisterFileMapper;
import com.owus.shop.mapper.support.request.ShopRegisterMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Log4j2
@Service
public class ShopServiceImpl implements ShopService{

    private final ShopRegisterMapper shopRegisterMapper;
    private final RegisterFileMapper fileMapper;
    private final ModelMapper modelMapper;

    @Override
    public ShopAllDTO selectOneAll(Integer mno) {

        ShopAllVO shopAllVO = shopRegisterMapper.selectOneAll(mno);

        log.info("----------------------------");
        log.info(shopAllVO);

        ShopAllDTO shopAllDTO = modelMapper.map(shopAllVO,ShopAllDTO.class);

        return shopAllDTO;
    }

    @Override
    public void insert(ShopDTO shopDTO) {

        ShopVO shopVO = modelMapper.map(shopDTO, ShopVO.class);

        List<AttachFileVO> voList =shopDTO.getUploads().stream()
                .map(uploadResultDTO ->modelMapper.map(uploadResultDTO, AttachFileVO.class) )
                .collect(Collectors.toList());
        log.info(voList);

        shopRegisterMapper.insert(shopVO);
        voList.forEach(attachFileVO -> fileMapper.insert(attachFileVO));

        log.info("====================");
        log.info(shopRegisterMapper);
        log.info("====================");


    }

//    @Override
//    public void update(ShopDTO shopDTO) {
//
//        ShopVO shopVO = modelMapper.map(shopDTO,ShopVO.class);
//
//        shopRegisterMapper.update(106);
//
//    }

    @Override
    public void modify(ShopDTO shopDTO) {

        ShopVO shopVO = modelMapper.map(shopDTO,ShopVO.class);

        shopRegisterMapper.modify(shopVO);
    }
}
