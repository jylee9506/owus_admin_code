package com.owus.shop.mapper.support.ask;
/*
 * author          :
 * date            : 2022-06-07
 * time            : 오전 12:25
 * description     :
 * ================================================
 */

import com.owus.admin.domain.ask.AskVO;
import com.owus.common.dto.ListDTO;
import com.owus.common.mapper.GenericMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SupportAskMapper {
    List<AskVO> selectList(@Param("listDTO") ListDTO listDTO, @Param("mno") Integer mno);
    int getTotal(@Param("listDTO") ListDTO listDTO, @Param("mno") Integer mno);
    AskVO selectOne(Integer bno);
    void insert(AskVO vo);
    void delete(Integer bno);

    void update(AskVO vo);

}
