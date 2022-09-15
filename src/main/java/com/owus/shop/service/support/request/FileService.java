package com.owus.shop.service.support.request;

import com.owus.common.dto.UploadResultDTO;

public interface FileService {

    void register (UploadResultDTO uploadResultDTO);

    //DB 첨부파일 삭제
    void remove(String uuid);
}
