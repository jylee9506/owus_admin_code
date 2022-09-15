package com.owus.admin.service.job;


import com.owus.admin.domain.job.JobBoardVO;
import com.owus.admin.dto.job.JobBoardDTO;
import com.owus.admin.dto.job.JobBoardListResponseDTO;
import com.owus.admin.mapper.job.JobBoardMapper;
import com.owus.admin.mapper.job.JobFileMapper;
import com.owus.common.domain.AttachFileVO;
import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.common.dto.UploadResultDTO;
import com.owus.common.exception.NotExistContentException;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


@Log4j2
@Service
@RequiredArgsConstructor
public class JobBoardServiceImpl implements JobBoardService {

    private final JobBoardMapper jobBoardMapper;
    private final ModelMapper modelMapper;
    private final JobFileMapper jobFileMapper;

    @Override
    public ListResponseDTO<JobBoardDTO> getListResp(ListDTO listDTO) {

        List<JobBoardVO> voList = jobBoardMapper.selectList(listDTO);
        List<JobBoardDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo,JobBoardDTO.class))
                .collect(Collectors.toList());

        return ListResponseDTO.<JobBoardDTO>builder()
                .dtoList(dtoList)
                .total(jobBoardMapper.getTotal(listDTO))
                .build();
    }

    @Override
    public JobBoardDTO getOne(Integer bno) throws NotExistContentException {
        JobBoardVO jobBoardVO = jobBoardMapper.selectOne(bno);

        JobBoardDTO jobBoardDTO = modelMapper.map(jobBoardVO, JobBoardDTO.class);

        List<AttachFileVO> attachFiles = jobFileMapper.selectFiles(bno);

        List<UploadResultDTO> dtoList = attachFiles.stream()
                .map(attachFile -> modelMapper.map(attachFile, UploadResultDTO.class))
                .collect(Collectors.toList());

        jobBoardDTO.setUploads(dtoList);

        return jobBoardDTO;
    }

    @Override
    public void updateOne(JobBoardDTO dto) {

    }

    @Override
    public void removeOne(Integer bno) {

        jobFileMapper.delete(bno);
        jobBoardMapper.delete(bno);

    }

    @Override
    public Integer writeOne(JobBoardDTO jobBoardDTO) {

        log.info("===================");
        log.info("===================");
        log.info("===================");
        log.info("===================");
        log.info("===================");
        log.info("===================");
        log.info("===================");
        log.info("===================");
        log.info("===================");

        JobBoardVO jobBoardVO = modelMapper.map(jobBoardDTO,JobBoardVO.class);

        List<AttachFileVO> files = jobBoardDTO.getUploads().stream()
                .map(dto -> modelMapper.map(dto,AttachFileVO.class))
                .collect(Collectors.toList());

        log.info(files);

        jobBoardMapper.insert(jobBoardVO);

        files.forEach(file-> {
            jobFileMapper.insert(file);
            jobFileMapper.insertMapping(file);
        });

        return jobBoardVO.getBno();
    }


//    @Override
//    public JobBoardListResponseDTO<JobBoardDTO> getList(JobBoardListDTO jobBoardListDTO) {
//
//        List<JobBoardVO> list = jobBoardMapper.selectList(jobBoardListDTO);
//
//        List<JobBoardDTO> dtoList = list.stream()
//                .map(jobBoardVO -> modelMapper.map(jobBoardVO, JobBoardDTO.class))
//                .collect(Collectors.toList());
//
//        int total = jobBoardMapper.getTotal(jobBoardListDTO);
//
//        return JobBoardListResponseDTO.<JobBoardDTO>builder().dtoList(dtoList).total(total).build();
//    }
//
    @Override
    public JobBoardListResponseDTO<JobBoardDTO> getNoticeList(ListDTO listDTO) {

        List<JobBoardVO> list = jobBoardMapper.noticeList(listDTO);

        List<JobBoardDTO> noticedtoList = list.stream()
                .map(jobBoardVO -> modelMapper.map(jobBoardVO, JobBoardDTO.class))
                .collect(Collectors.toList());


        return JobBoardListResponseDTO.<JobBoardDTO>builder().noticedtoList(noticedtoList).build();
    }

    @Override
    public Integer insertShop(JobBoardDTO jobBoardDTO) {
        JobBoardVO jobBoardVO = modelMapper.map(jobBoardDTO,JobBoardVO.class);

        jobBoardMapper.insertShop(jobBoardVO);

        return jobBoardVO.getBno();
    }

    //
