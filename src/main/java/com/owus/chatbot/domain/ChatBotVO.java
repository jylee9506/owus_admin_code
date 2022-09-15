package com.owus.chatbot.domain;

import lombok.*;

@Getter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ChatBotVO {
    private Integer mno;
    private Integer state;
    private String email;
}
// 1 : 대기, 2 : 반려, 3 : 승인