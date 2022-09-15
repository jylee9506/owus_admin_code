package com.owus.admin.dto.ask;

import com.owus.common.dto.UploadResultDTO;
import lombok.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/*
 * author          :
 * date            : 2022-05-23
 * time            : 오전 11:25
 * description     :
 * ================================================
 */

@Data
public class AskDTO {
    private Integer bno;
    private Integer mno;
    private Integer mtype;
    private Integer replyCount;
    private Long category;

    private String nickname;
    private String title;
    private String content;

    private String mainImg;

    private LocalDateTime regDate;
    private LocalDateTime answerDate;

    public void setWriteCategory(Long writeCategory) {
        this.category = writeCategory;
    }

    private List<UploadResultDTO> uploads = new ArrayList<>();
    private String mainImage;

    public String getMain(){
        if(mainImage == null){
            return null;
        }

        int idx = mainImage.indexOf("s_");
        String first = mainImage.substring(0, idx );
        String second = mainImage.substring(idx+2);

        return first+second;
    }

}
