package com.owus.common.domain;
/*
 * author          :
 * date            : 2022-05-24
 * time            : 오전 10:32
 * description     :
 * ================================================
 */

import lombok.*;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class AttachFileVO {

    private String uuid;
    private Integer bno;
    private Integer mno;
    private String filename;
    private String filepath;
    private boolean img;
    private Integer ord;

    public void setBno(Integer bno){
        this.bno = bno;
    }
    public void setPdno(Integer pdno){ this.bno = pdno; }
    public Integer getPdno() { return this.bno; }

}
