package com.owus.admin.mapper.diver.member;

import com.owus.admin.domain.diver.member.TutorVO;
import com.owus.common.mapper.GenericMapper;

public interface TutorMapper extends GenericMapper<TutorVO,Integer> {

    void approve(TutorVO tutorVO);

    TutorVO getOne(Integer mno);







}
