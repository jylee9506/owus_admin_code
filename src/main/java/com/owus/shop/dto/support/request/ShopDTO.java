package com.owus.shop.dto.support.request;


import com.owus.common.dto.UploadResultDTO;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Data
public class ShopDTO {

    private Integer mno;
    private String bzNum;
    private String cfBz;
    private String cfAssoc;
    private String cfMof;
    private String cfSafety;
    private String cfCharging;
    private Long state;
    private LocalDateTime regDate;
    private LocalDateTime updateDate;

    private List<UploadResultDTO> uploads = new ArrayList<>(); //첨부파일
}
