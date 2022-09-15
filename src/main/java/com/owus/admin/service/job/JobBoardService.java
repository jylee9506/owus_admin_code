package com.owus.admin.service.job;

import com.owus.admin.domain.job.JobBoardVO;
import com.owus.admin.dto.job.JobBoardDTO;
import com.owus.admin.dto.job.JobBoardListResponseDTO;
import com.owus.common.dto.ListDTO;
import com.owus.common.service.BoardService;
import org.springframework.transaction.annotation.Transactional;


@Transactional
public interface JobBoardService extends BoardService<JobBoardDTO> {

    JobBoardListResponseDTO<JobBoardDTO> getNoticeList(ListDTO listDTO);


    Integer insertShop(JobBoardDTO jobBoardDTO);

    //    JobBoardDTO selectOne(Integer bno); // 조회
//
    void modify(JobBoardDTO jobBoardDTO); // 수정
//
//    void noticeModify(JobBoardDTO jobBoardDTO); // 공지사항 수정
//
//    int write(JobBoardDTO jobBoardDTO); // 쓰기
//
//    void writeFile(JobBoardDTO jobBoardDTO); // 업로드하기
//
    void hideContent(JobBoardDTO jobBoardDTO); // 삭제 => 숨김처리
//
//    List<JobUploadResultDTO> getFiles(Integer bno);
}
