package com.owus.admin.dto.diver.member;


import lombok.Data;

@Data
public class TutorMemberDTO {
    private String name;
    private String phone;
    private String nickname;
    private String birthdate;
    private int gender;
    private String certassoc; //자격증 발급 기간
    private String certnum;  //강사자격증 번호

}
