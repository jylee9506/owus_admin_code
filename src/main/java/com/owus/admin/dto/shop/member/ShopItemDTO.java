package com.owus.admin.dto.shop.member;
/*
 * author          :
 * date            : 2022-05-30
 * time            : 오후 5:02
 * description     :
 * ================================================
 */

import com.fasterxml.jackson.annotation.JsonFormat;
import com.owus.common.dto.UploadResultDTO;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Data
public class ShopItemDTO {
    private Integer pdno;
    private Integer mno;
    private String pdName;
    private String content;
    private Integer pdLimit;

    private Long price;
    private Long dprice;

    private String mainImg;

    private Integer dpno;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
    private LocalDateTime regDate;
    private LocalDateTime  updateDate;

    private List<UploadResultDTO> uploads = new ArrayList<>();

}
