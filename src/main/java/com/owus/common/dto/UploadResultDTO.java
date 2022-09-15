package com.owus.common.dto;
/*
 * author          :
 * date            : 2022-05-24
 * time            : 오전 10:10
 * description     :
 * ================================================
 */

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor

public class UploadResultDTO {

    private String uuid;
    private Integer mno;
    private Integer bno;
    private String filename;
    private String filepath;
    private boolean img;

    @Builder.Default
    private Integer ord = 0;

    public String getLink(){
        return filepath+"/"+uuid+"_"+filename;
    }
    public String getThumbnail(){
        return filepath+"/s_"+uuid+"_"+filename;
    }
}
