package com.owus.admin.service.shop.notice;

import com.owus.common.domain.AttachFileVO;
import com.owus.admin.domain.shop.notice.NoticeVO;
import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.common.dto.UploadResultDTO;
import com.owus.admin.dto.shop.notice.NoticeDTO;
import com.owus.admin.mapper.shop.notice.NoticeFileMapper;
import com.owus.admin.mapper.shop.notice.NoticeMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

    private final NoticeMapper noticeMapper;
    private final ModelMapper modelMapper;
    private final NoticeFileMapper noticeFileMapper;

    @Override
    public ListResponseDTO<NoticeDTO> getListResp(ListDTO listDTO) {
        List<NoticeVO> voList = noticeMapper.selectList(listDTO);
        List<NoticeDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo,NoticeDTO.class))
                .collect(Collectors.toList());

        return ListResponseDTO.<NoticeDTO>builder()
                .dtoList(dtoList)
                .total(noticeMapper.getTotal(listDTO))
                .build();
    }

    @Override
    public NoticeDTO getOne(Integer bno) {
        NoticeVO noticeVO = noticeMapper.selectOne(bno);
        NoticeDTO noticeDTO = modelMapper.map(noticeVO, NoticeDTO.class);

        List<AttachFileVO> attachFiles = noticeFileMapper.selectFiles(bno);

        List<UploadResultDTO> dtoList = attachFiles.stream()
                .map(attachFile -> modelMapper.map(attachFile, UploadResultDTO.class))
                .collect(Collectors.toList());

        noticeDTO.setUploads(dtoList);

        return noticeDTO;
    }

    @Override
    public Integer writeOne(NoticeDTO noticeDTO) {
        NoticeVO noticeVO = modelMapper.map(noticeDTO,NoticeVO.class);
        List<AttachFileVO> files = noticeDTO.getUploads().stream().
                                map(dto -> modelMapper.map(dto,AttachFileVO.class)).collect(Collectors.toList());

        noticeMapper.insert(noticeVO);

        log.info("register Tes===============================================df==========================-=======================");
//        files.forEach(noticeMapper::insertAttach);
        files.forEach(f-> {
            noticeFileMapper.insert(f);
            noticeFileMapper.insertMapping(f);
        });

//       for(int i =0; files.size() > i; i++){
//            noticeMapper.insertNoticeFile(files.get(i).getUuid());
//       }

       return noticeVO.getBno();

    }
    @Override
    public void updateOne(NoticeDTO noticeDTO) {
        NoticeVO noticeVO = modelMapper.map(noticeDTO, NoticeVO.class);
        noticeFileMapper.delete(noticeDTO.getBno());

//        noticeMapper.delete(noticeDTO.getBno());

        noticeDTO.getUploads().stream()
                .map(up -> {
                    up.setBno(noticeVO.getBno());
                    return modelMapper.map(up, AttachFileVO.class);
                })
                .forEach(af -> {
                    log.info(af);
                    noticeFileMapper.insert(af);
                    noticeFileMapper.insertMapping(af);
                });


//        List<AttachFileVO> files = noticeDTO.getUploads().stream().
//                map(dto -> modelMapper.map(dto,AttachFileVO.class))
//                .collect(Collectors.toList());
//
//        files.forEach(noticeMapper::insertAttach);

//        for(int i =0; files.size() > i; i++){
//            NoticeFile noticeFile = NoticeFile.builder().uuid(files.get(i).getUuid())
//                    .bno(noticeDTO.getBno()).build();
//            noticeMapper.insertNoticeFileBoard(noticeFile);
//        }
        noticeMapper.update(noticeVO);

    }

    @Override
    public void removeOne(Integer bno) {
        noticeFileMapper.delete(bno);
        noticeMapper.delete(bno);
    }
}
