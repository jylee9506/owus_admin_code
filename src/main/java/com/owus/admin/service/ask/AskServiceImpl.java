package com.owus.admin.service.ask;
/*
 * author          :
 * date            : 2022-05-23
 * time            : 오후 12:23
 * description     :
 * ================================================
 */

import com.owus.common.domain.AttachFileVO;
import com.owus.admin.domain.ask.AskVO;
import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.admin.dto.ask.AskDTO;
import com.owus.admin.mapper.ask.AskFileMapper;
import com.owus.admin.mapper.ask.AskMapper;
import com.owus.common.exception.NotExistContentException;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor

public class AskServiceImpl implements AskService {
    private final AskMapper askMapper;
    private final AskFileMapper fileMapper;
    private final ModelMapper modelMapper;

    @Override
    public ListResponseDTO<AskDTO> getListResp(ListDTO listDTO) {
        List<AskVO> voList = askMapper.selectList(listDTO);
        List<AskDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, AskDTO.class))
                .collect(Collectors.toList());

        int total = askMapper.getTotal(listDTO);

        return ListResponseDTO.<AskDTO>builder()
                .dtoList(dtoList)
                .total(total)
                .build();
    }

    @Override
    public AskDTO getOne(Integer bno) throws NotExistContentException {

        AskVO vo = askMapper.selectOne(bno);
        AskDTO dto = modelMapper.map(vo, AskDTO.class);

        return dto;
    }

    @Override
    public void updateOne(AskDTO dto) {
        AskVO vo = modelMapper.map(dto, AskVO.class);
        fileMapper.delete(vo.getBno());

        dto.getUploads().stream()
                .map(up -> {
                    up.setBno(vo.getBno());
                    return modelMapper.map(up, AttachFileVO.class);
                })
                .forEach(af -> {
                    log.info(af);
                    fileMapper.insert(af);
                    fileMapper.insertMapping(af);
                });

        askMapper.update(vo);
    }

    @Override
    public void removeOne(Integer bno) {
        fileMapper.delete(bno);
        askMapper.delete(bno);
    }

    @Override
    public Integer writeOne(AskDTO dto) {
        log.info("===================");
        log.info("===================");
        log.info("===================");

        AskVO vo = modelMapper.map(dto, AskVO.class);

        log.info(vo);

        List<AttachFileVO> files = dto.getUploads().stream()
                .map(b -> modelMapper.map(b, AttachFileVO.class))
                .collect(Collectors.toList());

        askMapper.insert(vo);
        files.forEach(fileMapper::insert);
        files.forEach(fileMapper::insertMapping);

        return vo.getBno();
    }

    @Override
    public void answerToAsk(Integer bno) {
        askMapper.answerUpdate(bno);
    }
}
