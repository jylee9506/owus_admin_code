package com.owus.security.mapper;
/*
 * author          :
 * date            : 2022-05-06
 * time            : 오후 7:16
 * description     :
 * ================================================
 */

import com.owus.security.domain.MemberVO;

public interface SecurityMapper {

    MemberVO selectOne(String id);

}
