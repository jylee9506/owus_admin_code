package com.owus.shop.service.support.ask;
/*
 * author          :
 * date            : 2022-06-07
 * time            : 오전 12:23
 * description     :
 * ================================================
 */

import com.owus.admin.domain.ask.AskVO;
import com.owus.admin.dto.ask.AskDTO;
import com.owus.admin.mapper.ask.AskFileMapper;
import com.owus.common.domain.AttachFileVO;
import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.common.exception.NotExistContentException;
import com.owus.common.service.BoardService;
import com.owus.shop.mapper.support.ask.SupportAskMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class SupportAskServiceImpl implements SupportAskService {

    private final SupportAskMapper supportAskMapper;

    private final AskFileMapper fileMapper;
    private final ModelMapper modelMapper;

    @Override
    public ListResponseDTO<AskDTO> getListResp(ListDTO listDTO, Integer mno) {

        List<AskVO> voList = supportAskMapper.selectList(listDTO, mno);

        List<AskDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, AskDTO.class))
                .collect(Collectors.toList());

        int total = supportAskMapper.getTotal(listDTO, mno);

        return ListResponseDTO.<AskDTO>builder()
                .dtoList(dtoList)
                .total(total)
                .build();
    }

    @Override
    public AskDTO getOne(Integer bno) {
        return modelMapper.map(supportAskMapper.selectOne(bno), AskDTO.class);
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

        supportAskMapper.update(vo);

    }

    @Override
    public void removeOne(Integer bno) {
        fileMapper.delete(bno);
        supportAskMapper.delete(bno);
    }

    @Override
    public Integer writeOne(AskDTO dto) {
        AskVO vo = modelMapper.map(dto, AskVO.class);

        List<AttachFileVO> files = dto.getUploads().stream()
                .map(b -> modelMapper.map(b, AttachFileVO.class))
                .collect(Collectors.toList());

        supportAskMapper.insert(vo);
        files.forEach(fileMapper::insert);
        files.forEach(fileMapper::insertMapping);

        return vo.getBno();
    }
}
