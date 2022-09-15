package com.owus.admin.service.diver.member;


import com.owus.admin.domain.diver.member.TutorVO;
import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.admin.dto.diver.member.TutorDTO;
import com.owus.admin.mapper.diver.member.TutorMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class TutorServiceImpl implements TutorService {

    private final TutorMapper tutorMapper;
    private final ModelMapper modelMapper;

    @Override
    public ListResponseDTO<TutorDTO> selectList(ListDTO listDTO) {

        List<TutorVO> voList = tutorMapper.selectList(listDTO);

        List<TutorDTO> dtoList = voList.stream()
                .map(tutorVO -> modelMapper.map(tutorVO, TutorDTO.class))
                .collect(Collectors.toList());

        ListResponseDTO<TutorDTO> responseDTOList = ListResponseDTO.<TutorDTO>builder()
                .dtoList(dtoList)
                .total(tutorMapper.getTotal(listDTO))
                .build();

        return responseDTOList;


    }

    @Override
    public TutorDTO selectOne(Integer bno) {
        TutorVO tutorVO = tutorMapper.selectOne(bno);
        TutorDTO tutorDTO = modelMapper.map(tutorVO, TutorDTO.class);
        return tutorDTO;
    }

    @Override
    public void approve(TutorDTO tutorDTO) {

        TutorVO tutorVO = modelMapper.map(tutorDTO, TutorVO.class);

        tutorMapper.approve(tutorVO);


    }

    @Override
    public TutorDTO getOne(Integer mno) {
        TutorVO tutorVO = tutorMapper.getOne(mno);
        TutorDTO tutorDTO = modelMapper.map(tutorVO, TutorDTO.class);
        return tutorDTO;
    }
}
