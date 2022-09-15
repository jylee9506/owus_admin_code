package com.owus.shop.service.mypage.info;

import com.owus.admin.domain.diver.member.TutorVO;
import com.owus.admin.domain.shop.member.ShopMemberVO;
import com.owus.admin.dto.shop.member.ShopMemberDTO;

import com.owus.common.domain.AttachFileVO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.common.dto.UploadResultDTO;
import com.owus.common.exception.NotExistContentException;
import com.owus.shop.domain.mypage.info.FacilityVO;
import com.owus.shop.dto.mypage.info.FacilityDTO;
import com.owus.shop.dto.mypage.info.ListDTO;
import com.owus.shop.dto.mypage.info.TutorDTO;
import com.owus.shop.mapper.mypage.info.InfoFileMapper;
import com.owus.shop.mapper.mypage.info.InfoMapper;
import com.owus.shop.util.AgeUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Log4j2
public class InfoServiceImpl implements InfoService{

    private final InfoMapper infoMapper;
    private final ModelMapper modelMapper;
    private final InfoFileMapper infoFileMapper;

    //shop 정보 조회 GET
    @Override
    public ShopMemberDTO getOne(String id) {
        ShopMemberVO vo = infoMapper.selectOne(id);
        if(vo == null) throw new NotExistContentException();
        return modelMapper.map(vo, ShopMemberDTO.class);
    }

    // shop 정보 수정 POST
    @Override
    public void update(TutorDTO tutorDTO) {
        TutorVO tutorVO = modelMapper.map(tutorDTO, TutorVO.class);
        infoMapper.update(tutorVO);
    }

    //Tutor 추가 POST
    @Override
    public void updateTutorOfShop(TutorDTO tutorDTO) {
        List<Integer> divers = tutorDTO.getDivers();
        divers.removeAll(Collections.singletonList(null));

        for (int i=0; i<divers.size(); i++){
            infoMapper.updateTutorOfShop(divers.get(i));
            log.info(divers.get(i));
        }
    }

    //Tutor 추가 페이지 GET
    @Override
    public ListResponseDTO<TutorDTO> getTutorList(ListDTO listDTO) {
        List<TutorVO> voList = infoMapper.selectTutorList(listDTO);

        List<TutorDTO> dtoList = voList.stream().map(vo -> {
            TutorDTO dto = modelMapper.map(vo , TutorDTO.class);
            dto.setBirthdate(
                    AgeUtil.INSTANCE.getAgeFromYear(dto.getBirthdate().substring(0, 4))
            );
            return dto;
        }).collect(Collectors.toList());

        Integer total = infoMapper.getTotal(listDTO);

        return ListResponseDTO.<TutorDTO>builder().dtoList(dtoList).total(total).build();
    }

    // Tutor 추가 Post
    @Override
    public void updateTutor(TutorDTO tutorDTO) {
        List<Integer> divers = tutorDTO.getDivers();
        Integer smno = tutorDTO.getMno();
        divers.removeAll(Collections.singletonList(null));

        for (int i=0; i<divers.size(); i++){
            infoMapper.updateTutor(smno,divers.get(i));
            log.info(smno);
            log.info(divers.get(i));
            log.info("----------------------------");
        }
    }
    // 소속 강사 페이지 GET
    @Override
    public List<TutorDTO> getTutorListOfShop(Integer smno) {
        List<TutorVO> voList = infoMapper.selectListOfShop(smno);

        List<TutorDTO> dtoList = voList.stream().map(vo -> {
            TutorDTO dto = modelMapper.map(vo , TutorDTO.class);
            dto.setBirthdate(
                    AgeUtil.INSTANCE.getAgeFromYear(dto.getBirthdate().substring(0, 4))
            );
            return dto;
        }).collect(Collectors.toList());

        return dtoList;
    }

    @Override
    public List<FacilityDTO> getFacilityList() {
        List<FacilityVO> voList = infoMapper.selectFacilityList();
        return voList.stream().map(facilityVO -> modelMapper.map(facilityVO,FacilityDTO.class)).collect(Collectors.toList());
    }

    @Override
    public void insertFacility(FacilityDTO facilityDTO) {
        Integer mno = facilityDTO.getMno();

        List<Integer> faciliyList = facilityDTO.getFnoList();
        faciliyList.removeAll(Collections.singletonList(null));

        for (int i=0; i<faciliyList.size(); i++){
            infoMapper.insertFacilityOfShop(mno, faciliyList.get(i));
        }
    }

    @Override
    public void deleteFacility(FacilityDTO facilityDTO) {

        Integer mno = facilityDTO.getMno();

        List<Integer> faciliyList = facilityDTO.getFnoList();
        faciliyList.removeAll(Collections.singletonList(null));

        for(int i = 0; i<faciliyList.size(); i++){
            infoMapper.deleteFacility(mno,faciliyList.get(i));

        }

    }

    //todo : InfoFileService 를 만들어서 관리하기

    @Override
    public void writeOne(FacilityDTO facilityDTO) {
        Integer mno = facilityDTO.getMno();

        infoFileMapper.delete(mno);
        List<UploadResultDTO> dtoList = facilityDTO.getUploads();
        List<AttachFileVO> files = dtoList.stream().map(dto -> modelMapper.map(dto,AttachFileVO.class)).collect(Collectors.toList());

        files.forEach(file -> {
            infoFileMapper.insert(file);
            infoFileMapper.insertMapping(mno,file.getUuid());
        });
    }

    @Override
    public List<UploadResultDTO> getFiles(Integer mno) {
         List<AttachFileVO> files = infoFileMapper.selectFiles(mno);

        return files.stream().map(file -> modelMapper.map(file, UploadResultDTO.class) ).collect(Collectors.toList());
    }


}
