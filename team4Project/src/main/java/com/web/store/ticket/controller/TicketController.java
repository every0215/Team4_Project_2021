package com.web.store.ticket.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.store.ticket.model.Attraction;
import com.web.store.ticket.model.CreditCard;
import com.web.store.ticket.model.Event;
import com.web.store.ticket.model.EventType;
import com.web.store.ticket.model.Exhibition;
import com.web.store.ticket.model.Price;
import com.web.store.ticket.model.Sport;
import com.web.store.ticket.model.SportSeat;
import com.web.store.ticket.model.SportSession;
import com.web.store.ticket.service.BackendService;

@Controller
@SessionAttributes(names = {"member"}) ////存取session屬性
public class TicketController {
	@Autowired
	BackendService backendService;
	
	@Autowired
	ServletContext context;
	
	
	@GetMapping(value="CTicketIndex")
	public String CTestTicketIndex(
			Model model
			) {
		ArrayList<Event> smallexhibtion = new ArrayList<>();
		ArrayList<Event> smallattraction = new ArrayList<>();
		ArrayList<Event> smallsport = new ArrayList<>();
		
		ArrayList<Event> exhibitions = backendService.getEventsBytypeId(1);
		int eSize = exhibitions.size();
		List<Integer> eList = getRandom(eSize);
		for(int i=0;i<eList.size();i++) {
			Integer no = eList.get(i);
			smallexhibtion.add(exhibitions.get(no));
		}
		
		ArrayList<Event> attractions = backendService.getEventsBytypeId(2);
		int aSize = attractions.size();
		List<Integer> aList = getRandom(aSize);
		System.out.println(aList.size());
		for(int i=0;i<aList.size();i++) {
			Integer no = aList.get(i);
			smallattraction.add(attractions.get(no));
		}
		
		ArrayList<Event> sports = backendService.getEventsBytypeId(3);
		int sSize = sports.size();
		List<Integer> sList = getRandom(sSize);
		System.out.println(sList.size());
		for(int i=0;i<sList.size();i++) {
			Integer no = sList.get(i);
			smallsport.add(sports.get(no));
		}
		model.addAttribute("smallexhibtion", smallexhibtion);
		model.addAttribute("smallattraction", smallattraction);
		model.addAttribute("smallsport", smallsport);
		return "/ticket/CTicketIndex";
	}
	
	@GetMapping("/TicketShow/{eventId}")
	@SuppressWarnings("null")
	public String showTicket(@PathVariable int eventId,Model model) {
		
		Event event = backendService.queryOneEvent(eventId);
		
		EventType eventType = backendService.queryEventType(event.getTypeId());
		List<Price> priceList = backendService.selectPriceList(eventId);
		model.addAttribute("event",event);
		model.addAttribute("eventType", eventType);
		model.addAttribute("priceList",priceList);
		int priceSize = priceList.size();
		model.addAttribute("priceSize",priceSize);
		int typeId = event.getTypeId();
		if(typeId==1) {
			Exhibition exhibition = backendService.selectExhibitionByEvent(eventId);
			Integer creditCardId = exhibition.getCardId();
			System.out.println(exhibition.getDiscountRatio());
			CreditCard creditCard = backendService.queryCreditCard(creditCardId);
			model.addAttribute("creditCard",creditCard);
			model.addAttribute("exhibition",exhibition);
			
		}else if(typeId==2) {
			Attraction attraction = backendService.selectAttractionByEvent(eventId);
			model.addAttribute("attraction",attraction);
			
		}else if(typeId==3) {
			Sport sport = backendService.selectSportByEvent(eventId);
			Integer creditCardId = sport.getCardId();
			CreditCard creditCard = backendService.queryCreditCard(creditCardId);
			int sportId = sport.getId();
			 ArrayList<SportSession> sessionList = backendService.selectBySport(sportId);
			 List<Object> sessionSeatList = new ArrayList<>();
			 for(SportSession session: sessionList) {
				Integer sportSessionId = session.getId();
				List<SportSeat> seatList = backendService.selectSportSeatBySession(sportSessionId);
				
				Object[] sessionSeat = {session, seatList};
				sessionSeatList.add(sessionSeat);
			 }
			 model.addAttribute("creditCard",creditCard);
			 model.addAttribute("sport",sport);
			 System.out.println(sport.getDiscountRatio());
			 model.addAttribute("sessionList",sessionList);
			 model.addAttribute("sessionSeatList",sessionSeatList);
			 
		}

		return "/ticket/CTicketShow";
		
	}
	
	public String sortByType(@PathVariable int eventId,Model model) {
		
		
		return null;
		
	
	}
	
	
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
	
	public List<Integer> getRandom(int size) {
		Random r = new Random();
		List<Integer> list = new ArrayList<>();
		
		while(list.size()<3){ //總共10個數字
			int n=r.nextInt(size); //產生0~9數字
			if(list.contains(n)) 
				continue;     //重複的不加入
			else
				list.add(n);
			
			}
		return list;

	}
	
}
