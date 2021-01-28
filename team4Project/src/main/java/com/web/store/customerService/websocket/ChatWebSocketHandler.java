package com.web.store.customerService.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.util.HtmlUtils;

import com.web.store.customerService.model.Customer;
import com.web.store.customerService.model.Message;
import com.web.store.customerService.model.User;
import com.web.store.customerService.utils.GsonUtils;



/**
 * 
 * 说明：WebSocket处理器
 * @author 传智.BoBo老师
 * @version 1.0
 * @date 2016年10月27日
 */
@Component("chatWebSocketHandler")
public class ChatWebSocketHandler implements WebSocketHandler {
	
	//在线用户的SOCKETsession(存储了所有的通信通道)
	public static final Map<String, WebSocketSession> USER_SOCKETSESSION_MAP;
	public static final Map<String, List<String>> USER_CUSTOMER_MAP;
	public static final Long MATCH_TIME_LIMIT = 1000*60L;
	
	//存储所有的在线用户
	static {
		USER_SOCKETSESSION_MAP = new HashMap<String, WebSocketSession>();
		USER_CUSTOMER_MAP = new HashMap<String, List<String>>();
	}
	
	/**
	 * webscoket建立好链接之后的处理函数--连接建立后的准备工作
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession webSocketSession) throws Exception {
		//將用戶websocket放入map key為id value為websocket
		Customer customer=(Customer) webSocketSession.getAttributes().get("customer");
		USER_SOCKETSESSION_MAP.put(customer.getId(), webSocketSession);
		
		System.out.println("------------1--------------");
		Message msg = new Message();//準備消息物件
		
		//如果身分是客服則在USER_CUSTOMER_MAP創一個一對多房間key為客服id、鍵為服務對象id的list
		if(customer.getType().equals("cs")) {
			List<String> userIds = new ArrayList<String>();
			USER_CUSTOMER_MAP.put(customer.getId(), userIds);
			msg.setText("您好，"+customer.getNickName()+"，您已成功登入");
			msg.setDate(new Date());
			webSocketSession.sendMessage(new TextMessage(GsonUtils.toJson(msg)));
		}
		
		System.out.println("------------2--------------");
		//如果身分是會員或訪客則搜尋USER_CUSTOMER_MAP來匹配客服
		if(customer.getType().equals("member")||customer.getType().equals("guest")) {
			String customerId = "";
			
			List<String> userIdList = new ArrayList<String>();
			List<Customer> customerList = new ArrayList<Customer>();			
			Set<Entry<String,List<String>>> entrySet = USER_CUSTOMER_MAP.entrySet();
			
			msg.setText("匹配客服中.....................");
			msg.setDate(new Date());
			webSocketSession.sendMessage(new TextMessage(GsonUtils.toJson(msg)));
						
			Long beforeMatch = System.currentTimeMillis();
			//匹配客服
			boolean isMatch = false;
			while(!isMatch) {

				if( (System.currentTimeMillis() - beforeMatch) > MATCH_TIME_LIMIT) {
					break;
				}
				entrySet = USER_CUSTOMER_MAP.entrySet();
				for(Entry<String,List<String>> entry:entrySet) {
					if(entry.getValue().size()<100) {
						customerId = entry.getKey();
						userIdList = entry.getValue();
						userIdList.add(customer.getId());
						customerList = IdListConvertToCustomer(userIdList);
						Customer cutomer = (Customer)(USER_SOCKETSESSION_MAP.get(customerId).getAttributes().get("customer"));
						msg.setText("已匹配客服，服務您的是: " + cutomer.getNickName());
						List<Customer> Customers =  new ArrayList<Customer>();
						Customers.add(cutomer);
						msg.setUserList(Customers);
						msg.setDate(new Date());
						webSocketSession.sendMessage(new TextMessage(GsonUtils.toJson(msg)));
						isMatch = true;
						break;
					}
				}
				
				
			}
			
			
			if(!isMatch) {
				msg.setText("目前客服均在忙碌中，請稍後");
				msg.setDate(new Date());
				webSocketSession.sendMessage(new TextMessage(GsonUtils.toJson(msg)));
				webSocketSession.close();
				return;
			}
			
			msg.setText("用戶"+customer.getNickName()+"已進入系統");
			msg.setTo(customerId);
			msg.setDate(new Date());
			msg.setUserList(customerList);
			System.out.println(customerList);
			sendMessageToUser(customerId,new TextMessage(GsonUtils.toJson(msg)));
		}
		
		System.out.println("------------3--------------");
		
	}

	@Override
	/**
     * 客户端发送服务器的消息时的处理函数，在这里收到消息之后可以分发消息
     */
	//处理消息：当一个新的WebSocket到达的时候，会被调用（在客户端通过Websocket API发送的消息会经过这里，然后进行相应的处理）
	public void handleMessage(WebSocketSession webSocketSession, WebSocketMessage<?> message) throws Exception {
		//如果消息没有任何内容，则直接返回
		if(message.getPayloadLength()==0)return;
		//反序列化服务端收到的json消息
		Message msg = GsonUtils.fromJson(message.getPayload().toString(), Message.class);
		msg.setDate(new Date());
		//处理html的字符，转义：
		String text = msg.getText();
		//转换为HTML转义字符表示
		String htmlEscapeText = HtmlUtils.htmlEscape(text);
		msg.setText(htmlEscapeText);
		System.out.println("消息（可存数据库作为历史记录）:"+message.getPayload().toString());
		//判断是群发还是单发
		if(msg.getTo()==null||msg.getTo().equals("-1")){
			//群发
			sendMessageToAll(new TextMessage(GsonUtils.toJson(msg)));
		}else{
			//单发
			sendMessageToUser(msg.getTo(), new TextMessage(GsonUtils.toJson(msg)));
		}
	}

