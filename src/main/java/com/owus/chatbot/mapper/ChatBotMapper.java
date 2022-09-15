package com.owus.chatbot.mapper;


import com.owus.chatbot.domain.ChatBotVO;

public interface ChatBotMapper {

    ChatBotVO selectOne(String email);
}
