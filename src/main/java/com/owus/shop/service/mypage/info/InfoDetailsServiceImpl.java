package com.owus.shop.service.mypage.info;

import com.owus.admin.domain.diver.member.TutorVO;

import com.owus.common.dto.UploadResultDTO;
import com.owus.shop.domain.mypage.info.FacilityVO;
import com.owus.shop.dto.mypage.info.FacilityDTO;
import com.owus.shop.dto.mypage.info.TutorDTO;
import com.owus.shop.mapper.mypage.info.InfoDetailsMapper;
import com.owus.shop.util.AgeUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class InfoDetailsServiceImpl implements InfoDetailsService{

    private final InfoDetailsMapper infoDetailsMapper;
    private final ModelMapper modelMapper;

    @Override
    public List<TutorDTO> getList(Integer smno) {
        log.info("===================================================================");
        List<TutorVO> voList = infoDetailsMapper.selectList(smno);
        List<TutorDTO> dtoList = voList.stream().map(vo -> modelMapper.map(vo , TutorDTO.class)).collect(Collectors.toList());

        dtoList.forEach(tutorDTO -> tutorDTO.setBirthdate(
                AgeUtil.INSTANCE.getAgeFromYear(tutorDTO.getBirthdate().substring(0,4))
        ));

        return dtoList;
    }

    @Override
    public List<FacilityDTO> getFacilityListOfShop(Integer mno) {
       List<FacilityVO> voList = infoDetailsMapper.selectListFacility(mno);
       List<FacilityDTO> dtoList = voList.stream().map(facilityVO -> modelMapper.map(facilityVO,FacilityDTO.class)).collect(Collectors.toList());
       return dtoList;
    }
}
