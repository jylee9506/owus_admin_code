package com.owus.shop.service.mypage.info;

import com.owus.admin.dto.shop.member.ShopMemberDTO;

import com.owus.common.dto.ListResponseDTO;
import com.owus.common.dto.UploadResultDTO;
import com.owus.common.service.BoardService;
import com.owus.shop.domain.mypage.info.FacilityVO;
import com.owus.shop.dto.mypage.info.FacilityDTO;
import com.owus.shop.dto.mypage.info.ListDTO;
import com.owus.shop.dto.mypage.info.TutorDTO;

import java.util.List;

public interface InfoService  {

    ShopMemberDTO getOne (String id);
    void update(TutorDTO tutorDTO);
    void updateTutorOfShop(TutorDTO tutorDTO);
    ListResponseDTO<TutorDTO> getTutorList(ListDTO listDTO);
    void updateTutor(TutorDTO tutorDTO);
    List<TutorDTO> getTutorListOfShop (Integer smno);
    List<FacilityDTO> getFacilityList();
    void insertFacility(FacilityDTO facilityDTO);
    void deleteFacility(FacilityDTO facilityDTO);

    void writeOne(FacilityDTO facilityDTO);
    // 나중에 InfoFileService 만들어서 넣기
    List<UploadResultDTO> getFiles(Integer mno);

}
