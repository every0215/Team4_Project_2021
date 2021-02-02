package com.web.store.customerService.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;


@Component("webSocketConfig")
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {


	@Autowired
	private ChatWebSocketHandler webSocketHandler;
	@Autowired
	private ChatHandshakeInterceptor chatHandshakeInterceptor;
	
	//添加處理器、攔截器
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {

		registry.addHandler(webSocketHandler, "/ws").addInterceptors(chatHandshakeInterceptor);
		
		registry.addHandler(webSocketHandler, "/ws/sockjs").addInterceptors(chatHandshakeInterceptor).withSockJS();
	}
	

}
