package com.owus.shop.mapper.mypage.info;

import com.owus.common.domain.AttachFileVO;
import com.owus.common.mapper.FileMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface InfoFileMapper extends FileMapper {


    void insertMapping(@Param("mno") Integer mno,@Param("uuid") String uuid);
    List<AttachFileVO> selectFiles(Integer mno);

}
