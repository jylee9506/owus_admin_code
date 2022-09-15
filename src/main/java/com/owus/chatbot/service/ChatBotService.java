package com.owus.chatbot.service;

public interface ChatBotService {

    class NotFoundEmailException extends Exception {}

    String verifyEmail(String email) throws NotFoundEmailException;

}
