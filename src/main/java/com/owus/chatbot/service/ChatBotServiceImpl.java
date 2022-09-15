package com.owus.chatbot.service;


import com.owus.chatbot.domain.ChatBotVO;
import com.owus.chatbot.mapper.ChatBotMapper;
import com.owus.chatbot.util.ResponseRegState;
import com.owus.chatbot.util.RichMsgMaker;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.Map;


@Log4j2
@Service
@RequiredArgsConstructor
public class ChatBotServiceImpl implements ChatBotService {
    private final Map<Integer, ResponseRegState> state = Map.of(
            1, ResponseRegState.ACCEPT,
            2, ResponseRegState.WAIT,
            3, ResponseRegState.ACCEPT,
            4, ResponseRegState.NEEDREG);

    private final ModelMapper modelMapper;
    private final ChatBotMapper chatBotMapper;

    @Override
    public String verifyEmail(String email) throws NotFoundEmailException {

        ChatBotVO chatBotVO = chatBotMapper.selectOne(email);
        log.info("---------------------------------------------");
        log.info(chatBotVO);

        if (chatBotVO == null) {
            throw new NotFoundEmailException();
        }

        return RichMsgMaker.INSTANCE.card(state.get(chatBotVO.getState()));

    }

}