//
//    @Override
//    public int write(JobBoardDTO jobBoardDTO) {
//        JobBoardVO jobBoardVO = JobBoardVO.builder()
//                .title(jobBoardDTO.getTitle())
//                .content(jobBoardDTO.getContent())
//                .build();
//
//
//        jobBoardMapper.insert(jobBoardVO);
//
//
//        return jobBoardVO.getBno();
//
//    }
//
//    @Override
//    public void writeFile(JobBoardDTO jobBoardDTO) {
//        JobBoardVO jobBoardVO = modelMapper.map(jobBoardDTO, JobBoardVO.class);
//
//        List<JobAttachFile> files = jobBoardDTO
//                .getUploads()
//                .stream()
//                .map(jobUploadResultDTO -> modelMapper.map(jobUploadResultDTO, JobAttachFile.class))
//                .collect(Collectors.toList());
//
//        jobBoardMapper.insert(jobBoardVO);
//
//        log.info(files);
//        log.info(jobBoardVO);
//
//        files.forEach(file -> jobFileMapper.insert(file));
//        files.forEach(file -> jobFileMapper.jobFileInsert(JobAttachFile.builder().uuid(file.getUuid()).bno(file.getBno()).build()));
//
//    }
//
    @Override
    public void hideContent(JobBoardDTO jobBoardDTO) {

        JobBoardVO jobBoardVO = JobBoardVO.builder()
                .bno(jobBoardDTO.getBno())
                .title("숨김처리된 게시물 입니다")
                .content("숨김처리된 게시물 입니다")
                .build();

        jobBoardMapper.hideContent(jobBoardVO);

    }
//
//    @Override
//    public List<JobUploadResultDTO> getFiles(Integer bno) {
//        List<JobAttachFile> attachFiles = jobBoardMapper.selectFiles(bno);
//
//        return attachFiles.stream()
//                .map(attachFile -> modelMapper.map(attachFile, JobUploadResultDTO.class))
//                .collect(Collectors.toList());
//    }
//
//
//
//    @Override
//    public JobBoardDTO selectOne(Integer bno) {
//        JobBoardVO jobBoardVO = jobBoardMapper.selectOne(bno);
//
//        JobBoardDTO jobBoardDTO = modelMapper.map(jobBoardVO, JobBoardDTO.class);
//
//        List<JobAttachFile> jobAttachFiles = jobFileMapper.selectFiles(bno);
//
//        List<JobUploadResultDTO> dtoList = jobAttachFiles.stream()
//                .map(attachFile -> modelMapper.map(attachFile, JobUploadResultDTO.class))
//                .collect(Collectors.toList());
//
//        jobBoardDTO.setUploads(dtoList);
//
//        return jobBoardDTO;
//    }
//
    @Override
    public void modify(JobBoardDTO jobBoardDTO) {

        jobBoardMapper.modify(modelMapper.map(jobBoardDTO, JobBoardVO.class));

    }
//
//    @Override
//    public void noticeModify(JobBoardDTO jobBoardDTO) {
//
//        jobBoardMapper.noticeModify(modelMapper.map(jobBoardDTO, JobBoardVO.class));
//    }
//
//    @Override
//    public void updateOne(Object joBoardDTO) {
//
//    }
//
//
//    @Override
//    public void removeOne(Integer bno) {
//
//    }
//
//    @Override
//    public int writeOne(Object jobBoard) {
//return 0;
//    }

}
