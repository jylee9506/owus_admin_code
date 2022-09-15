package com.owus.shop.service.support.request;

import com.owus.common.domain.AttachFileVO;
import com.owus.common.dto.UploadResultDTO;
import com.owus.common.mapper.FileMapper;
import com.owus.shop.mapper.support.request.RegisterFileMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Log4j2
public class FileServiceImpl implements FileService{

    private final RegisterFileMapper fileMapper;
    private final ModelMapper modelMapper;


    @Override
    public void register(UploadResultDTO uploadResultDTO) {

        //UploadResultDTO => AttachFile 로 변환시켜줘야함.
        AttachFileVO attachFileVO = modelMapper.map(uploadResultDTO,AttachFileVO.class);

        fileMapper.insert(attachFileVO);

    }

    @Override
    public void remove(String uuid) {
        fileMapper.delete(uuid);
    }
}
