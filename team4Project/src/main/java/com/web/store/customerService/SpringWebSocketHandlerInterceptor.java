package com.web.store.customerService;

import java.util.Map;

import javax.servlet.http.HttpSession;
 
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.web.store.company.model.Company;
 
/**
 * Created by zhangwenchao on 2017/11/20.
 * WebSocket拦截器----握手之前将登陆用户信息从session设置到WebSocketSession
 *
 */
public class SpringWebSocketHandlerInterceptor extends HttpSessionHandshakeInterceptor {
    @Override
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
                                   Map<String, Object> attributes) throws Exception {
        System.out.println("Before Handshake");
        if (request instanceof ServletServerHttpRequest) {
            ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
            HttpSession session = servletRequest.getServletRequest().getSession(false);
            if (session != null) {
                //使用userName区分WebSocketHandler，以便定向发送消息
            	Company company = (Company) session.getAttribute("company");  //一般直接保存user实体
                if (company!=null) {
                	System.out.println("company.getId():"+company.getId());
                    attributes.put("WEBSOCKET_USERID",company);
                }
 
            }
        }
        return super.beforeHandshake(request, response, wsHandler, attributes);
 
    }
 
    @Override
    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
                               Exception ex) {
        super.afterHandshake(request, response, wsHandler, ex);
    }
}

