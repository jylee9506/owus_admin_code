package com.owus.admin.domain.job;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class JobBoardVO {

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

     private String mainImage;

     private String nickname;
     //삭제여부
     private Integer delflag;
}
