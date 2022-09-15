package com.owus.shop.dto.mypage.info;

import com.owus.common.dto.UploadResultDTO;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class FacilityDTO {
    private Integer mno;
    private Integer fno;
    private String name;

    List<Integer> fnoList = new ArrayList<>();
    List<UploadResultDTO> uploads = new ArrayList<>();
}
