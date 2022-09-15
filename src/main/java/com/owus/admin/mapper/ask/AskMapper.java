package com.owus.admin.mapper.ask;
/*
 * author          :
 * date            : 2022-05-23
 * time            : 오전 11:59
 * description     :
 * ================================================
 */

import com.owus.admin.domain.ask.AskVO;
import com.owus.common.mapper.GenericMapper;
import org.apache.ibatis.annotations.Param;

public interface AskMapper extends GenericMapper<AskVO, Integer> {
    void updateReplyCount(@Param("bno") Integer bno, @Param("amount") int amount);
    void answerUpdate(Integer bno);

//    List<AskVO> selectList(@Param("listDTO") ListDTO listDTO, @Param("mtype") Integer mtype);
}