	@Override
	/**
     * 消息传输过程中出现的异常处理函数
     * 处理传输错误：处理由底层WebSocket消息传输过程中发生的异常
     */
	public void handleTransportError(WebSocketSession webSocketSession, Throwable exception) throws Exception {
		// 记录日志，准备关闭连接
		System.out.println("Websocket异常断开:" + webSocketSession.getId() + "已经关闭");
		//一旦发生异常，强制用户下线，关闭session
		if (webSocketSession.isOpen()) {
			webSocketSession.close();
		}
		
		//群发消息告知大家
		Message msg = new Message();
		msg.setDate(new Date());
		
		//获取异常的用户的会话中的用户编号
		Customer loginUser=(Customer)webSocketSession.getAttributes().get("loginUser");
		//获取所有的用户的会话
		Set<Entry<String, WebSocketSession>> entrySet = USER_SOCKETSESSION_MAP.entrySet();
		//并查找出在线用户的WebSocketSession（会话），将其移除（不再对其发消息了。。）
		for (Entry<String, WebSocketSession> entry : entrySet) {
			if(entry.getKey().equals(loginUser.getId())){
				msg.setText(loginUser.getNickName()+"已退出聊天");
				//清除在线会话
				USER_SOCKETSESSION_MAP.remove(entry.getKey());
				//记录日志：
				System.out.println("Socket會話已移除 id: " + entry.getKey());
				break;
			}
		}
		
		//并查找出在线用户的WebSocketSession（会话），将其移除（不再对其发消息了。。）
		for (Entry<String, WebSocketSession> entry : entrySet) {
			msg.getUserList().add((Customer)entry.getValue().getAttributes().get("loginUser"));
		}
		
		TextMessage message = new TextMessage(GsonUtils.toJson(msg));
		sendMessageToAll(message);
		
	}

