package com.owus.admin.mapper.common;
/*
 * author          :
 * date            : 2022-05-02
 * time            : 오후 9:47
 * description     :
 * ================================================
 */

import com.owus.common.domain.ReplyVO;
import com.owus.common.dto.ListDTO;
import com.owus.common.mapper.GenericMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReplyMapper extends GenericMapper<ReplyVO, Integer> {

    List<ReplyVO> selectList(@Param("no") Integer no, @Param("listDTO") ListDTO listDTO);
    List<ReplyVO> selectSubList(@Param("no") Integer no, @Param("parent") Integer parent);
    int getTotal(@Param("no") Integer no, @Param("parent") Integer parent);

}
