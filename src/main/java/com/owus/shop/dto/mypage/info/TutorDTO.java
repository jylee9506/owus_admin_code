package com.owus.shop.dto.mypage.info;


import lombok.Data;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Data
public class TutorDTO {

    private Integer mno;
    private String id;
    private String pw;
    private String name;
    private String email;
    private String phone;
    private String address;
    private Integer smno;
    private Integer mtype;
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

    private List<Integer> divers = new ArrayList<>();

    public void setBirthdate(Integer year) {
        this.birthdate = String.valueOf(year);
    }
}
