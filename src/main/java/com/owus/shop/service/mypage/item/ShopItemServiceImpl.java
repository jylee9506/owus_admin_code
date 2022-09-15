package com.owus.shop.service.mypage.item;
/*
 * author          :
 * date            : 2022-06-07
 * time            : 오후 3:47
 * description     :
 * ================================================
 */

import com.owus.admin.domain.shop.member.ShopDpointVO;
import com.owus.admin.domain.shop.member.ShopItemVO;
import com.owus.admin.dto.shop.member.ShopDpointDTO;
import com.owus.admin.dto.shop.member.ShopItemDTO;
import com.owus.common.domain.AttachFileVO;
import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.common.dto.UploadResultDTO;
import com.owus.common.exception.NotExistContentException;
import com.owus.shop.dto.mypage.item.ShopItemDpointDTO;
import com.owus.shop.mapper.mypage.item.ShopItemFileMapper;
import com.owus.shop.mapper.mypage.item.ShopItemMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor

public class ShopItemServiceImpl implements ShopItemService{

    private final ShopItemMapper shopItemMapper;
    private final ModelMapper modelMapper;
    private final ShopItemFileMapper fileMapper;

    @Override
    public ListResponseDTO<ShopItemDTO> getListResp(ListDTO listDTO, Integer mno) {
        List<ShopItemVO> voList = shopItemMapper.selectList(listDTO, mno);
        List<ShopItemDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, ShopItemDTO.class))
                .collect(Collectors.toList());


        return ListResponseDTO.<ShopItemDTO>builder()
                .dtoList(dtoList)
                .total(dtoList.size())
                .build();
    }

    @Override
    public List<ShopDpointDTO> getListDpoint(Integer mno) {
        List<ShopDpointVO> voList = shopItemMapper.selectDpointList(mno);

        return voList.stream()
                .map(vo -> modelMapper.map(vo, ShopDpointDTO.class))
                .collect(Collectors.toList());
    }

    @Override
    public ShopItemDTO getOne(Integer pdno) throws NotExistContentException {
        ShopItemVO vo = shopItemMapper.selectOne(pdno);
        ShopItemDTO dto = modelMapper.map(vo, ShopItemDTO.class);

        List<AttachFileVO> avoList = fileMapper.selectFiles(pdno);

        List<UploadResultDTO> uploads = avoList.stream()
                .map(avo -> modelMapper.map(avo, UploadResultDTO.class))
                .collect(Collectors.toList());

        dto.setUploads(uploads);

        return dto;
    }

    @Override
    public void updateOne(ShopItemDTO dto) {
        ShopItemVO vo = modelMapper.map(dto, ShopItemVO.class);
        shopItemMapper.update(vo);

        List<AttachFileVO> files = dto.getUploads().stream()
                .map(b -> {
                    AttachFileVO avo = modelMapper.map(b, AttachFileVO.class);
                    avo.setBno(dto.getPdno());
                    return avo;
                })
                .collect(Collectors.toList());

        fileMapper.delete(dto.getPdno());

        files.forEach(log::info);

        files.forEach(fileMapper::insert);
        files.forEach(fileMapper::insertMapping);
    }

    @Override
    public void removeOne(Integer pdno) {
        shopItemMapper.delete(pdno);
        fileMapper.delete(pdno);
    }

    @Override
    public Integer writeOne(ShopItemDTO dto) {
        ShopItemVO vo = modelMapper.map(dto, ShopItemVO.class);

        log.info(vo);

        List<AttachFileVO> files = dto.getUploads().stream()
                .map(b -> modelMapper.map(b, AttachFileVO.class))
                .collect(Collectors.toList());

        shopItemMapper.insert(vo);
        files.forEach(fileMapper::insert);
        files.forEach(fileMapper::insertMapping);

        return vo.getPdno();
    }
}
