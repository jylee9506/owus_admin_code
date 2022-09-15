package com.owus.shop.service.message;
/*
 * author          :
 * date            : 2022-06-22
 * time            : 오후 7:07
 * description     :
 * ================================================
 */

import com.owus.common.dto.ListResponseDTO;
import com.owus.shop.domain.message.MsgSendVO;
import com.owus.shop.domain.message.MsgUserVO;
import com.owus.shop.domain.message.MsgVO;
import com.owus.shop.dto.message.MsgDTO;
import com.owus.shop.dto.message.MsgListDTO;
import com.owus.shop.dto.message.MsgSendDTO;
import com.owus.shop.dto.message.MsgUserDTO;
import com.owus.shop.mapper.message.MsgMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class MsgServiceImpl implements MsgService{

    private final MsgMapper msgMapper;
    private final ModelMapper modelMapper;

    @Override
    public ListResponseDTO<MsgDTO> getList(MsgListDTO msgListDTO) {

        List<MsgVO> voList = msgMapper.selectList(msgListDTO);
        List<MsgDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, MsgDTO.class))
                .collect(Collectors.toList());

        Integer total = msgMapper.selectTotal(msgListDTO);

        return ListResponseDTO.<MsgDTO>builder()
                .dtoList(dtoList)
                .total(total)
                .build();
    }

    @Override
    public Integer getTotal(MsgListDTO msgListDTO) {
        return msgMapper.selectTotal(msgListDTO);
    }

    @Override
    public List<MsgUserDTO> getDivers(String keyword) {
        List<MsgUserVO> voList = msgMapper.selectDivers(keyword);

        log.info("=================voList");
        log.info(voList);

        return voList.stream()
                .map(vo -> modelMapper.map(vo, MsgUserDTO.class))
                .collect(Collectors.toList());
    }

    @Override
    public void sendMsg(MsgSendDTO msgSendDTO) {

        MsgSendVO vo = modelMapper.map(msgSendDTO, MsgSendVO.class);

        log.info("========sendMsg VO==========");
        log.info(vo);

        msgMapper.insertMsg(vo);


    }

    @Override
    public MsgDTO getMsg(Integer bno) {



        return null;
    }
}
