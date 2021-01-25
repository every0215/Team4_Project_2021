package com.web.store.customerService;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.web.store.company.model.Company;

import java.time.LocalTime;
import java.util.HashMap;
import java.util.Map;

@Component
public class MyWebSocketHandler extends TextWebSocketHandler {
	
	private static final Map<Company, WebSocketSession> companys = new HashMap<Company, WebSocketSession>();  //Map来存储WebSocketSession，key用USER_ID 即在线用户列表
	
	private static final String USER_ID = "WEBSOCKET_USERID";
	
	
	
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message)
            throws Exception {

        String clientMessage = message.getPayload();//取得客戶信息
        System.out.println("Client Message: "+clientMessage);
        Company currentCompany = (Company)session.getAttributes().get(USER_ID);
       
        for(Company company:companys.keySet()) {
        	WebSocketSession userSession = (WebSocketSession)companys.get(company);
        	if(userSession.isOpen()) {
        		userSession.sendMessage(new TextMessage(currentCompany.getCompanyName()+":"+clientMessage));
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
        session.sendMessage(new TextMessage("已進入客服系統.."));
        Company company = (Company)session.getAttributes().get(USER_ID);
        session.sendMessage(new TextMessage("你好 ! "+company.getCompanyName()));
        companys.put(company,session); 
        //这块会实现自己业务，比如，当用户登录后，会把离线消息推送给用户
        //TextMessage returnMessage = new TextMessage("成功建立socket连接，你将收到的离线");
        //session.sendMessage(returnMessage);
    }
    
    public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
        Company comapny= (Company) session.getAttributes().get(USER_ID);
        System.out.println("很高興為您服務 "+comapny.getCompanyName()+"，再見");
        companys.remove(comapny);
        System.out.println("剩余在线用户"+companys.size());
    }


}
