package com.owus.chatbot.util;
/*
 * author          :
 * date            : 2022-06-19
 * time            : 오후 4:15
 * description     :
 * ================================================
 */

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum ResponseRegState {
    WAIT("대기", "https://i.imgur.com/vZEg6Bb.jpg", "관리자가 검토중인 단계입니다. 완료가 되면 메일로 알려드릴게요!"),
    DEFER("반려", "https://i.imgur.com/bC99ocp.jpg", "서류상의 문제가 있습니다. 자세한 내용은 아래 링크를 누르세요"),
    ACCEPT("승인", "https://i.imgur.com/GFd7Gke.jpg", "축하합니다. 최종 승인된 단계로 자유롭게 서비스를 이용 할 수 있습니다"),
    NEEDREG("미등록", "https://i.imgur.com/lXbLpld.jpg", "아직 업체 등록 신청을 하지 않았습니다. 아래 링크에서 등록해주세요");

    private String title;
    private String imgSrc;
    private String desc;

    ResponseRegState(String title, String imgSrc, String desc) {
        this.title = title;
        this.imgSrc = imgSrc;
        this.desc = desc;
    }



}
