package com.web.store.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.web.store.customerService.MyWebSocketHandler;
import com.web.store.customerService.SpringWebSocketHandlerInterceptor;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {
	
	@Autowired
    private MyWebSocketHandler myWebSocketHandler;
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {		
		registry.addHandler(myWebSocketHandler, "/socketHandler")
				.addInterceptors(new SpringWebSocketHandlerInterceptor());
	}

}
