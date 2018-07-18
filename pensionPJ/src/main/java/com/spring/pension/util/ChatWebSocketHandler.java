package com.spring.pension.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.spring.pension.domain.ChatVO;


public class ChatWebSocketHandler extends TextWebSocketHandler{

	private static Logger logger = LoggerFactory.getLogger(ChatWebSocketHandler.class);
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	sessionList.add(session);
        logger.info("세션에서 받아오는 정보:" + session);
        
        logger.info("{} 연결됨", session.getId());

    }

    /**

     * 클라이언트가 웹소켓서버로 메시지를 전송했을 때 실행되는 메소드

     */

    @Override

    protected void handleTextMessage(WebSocketSession session,TextMessage message) throws Exception {

    	
        logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
    	
        //Json형태로 넘어온 데이터를 Gson을 이용해서 Convert시킴 
        ChatVO chatVO  = ChatVO.convertMessage(message.getPayload());
    	System.out.println("convert한것들" + chatVO);
        
        for(WebSocketSession sess : sessionList){
        	
            sess.sendMessage(new TextMessage(chatVO.getUser_id() +" : "+ chatVO.getContent()));
            
        }

    }

    /**

     * 클라이언트가 연결을 끊었을 때 실행되는 메소드

     */

    @Override

    public void afterConnectionClosed(WebSocketSession session,

            CloseStatus status) throws Exception {

        sessionList.remove(session);

        logger.info("{} 연결 끊김", session.getId());

    }
}
