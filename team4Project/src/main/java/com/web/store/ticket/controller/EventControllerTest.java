package com.web.store.ticket.controller;

import java.util.ArrayList;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.store.ticket.model.Event;
import com.web.store.ticket.service.BackendService;

@RestController
@SessionAttributes(names = {"company"}) ////存取session屬性
public class EventControllerTest {
	@Autowired
	BackendService backendService;
	
	@Autowired
	ServletContext context;
	
	final static String DATE_FORMAT = "yyyy-MM-dd";
	final static String DATETIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
	
	@GetMapping("/test")
	public String test() {
		return "[{name:'中國信託商業銀行',id:1,cardInfo:[{name:'LINEPAY信用卡',cardId:1},{name:'中油聯名卡',cardId:2},{name:'中信兄弟聯名卡',cardId:3},{name:'酷玩卡',cardId:4}]},{name:'玉山商業銀行',id:2,cardInfo:[{name:'統一時代悠遊聯名卡',cardId:5},{name:'臺北南山廣場聯名卡',cardId:6},{name:'玉山Pi拍錢包信用卡',cardId:7}]},{name:'台北富邦商業銀行',id:3,cardInfo:[{name:'富邦數位生活卡',cardId:8},{name:'momo卡',cardId:9},{name:'富邦悍將悠遊聯名卡',cardId:10},{name:'富邦J卡',cardId:11}]},{name:'國泰世華商業銀行',id:4,cardInfo:[{name:'KOKOCOMBOicash聯名卡',cardId:12},{name:'長榮航空聯名卡',cardId:13},{name:'Costco聯名卡',cardId:14}]},{name:'台新國際商業銀行',id:6,cardInfo:[{name:'@GOGO卡',cardId:15},{name:'FlyGo卡',cardId:16},{name:'玫瑰卡',cardId:17},{name:'街口聯名卡',cardId:18}]}]";
	}

	//刪除票券 應該改為上下架
	@GetMapping("/createEvent")
	public ArrayList<Event> CREATE() {
		// ooxx
		return backendService.queryAll(1);
	}
	@GetMapping("/updateEvent")
	public ArrayList<Event> update() {
		// ooxx
		return backendService.queryAll(1);
	}
	@GetMapping("/deleteEvent")
	public ArrayList<Event> DELETE() {
		// ooxx
		return backendService.queryAll(1);
	}
	@GetMapping("/queryEvent")
	public ArrayList<Event> QUERY() {
		// ooxx
		return backendService.queryAll(1);
	}
	
}
