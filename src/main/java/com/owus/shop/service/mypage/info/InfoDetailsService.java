package com.owus.shop.service.mypage.info;



import com.owus.common.dto.ListDTO;
import com.owus.common.dto.UploadResultDTO;
import com.owus.shop.dto.mypage.info.FacilityDTO;
import com.owus.shop.dto.mypage.info.TutorDTO;

import java.util.List;

public interface InfoDetailsService {

    List<TutorDTO> getList(Integer smno);
    List<FacilityDTO> getFacilityListOfShop(Integer mno);
    
    

}
