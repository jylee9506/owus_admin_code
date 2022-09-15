package com.owus.chatbot.dto;

import lombok.Data;

@Data
public class ChatBotDTO {

    private Integer mno;
    private Integer state;
    private String email;
}
// 1 : 대기, 2 : 반려, 3 : 승인