package com.owus.security.service;
/*
 * author          :
 * date            : 2022-05-16
 * time            : 오후 12:32
 * description     :
 * ================================================
 */

import com.owus.security.domain.MemberVO;
import com.owus.security.dto.MemberDTO;
import com.owus.security.mapper.SecurityMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {
    private final SecurityMapper mapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, InternalAuthenticationServiceException {
        log.info("==============================");
        log.info("==============================");
        log.info("login user: " + username);

        MemberVO memberVO = mapper.selectOne(username);
        if(memberVO == null) throw new UsernameNotFoundException("not exist user");

        log.info("vo: " + memberVO);

        List<SimpleGrantedAuthority> authList = memberVO.getAuthList()
                .stream().map(auth -> new SimpleGrantedAuthority("ROLE_" + auth.getRoleName()))
                .collect(Collectors.toList());

        MemberDTO memberDTO = new MemberDTO(memberVO.getId(), memberVO.getPw(), authList);

        memberDTO.setMno(memberVO.getMno());
        memberDTO.setName(memberVO.getName());
        memberDTO.setNickname(memberVO.getName());
        memberDTO.setEmail(memberVO.getEmail());
        memberDTO.setPhone(memberVO.getPhone());
        memberDTO.setAddress(memberVO.getAddress());
        memberDTO.setMtype(memberVO.getMtype());
        memberDTO.setLtype(memberVO.getLtype());
        memberDTO.setRegDate(memberVO.getRegDate());
        memberDTO.setUpdateDate(memberVO.getUpdateDate());

        log.info(memberDTO);
        log.info("==============================");
        log.info("==============================");

        return memberDTO;
    }
}
