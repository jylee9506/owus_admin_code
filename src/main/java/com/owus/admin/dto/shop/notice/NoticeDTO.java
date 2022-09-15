package com.owus.admin.dto.shop.notice;

import com.owus.common.dto.UploadResultDTO;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Data
public class NoticeDTO {
    private Integer bno;
    private Integer mno;
    private String name;
    private String title;
    private String content;
    private int delflag;
    private String mainImage;

    private LocalDateTime regDate;
    private LocalDateTime updateDate;

    private List<UploadResultDTO> uploads = new ArrayList<>();
}
