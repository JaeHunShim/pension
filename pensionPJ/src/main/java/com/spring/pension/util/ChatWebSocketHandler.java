package com.spring.pension.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.spring.pension.domain.ChatRoomVO;
import com.spring.pension.domain.MessageVO;
import com.spring.pension.domain.UserVO;
import com.spring.pension.persistence.ChatDAO;

public class ChatWebSocketHandler extends TextWebSocketHandler{

	private static Logger logger = LoggerFactory.getLogger(ChatWebSocketHandler.class);
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

    @Override

    public void afterConnectionEstablished(WebSocketSession session)

            throws Exception {

        sessionList.add(session);

        logger.info("{} 연결됨", session.getId());

    }

    /**

     * 클라이언트가 웹소켓서버로 메시지를 전송했을 때 실행되는 메소드

     */

    @Override

    protected void handleTextMessage(WebSocketSession session,TextMessage message) throws Exception {


        logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());

        for(WebSocketSession sess : sessionList){

            sess.sendMessage(new TextMessage(session.getId() +" : "+ message.getPayload()));

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
