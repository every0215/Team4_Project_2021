package com.web.store.customerService.websocket;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import com.web.store.customerService.model.Customer;
import com.web.store.customerService.model.User;



@Component
public class ChatHandshakeInterceptor implements HandshakeInterceptor{

	//握手之前
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		if (request instanceof ServletServerHttpRequest) {
			ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
			HttpSession session = servletRequest.getServletRequest().getSession(false);
			//如果用戶登录，就允许聊天
			if(session.getAttribute("customer")!=null){
				//獲取登陸的用戶
				Customer customer=(Customer)session.getAttribute("customer") ;
				//将用户放入socket处理器的会话(WebSocketSession)中
				attributes.put("customer", customer);
				System.out.println("Websocket:用户[ID:" + (customer.getId() + ",Name:"+customer.getNickName()+"]要建立连接"));
			}else{

				System.out.println("--------------握手已失败...");
				return false;
			}
		}
		System.out.println("--------------握手开始...");
		return true;
	}

	
	//握手之後
	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception exception) {
		System.out.println("--------------握手成功啦...");
	}

}