		@Override
		/**
	     * websocket链接关闭的回调
	     * 连接关闭后：一般是回收资源等
	     */
	public void afterConnectionClosed(WebSocketSession webSocketSession, CloseStatus closeStatus) throws Exception {
		// 记录日志，准备关闭连接
		System.out.println("Websocket正常断开:" + webSocketSession.getId() + "已经关闭");

		Customer loginUser=(Customer)webSocketSession.getAttributes().get("customer");
		Set<Entry<String, WebSocketSession>> entrySet = USER_SOCKETSESSION_MAP.entrySet();
		//將用戶從
		for (Entry<String, WebSocketSession> entry : entrySet) {
			if(entry.getKey().equals(loginUser.getId())){
				USER_SOCKETSESSION_MAP.remove(entry.getKey());
				System.out.println("Socket会话已经移除:用户ID" + entry.getKey());
				break;
			}
		}
		
		if(loginUser.getType().equals("guest")||loginUser.getType().equals("member")) {
			String customerId="";
			List<String> userList= null;
			Set<String> keys = USER_CUSTOMER_MAP.keySet();
			for(String key:keys) {
				userList = USER_CUSTOMER_MAP.get(key);
				for(String userId:userList) {
					if(userId.equals(loginUser.getId())) {
						customerId = key; //保存服務該客戶的客服id
						userList.remove(userId);
						System.out.println("已移除list中的id");
						break;
					}
				}
			}
			
			WebSocketSession cssocket = (WebSocketSession)USER_SOCKETSESSION_MAP.get(customerId);
			Message message = new Message(null,null,customerId,loginUser.getNickName()+ " 已退出聊天");
			message.setUserList(IdListConvertToCustomer(userList));
			if(cssocket!=null && cssocket.isOpen()) {
				cssocket.sendMessage(new TextMessage(GsonUtils.toJson(message)));
			}
			
			
			
		}else if(loginUser.getType().equals("cs")) {
			List<String> users = null;
			Set<String> keys = USER_CUSTOMER_MAP.keySet();
			for(String key:keys) {
				if(key.equals(loginUser.getId())) {
					users = USER_CUSTOMER_MAP.get(key);
					USER_CUSTOMER_MAP.remove(key);
					System.out.println("已移除map中的id");
					break;
				}
			}
			
			Message msg = new Message(null,null,null,loginUser.getNickName() + " 客服已退出");
			//將cs服務的user的WebSocketSession斷開，並發送客服斷開信息
			for(String id:users) {
				WebSocketSession userSession = (WebSocketSession) USER_SOCKETSESSION_MAP.get(id);
				sendMessageToUser(id, new TextMessage(GsonUtils.toJson(msg)));
				if(userSession!=null && userSession.isOpen()) {
					userSession.close();
				}				
			}
		}
		
	}

	@Override
	 /**
     * 是否支持处理拆分消息，返回true返回拆分消息
     */
	//是否支持部分消息：如果设置为true，那么一个大的或未知尺寸的消息将会被分割，并会收到多次消息（会通过多次调用方法handleMessage(WebSocketSession, WebSocketMessage). ）
	//如果分为多条消息，那么可以通过一个api：org.springframework.web.socket.WebSocketMessage.isLast() 是否是某条消息的最后一部分。
	//默认一般为false，消息不分割
	public boolean supportsPartialMessages() {
		return false;
	}

	/**
	 * 
	 * 说明：给某个人发信息
	 * @param id
	 * @param message
	 * @author 传智.BoBo老师
	 * @throws IOException 
	 * @time：2016年10月27日 下午10:40:52
	 */
	private void sendMessageToUser(String id, TextMessage message) throws IOException{
		//获取到要接收消息的用户的session
		WebSocketSession webSocketSession = USER_SOCKETSESSION_MAP.get(id);
		if (webSocketSession != null && webSocketSession.isOpen()) {
			//发送消息
			webSocketSession.sendMessage(message);
		}
	}
	
	/**
	 * 
	 * 说明：群发信息：给所有在线用户发送消息
	 * @author 传智.BoBo老师
	 * @time：2016年10月27日 下午10:40:07
	 */
	private void sendMessageToAll(final TextMessage message){
		//对用户发送的消息内容进行转义
		
		//获取到所有在线用户的SocketSession对象
		Set<Entry<String, WebSocketSession>> entrySet = USER_SOCKETSESSION_MAP.entrySet();
		for (Entry<String, WebSocketSession> entry : entrySet) {
			//某用户的WebSocketSession
			final WebSocketSession webSocketSession = entry.getValue();
			//判断连接是否仍然打开的
			if(webSocketSession.isOpen()){
				//开启多线程发送消息（效率高）
				new Thread(new Runnable() {
					public void run() {
						try {
							if (webSocketSession.isOpen()) {
								webSocketSession.sendMessage(message);
							}
						} catch (IOException e) {
							e.printStackTrace();
						}
					}

				}).start();
				
			}
		}
	}
	
	
	public List<Customer> IdListConvertToCustomer(List<String> idList){
		List<Customer> CustomerList = new ArrayList<Customer>();
		for(String id:idList) {
			Customer customer = (Customer)USER_SOCKETSESSION_MAP.get(id).getAttributes().get("customer");
			CustomerList.add(customer);
		}
		
		return CustomerList;
		
	}
	
}
