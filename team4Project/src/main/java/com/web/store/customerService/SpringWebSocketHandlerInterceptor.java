package com.web.store.customerService;

import java.util.Map;

import javax.servlet.http.HttpSession;
 
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.web.store.account.javabean.MemberBean;
import com.web.store.company.model.Company;
 


public class SpringWebSocketHandlerInterceptor extends HttpSessionHandshakeInterceptor {
    @Override
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
                                   Map<String, Object> attributes) throws Exception {
        System.out.println("握手前");
        if (request instanceof ServletServerHttpRequest) {
            ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
            HttpSession session = servletRequest.getServletRequest().getSession(false);
            if (session != null) {
                //使用userName区分WebSocketHandler，以便定向发送消息
            	MemberBean user = (MemberBean) session.getAttribute("currentUser");  //一般直接保存user实体
                if (user!=null) {
                	System.out.println("userId: "+ user.getId());
                    attributes.put("WEBSOCKET_USERID",user);
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

