package com.owus.chatbot.util;
/*
 * author          :
 * date            : 2022-06-17
 * time            : 오후 4:23
 * description     :
 * ================================================
 */

public enum RichMsgMaker {
    INSTANCE;
    RichMsgMaker() {}

    public String text(String text) {
        return "{\"fulfillment_response\": {\"messages\": [{\"text\": {\"text\": [\""+text+"\"]}}]}}";
    }

    public String card(ResponseRegState regState) {
        return "{\"fulfillment_response\": {\"messages\": [{\"payload\": {\"platform\": \"kommunicate\",\"metadata\": {\"contentType\": \"300\",\"templateId\": \"10\",\"payload\": [{\"title\": \""+regState.getTitle()+"\",\"subtitle\": \"현재 상태는 "+regState.getTitle()+"상태입니다\",\"header\": {\"imgSrc\": \""+regState.getImgSrc()+"\"},\"description\": \""+regState.getDesc()+"\",\"buttons\": [{\"name\": \"자세히 보기\",\"action\": {\"type\": \"link\",\"payload\": {\"url\": \"https://www.facebook.com\"}}}]}]}}}]}}";
    }
}
