package com.owus.admin.dto.job;

import com.owus.common.dto.UploadResultDTO;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Data
public class JobBoardDTO {

    // 구인 구직 번호
    private Integer bno;
    // 회원 번호
    private Integer mno;
    // 제목
    private String title;
    // 내용
    private String content;
    // 구인 구직 카테고리
    private Long category;
    // 등록일
    private LocalDateTime regDate;
    // 수정일
    private LocalDateTime updateDate;
    // 닉네임(join)
    private String nickname;
    //삭제여부
    private Integer delflag;

    private String mainImage;

    private List<UploadResultDTO> uploads = new ArrayList<>();

}
