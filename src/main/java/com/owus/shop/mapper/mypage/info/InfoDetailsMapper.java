package com.owus.shop.mapper.mypage.info;

import com.owus.admin.domain.diver.member.TutorVO;
import com.owus.common.dto.ListDTO;
import com.owus.common.mapper.GenericMapper;
import com.owus.shop.domain.mypage.info.FacilityVO;

import java.util.List;

public interface InfoDetailsMapper extends GenericMapper<TutorVO,Integer> {
    List<TutorVO> selectList(Integer smno);
    List<FacilityVO> selectListFacility(Integer mno);

}
