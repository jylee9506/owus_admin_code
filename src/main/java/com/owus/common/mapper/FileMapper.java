package com.owus.common.mapper;
/*
 * author          :
 * date            : 2022-05-24
 * time            : 오전 10:39
 * description     :
 * ================================================
 */

import com.owus.common.domain.AttachFileVO;

import java.util.List;

public interface FileMapper {

    void insert(AttachFileVO attachFile);

//    void insertBoard(AttachFileVO attachFile);

    void insertMapping(AttachFileVO attachFile);

    void delete(Integer no);
//    void deleteMapping(Integer bno);

//    List<String> selectMapping(Integer bno);

    List<AttachFileVO> selectFiles(Integer no);
}
