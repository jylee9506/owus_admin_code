package com.owus.admin.mapper.job;

import com.owus.admin.domain.job.JobBoardVO;
import com.owus.common.dto.ListDTO;
import com.owus.common.mapper.GenericMapper;

import java.util.List;

public interface JobBoardMapper extends GenericMapper<JobBoardVO, Integer> {


    void insertShop(JobBoardVO jobBoardVO);

    void modify(JobBoardVO jobBoardVO);
//
//    void noticeModify(JobBoardVO jobBoardVO);
//
    void hideContent(JobBoardVO jobBoardVO);

    List<JobBoardVO> noticeList(ListDTO listDTO);

//    List<JobAttachFile> selectFiles(Integer bno);

}
