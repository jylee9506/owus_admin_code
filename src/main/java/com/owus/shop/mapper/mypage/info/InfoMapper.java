package com.owus.shop.mapper.mypage.info;

import com.owus.admin.domain.diver.member.TutorVO;
import com.owus.admin.domain.shop.member.ShopMemberVO;

import com.owus.common.mapper.GenericMapper;
import com.owus.shop.domain.mypage.info.FacilityVO;
import com.owus.shop.dto.mypage.info.ListDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface InfoMapper extends GenericMapper<TutorVO,Integer>  {

    ShopMemberVO selectOne(String id);
    List<TutorVO> selectTutorList(ListDTO listDTO);
    int getTotal(ListDTO listDTO);
    void updateTutor(@Param("smno")Integer smno, @Param("mno") Integer mno);
    List<TutorVO> selectListOfShop(Integer smno);
    void updateTutorOfShop (Integer mno);
    List<FacilityVO> selectFacilityList();
    void insertFacilityOfShop(@Param("mno") Integer mno, @Param("fno") Integer fno);
    void deleteFacility(@Param("mno") Integer mno, @Param("fno") Integer fno);
}
