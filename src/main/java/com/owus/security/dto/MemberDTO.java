package com.owus.security.dto;
/*
 * author          :
 * date            : 2022-05-17
 * time            : 오전 9:43
 * description     :
 * ================================================
 */


import com.owus.security.domain.MemberVO;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;


@Getter
@Setter
@ToString
//@AllArgsConstructor
//@NoArgsConstructor
public class MemberDTO extends User{
    private Integer mno;
    private String nickname;
    private String id, pw, name, email, phone, address ;
    private Integer mtype, ltype;
    private boolean delFlag;
    private LocalDateTime regDate, updateDate;

    private MemberVO member;

//    public MemberDTO(MemberVO member) {
//        super(member.getId(), member.getPw(),
//                member.getAuthList().stream()
//                .map(auth -> new SimpleGrantedAuthority("ROLE_" + auth.getRoleName()))
//                .collect(Collectors.toList()));
//
//        this.member = member;
//    }


    public MemberDTO(String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);

        this.id = username;
        this.pw = password;
    }

//    public abstract void addUserInfoMore();

}
