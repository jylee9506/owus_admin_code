package com.owus.admin.service.shop.member;
/*
 * author          :
 * date            : 2022-05-29
 * time            : 오후 12:14
 * description     :
 * ================================================
 */

import com.owus.admin.domain.shop.member.ShopMemberVO;
import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.admin.dto.shop.member.ShopMemberDTO;
import com.owus.admin.mapper.shop.member.ShopMemberMapper;
import com.owus.common.exception.NotExistContentException;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class ShopMemberServiceImpl implements ShopMemberService {

    private final ShopMemberMapper shopMemberMapper;
    private final ModelMapper modelMapper;

    @Override
    public ListResponseDTO<ShopMemberDTO> getListResp(ListDTO listDTO) {
        log.info("==================");
        log.info("======service======");

        List<ShopMemberDTO> dtoList =
                shopMemberMapper.selectList(listDTO).stream()
                        .map(vo -> modelMapper.map(vo, ShopMemberDTO.class))
                        .collect(Collectors.toList());

        log.info(dtoList);

        Integer total = shopMemberMapper.getTotal(listDTO);

        return ListResponseDTO.<ShopMemberDTO>builder()
                .dtoList(dtoList)
                .total(total)
                .build();
    }

    @Override
    public ShopMemberDTO getOne(Integer mno) throws NotExistContentException {
        ShopMemberVO vo = shopMemberMapper.selectOne(mno);
        if(vo == null) throw new NotExistContentException();

        return modelMapper.map(vo, ShopMemberDTO.class);
    }

    @Override
    public void updateOne(ShopMemberDTO dto) {
        ShopMemberVO vo = modelMapper.map(dto, ShopMemberVO.class);

        shopMemberMapper.update(vo);
        shopMemberMapper.updateSub(vo);

    }

    @Override
    public void updateStateOne(ShopMemberDTO dto) {
        ShopMemberVO vo = modelMapper.map(dto, ShopMemberVO.class);
        shopMemberMapper.updateState(vo);
    }

    @Override
    public void removeOne(Integer bno) {

    }

    @Override
    public Integer writeOne(ShopMemberDTO dto) {
        return null;
    }
}
