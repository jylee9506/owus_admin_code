package com.owus.admin.dto.diver.member;


import lombok.Data;

import java.time.LocalDateTime;

@Data
public class TutorDTO {

    private int mno;
    private String id;
    private String pw;
    private String name;
    private String email;
    private String phone;
    private String address;
    private Integer smno;
    private int mtype;
    private int ltype;
    private boolean delflag;
    private String nickname;
    private String birthdate;
    private int gender;
    private int tutorflag;
    private String certassoc;
    private String certnum;
    private Integer state;
    private LocalDateTime requestdate;
    private LocalDateTime approvedate;
    private LocalDateTime regdate;
    private LocalDateTime updatedate;


}
