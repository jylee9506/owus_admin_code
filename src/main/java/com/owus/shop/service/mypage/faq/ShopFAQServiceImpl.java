package com.owus.shop.service.mypage.faq;
/*
 * author          :
 * date            : 2022-06-13
 * time            : 오후 2:46
 * description     :
 * ================================================
 */

import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.common.exception.NotExistContentException;
import com.owus.shop.domain.mypage.faq.FaqVO;
import com.owus.shop.dto.mypage.faq.FaqDTO;
import com.owus.shop.mapper.mypage.faq.ShopFAQMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class ShopFAQServiceImpl implements ShopFAQService{

    private final ShopFAQMapper shopFAQMapper;
    private final ModelMapper modelMapper;

    @Override
    public ListResponseDTO<FaqDTO> getListResp(ListDTO listDTO, Integer mno) {
        List<FaqVO> voList = shopFAQMapper.selectList(mno);

        List<FaqDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, FaqDTO.class))
                .collect(Collectors.toList());

        return ListResponseDTO.<FaqDTO>builder().dtoList(dtoList).build();
    }

    @Override
    public FaqDTO getOne(Integer bno) throws NotExistContentException {
        return modelMapper.map(shopFAQMapper.selectOne(bno), FaqDTO.class);
    }

    @Override
    public void updateOne(FaqDTO dto) {
        shopFAQMapper.update(modelMapper.map(dto, FaqVO.class));
    }

    @Override
    public void removeOne(Integer bno) {
        shopFAQMapper.delete(bno);
    }

    @Override
    public Integer writeOne(FaqDTO dto) {
        FaqVO vo = modelMapper.map(dto, FaqVO.class);

        shopFAQMapper.insert(vo);

        return vo.getBno();
    }
}
