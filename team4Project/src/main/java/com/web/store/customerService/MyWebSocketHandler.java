package com.web.store.customerService;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.AbstractWebSocketHandler;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.json.*;

import com.web.store.company.model.Company;
import com.web.store.customerService.model.MessageBean;

import java.time.LocalTime;
import java.util.HashMap;
import java.util.Map;

@Component
public class MyWebSocketHandler extends AbstractWebSocketHandler  {
	
	private static final Map<String, WebSocketSession> userWebsocketSessionMap;
	
	private static final String USER_ID = "WEBSOCKET_USERID";
	
	static {
		userWebsocketSessionMap  = new HashMap<String, WebSocketSession>();
	}
	

    protected void handleTextMessage(WebSocketSession session, WebSocketMessage<?> message)
            throws Exception {
    	
        String clientMessage = (String) message.getPayload();//取得客戶信息
        String userId = (String)session.getAttributes().get(USER_ID);
       
        for(String userIdInSession:userWebsocketSessionMap.keySet()) {
        	WebSocketSession userSession = (WebSocketSession)userWebsocketSessionMap.get(userIdInSession);
        	if(userSession.isOpen()) {
        		userSession.sendMessage(new TextMessage(userIdInSession+":"+clientMessage));
        	}      	
        }
               
        if (clientMessage.startsWith("幫助") || clientMessage.startsWith("greet")) {
            session.sendMessage(new TextMessage("Hello there!"));
        } else if (clientMessage.startsWith("time")) {
            var currentTime = LocalTime.now();
            session.sendMessage(new TextMessage(currentTime.toString()));
        } 
    }
    
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        System.out.println("成功建立websocket连接!");
        MessageBean message = new MessageBean();
        message.setContent("已進入客服系統，請問有甚麼可以幫助到您?");
        String jsonMessage = new JSONObject(message).toString();
        session.sendMessage(new TextMessage(jsonMessage));
        Company company = (Company)session.getAttributes().get(USER_ID);
        session.sendMessage(new TextMessage("你好 ! "+company.getCompanyName()));
    }
    
    public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
        
    }


}
