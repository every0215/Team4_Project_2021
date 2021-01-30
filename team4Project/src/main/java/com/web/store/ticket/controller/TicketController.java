package com.web.store.ticket.controller;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.web.store.account.javabean.MemberBean;
import com.web.store.account.service.AccountService;
import com.web.store.company.model.Company;
import com.web.store.ticket.model.Attraction;
import com.web.store.ticket.model.CreditCard;
import com.web.store.ticket.model.Event;
import com.web.store.ticket.model.EventType;
import com.web.store.ticket.model.Exhibition;
import com.web.store.ticket.model.Price;
import com.web.store.ticket.model.Sport;
import com.web.store.ticket.model.SportSeat;
import com.web.store.ticket.model.SportSession;
import com.web.store.ticket.model.TicketOnWay;
import com.web.store.ticket.model.TicketOrder;
import com.web.store.ticket.model.TicketOrderDetail;
import com.web.store.ticket.service.BackendService;
@Controller
//@SessionAttributes(names = {"member"}) ////存取session屬性
public class TicketController {
	@Autowired
	BackendService backendService;
	
	@Autowired
	ServletContext context;
	
	@Autowired
	AccountService accountService;
	
	@GetMapping(value="/TicketSearch" )
	public String eventSearch(@RequestParam String search,Model model){
		System.out.println(search);
		List<Event> events  = backendService.selectbyName(search);
		for(Event event:events) {
			Integer typeId = event.getTypeId();
			if(typeId==1) {
				Exhibition exhibition = backendService.selectExhibitionByEvent(event.getId());
				event.setExhibition(exhibition);
			}else if(typeId==2) {
				Attraction attraction = backendService.selectAttractionByEvent(event.getId());
				event.setAttraction(attraction);
				
			}else {
				Sport sport = backendService.selectSportByEvent(event.getId());
				event.setSport(sport);
			}
		}
		model.addAttribute("events",events);
		System.out.println("成功"+search);
		
		return "/ticket/CTicketSearch";
	}
	
	@GetMapping("/showOrderDetail/{TicketOrderId}")
	public String showOrderDetail(
			Model model, HttpSession session,
			@PathVariable String TicketOrderId 
			) {
		List<Price> priceList = new ArrayList<>();
		Double discountRatio;
		ArrayList<Double> dPriceList = new ArrayList<>();
		TicketOrder ticketOrder = backendService.queryTicketOrderbyId(TicketOrderId);
		
		TicketOrder ticketOrderF = backendService.queryTicketOrderDetailByTicketOrder(ticketOrder);
		Set<TicketOrderDetail> ticketOrderDetails = ticketOrderF.getTicketOrderDetails();
		
		List<TicketOrderDetail> list = new ArrayList<TicketOrderDetail>(ticketOrderDetails);
		Event event = backendService.queryOneEvent(list.get(0).getEventId());
		Integer discount = list.get(0).getDiscount();
		if(discount==1) {
			List<Price> oPriceList = backendService.selectPriceList(event.getId());
			priceList = backendService.selectPriceList(event.getId());
			if(event.getTypeId()==1) {
				Exhibition exhibition = backendService.selectExhibitionByEvent(event.getId());
				discountRatio = exhibition.getDiscountRatio();
				
				}else {
				Sport sport = backendService.selectSportByEvent(event.getId());
				discountRatio = sport.getDiscountRatio();
			}
			for(Price price:oPriceList) {
				Double dCost = price.getCost().doubleValue();
				double nCost = discountRatio*dCost;
				dPriceList.add(nCost);
			}
			
		}else {
			priceList = backendService.selectPriceList(event.getId());
		}

		model.addAttribute("ticketOrder", ticketOrderF);
		model.addAttribute("event", event);
		model.addAttribute("TicketOrderDetails", list);
		model.addAttribute("priceList", priceList);
		model.addAttribute("dPriceList", dPriceList);
		model.addAttribute("discount", discount);
		
		return "account/ticketOrderDetail";
		
	}
	
	@GetMapping("/buyByMCoinSucc/{TicketOrderId}")
	public String buyTicketbyMCoin(
			Model model, HttpSession session,
			@PathVariable String TicketOrderId 
			) throws Exception{
		String s="";
		MemberBean member = (MemberBean) session.getAttribute("currentUser");
		BigDecimal userBalance = member.getmCoin().getBalance();
		TicketOrder ticketOrder = backendService.queryTicketOrderbyId(TicketOrderId);
		BigDecimal btotalCost = new BigDecimal(ticketOrder.getTotalCost());
		
		int result = userBalance.compareTo(btotalCost);
		//若totalCost較大 回傳-1 若userBalance較大 回傳1 相等回傳0
		//若-1則付款失敗
		
		Double discountRatio;
		ArrayList<Double> dPriceList = new ArrayList<>();
		
		if(result==-1) {
			s="account/myWallet";
		}else {

			BigDecimal updatedBalance = userBalance.subtract(btotalCost);
			member.getmCoin().setBalance(updatedBalance);
			accountService.update(member);
			session.setAttribute("member", member);
			
			Timestamp validTime = getValidTime();
			ticketOrder.setValidTime(validTime);
			ticketOrder.setStatus(1);
			backendService.updateTicketOrder(ticketOrder);

			TicketOrder ticketOrderN = backendService.queryTicketOnWayByTicketOrder(ticketOrder);
			Set<TicketOnWay> ticketOnWays = ticketOrderN.getTicketOnWays();
			for(TicketOnWay ticketOnWay: ticketOnWays) {
				Integer id = ticketOnWay.getId();
				backendService.deleteTicketOnWay(id);
				
			}
			TicketOrder ticketOrderF = backendService.queryTicketOrderDetailByTicketOrder(ticketOrder);
			Set<TicketOrderDetail> ticketOrderDetails = ticketOrderF.getTicketOrderDetails();
			
			List<TicketOrderDetail> list = new ArrayList<TicketOrderDetail>(ticketOrderDetails);
			Event event = backendService.queryOneEvent(list.get(0).getEventId());
			List<Price> priceList = backendService.selectPriceList(event.getId());
			
			Integer discount = list.get(0).getDiscount();
			if(discount==1) {
				List<Price> oPriceList = backendService.selectPriceList(event.getId());
				if(event.getTypeId()==1) {
					Exhibition exhibition = backendService.selectExhibitionByEvent(event.getId());
					discountRatio = exhibition.getDiscountRatio();
					
					}else {
					Sport sport = backendService.selectSportByEvent(event.getId());
					discountRatio = sport.getDiscountRatio();
				}
				for(Price price:oPriceList) {
					Double dCost = price.getCost().doubleValue();
					double nCost = discountRatio*dCost;
					dPriceList.add(nCost);
				}
				
			}else {
				priceList = backendService.selectPriceList(event.getId());
			}
			
			
			model.addAttribute("ticketOrder", ticketOrderF);
			model.addAttribute("event", event);
			model.addAttribute("TicketOrderDetails", list);
			model.addAttribute("priceList", priceList);
			
			model.addAttribute("dPriceList", dPriceList);
			model.addAttribute("discount", discount);
			s="account/ticketOrderDetail";
		}

		return s;
		
	}
	
	@PostMapping("/TicketBuyOnWay/{eventId}")
	public String buyTicketOnWay(@PathVariable int eventId,
			@RequestParam(value="discount") Integer discount,
			@RequestParam(value="count")Integer[] countList,//priceId對應的票券張數
			@RequestParam(value="sessionId",required=false) Integer sessionId, 
			Model model,HttpSession session,RedirectAttributes ra
			) throws JsonProcessingException {
		if(sessionId!=null) {
			SportSession sportSession = backendService.queryOneSportSession(sessionId);
			model.addAttribute("sportSessionJSON", new ObjectMapper().writeValueAsString(sportSession));
		}
		
		MemberBean member = (MemberBean) session.getAttribute("currentUser");
		List<Price> priceList = backendService.selectPriceList(eventId);
		//有Name跟Cost
		model.addAttribute("priceListJSON", new ObjectMapper().writeValueAsString(priceList));
		Event event = backendService.queryOneEvent(eventId);
		Integer typeId = event.getTypeId();
		ArrayList<Double> dPriceList = new ArrayList<>();
		double totalCost = 0.00;
		if(discount==1) {
			Double discountRatio;
			if(typeId==1) {//exhibition
				discountRatio = backendService.selectExhibitionByEvent(eventId).getDiscountRatio();
			}else {//sport
				discountRatio = backendService.selectSportByEvent(eventId).getDiscountRatio();
			}
			for(Price price:priceList) {
				Double dCost = price.getCost().doubleValue();
				Double nCost = dCost*discountRatio;
				dPriceList.add(nCost);
			}
			for(int i=0;i<countList.length;i++) {
				double cost = countList[i].doubleValue();
				double subtotal = cost*(dPriceList.get(i));
				totalCost=totalCost + subtotal;
			}
			System.out.println("============折價============="+totalCost);
			//只有Cost
			model.addAttribute("dPriceListJSON", new ObjectMapper().writeValueAsString(dPriceList));
			model.addAttribute("discountRatioJSON", new ObjectMapper().writeValueAsString(discountRatio));
			
		}else {
			for(int i=0;i<countList.length;i++) {
				int subtotal = countList[i]*(priceList.get(i).getCost());
				totalCost=totalCost + subtotal;
			}
			System.out.println("============原價============="+totalCost);
		}
		int itotalCost=(int) Math.round(totalCost);
		System.out.println("============四捨五入============="+itotalCost);
		//memberId, status, validtime, totalCost
		
		
		
		//memberId, status, validtime, totalCost, orderDetail, ticketOnWay
//		TicketOrder ticketOrder = new TicketOrder(member.getId(),0,null,itotalCost,ticketOrderDetails,ticketOnWays);
		TicketOrder ticketOrder = new TicketOrder(member.getId(),0,null,itotalCost);
		TicketOrder savedTicketOrder = backendService.addTicketOrder(ticketOrder);
		System.out.println("========================================="+savedTicketOrder.getId());
		
		
		//======================塞ticketOnWaysList/ ticketOrderDetail================================
		Timestamp deleteTime = getDeleteTime();
		List<TicketOnWay> ticketOnWays = new ArrayList<TicketOnWay>();
		List<TicketOrderDetail> ticketOrderDetails = new ArrayList<TicketOrderDetail>();
		List<TicketOnWay> savedTicketOnWays = new ArrayList<TicketOnWay>();
		List<TicketOrderDetail> savedTicketOrderDetails = new ArrayList<TicketOrderDetail>();
		if(event.getTypeId()!=3) {
			for(int i=0;i<countList.length;i++) {
			Integer priceId = priceList.get(i).getId();
			Integer value = countList[i];
			Integer seatId = null;
			TicketOnWay ticketOnWay = new TicketOnWay(savedTicketOrder,eventId,priceId,seatId,value,deleteTime);
			TicketOrderDetail ticketOrderDetail = new TicketOrderDetail(savedTicketOrder,eventId,priceId,discount,seatId,value);
			ticketOrderDetails.add(ticketOrderDetail);
			ticketOnWays.add(ticketOnWay);
			}
		}else{
			//只有sport需要扣stock
			for(int i=0;i<countList.length;i++) {
				Integer priceId = priceList.get(i).getId();
				Integer value = countList[i];
				List<SportSeat> seatList = backendService.selectSportSeatBySession(sessionId);
				Integer seatId = seatList.get(i).getId();
				TicketOrderDetail ticketOrderDetail = new TicketOrderDetail(savedTicketOrder,eventId,priceId,discount,seatId,value);
				ticketOrderDetails.add(ticketOrderDetail);
				TicketOnWay ticketOnWay = new TicketOnWay(savedTicketOrder,eventId,priceId,seatId,value,deleteTime);
				ticketOnWays.add(ticketOnWay);
			}
		}
		
		for(TicketOnWay ticektOnWay:ticketOnWays) {
			 TicketOnWay savedTicketOnWay = backendService.addTicketOnWay(ticektOnWay);
			 savedTicketOnWays.add(savedTicketOnWay);
			 if(typeId==3) {
				 
				 SportSeat seat = backendService.queryOneSportSeat(savedTicketOnWay.getSeatId());
				 Integer oldStock = seat.getStock();
				 Integer NewStock = oldStock - savedTicketOnWay.getValue();
				 seat.setStock(NewStock);
				 backendService.updateSeatStock(seat);
				 
			 }
			 
		}
		
		for(TicketOrderDetail ticketOrderDetail:ticketOrderDetails) {
			TicketOrderDetail savedTicketOrderDetail = backendService.addTicketOrderDetail(ticketOrderDetail);
			savedTicketOrderDetails.add(savedTicketOrderDetail);
		}
	
		
		System.out.println(new ObjectMapper().writeValueAsString(savedTicketOrder));
		System.out.println(new ObjectMapper().writeValueAsString(savedTicketOrderDetails));
		System.out.println(new ObjectMapper().writeValueAsString(savedTicketOnWays));

//		model.addAttribute("event", event);
//		model.addAttribute("ticketOrder", savedTicketOrder);
//		model.addAttribute("ticketOrderDetails", savedTicketOrderDetails);
//		model.addAttribute("ticketOnWays", savedTicketOnWays);
		
		model.addAttribute("eventJSON", new ObjectMapper().writeValueAsString(event));
		model.addAttribute("ticketOrderJSON", new ObjectMapper().writeValueAsString(savedTicketOrder));
		model.addAttribute("ticketOrderDetailsJSON", new ObjectMapper().writeValueAsString(savedTicketOrderDetails));
		model.addAttribute("ticketOnWaysJSON", new ObjectMapper().writeValueAsString(savedTicketOnWays));
		
		return "/ticket/CTicketOnWay";
	}
	
	
	
	@PostMapping("/TicketBuy/{eventId}")
	public String buyTicket(@PathVariable int eventId,
			@RequestParam(value="sessionId",required=false) Integer sessionId, 
			Model model,HttpSession session,RedirectAttributes ra
			) {
		String s="";
		MemberBean member = (MemberBean) session.getAttribute("currentUser");
		if(member==null) {
			s="redirect:/account/login";
		}else {
			Event event = backendService.queryOneEvent(eventId);
			Company company = backendService.queryCompany(event.getCompanyId());
			model.addAttribute("event", event);
			model.addAttribute("company", company);
			if(event.getTypeId()==1) {
				//這是exhibition
				Exhibition exhibition = backendService.selectExhibitionByEvent(eventId);
				List<Price> priceList = backendService.selectPriceList(eventId);
				CreditCard creditCard = backendService.queryCreditCard(exhibition.getCardId());
				model.addAttribute("exhibition", exhibition);
				model.addAttribute("priceList", priceList);
				model.addAttribute("creditCard", creditCard);
			}else if(event.getTypeId()==2) {
				//這是attraction
				Attraction attraction = backendService.selectAttractionByEvent(eventId);
				List<Price> priceList = backendService.selectPriceList(eventId);
				model.addAttribute("attraction", attraction);
				model.addAttribute("priceList", priceList);
			}else {
				//這是sport
				Sport sport = backendService.selectSportByEvent(eventId);
				List<Price> priceList = backendService.selectPriceListBySessionId(sessionId);
				List<SportSeat> seatList = backendService.selectSportSeatBySession(sessionId);
				CreditCard creditCard = backendService.queryCreditCard(sport.getCardId());
				model.addAttribute("sport", sport);
				model.addAttribute("sessionId", sessionId);
				model.addAttribute("priceList", priceList);
				model.addAttribute("seatList", seatList);
				model.addAttribute("creditCard", creditCard);
			}
			
			s="/ticket/CTicketBuy";
			
		}

		return s;
		
	}
	
	
	@GetMapping(value="CTicketIndex")
	public String CTicketIndex(
			Model model
			) {
		ArrayList<Event> smallexhibtion = new ArrayList<>();
		ArrayList<Event> smallattraction = new ArrayList<>();
		ArrayList<Event> smallsport = new ArrayList<>();
		
		ArrayList<Event> exhibitions = backendService.queryStatusOKByTypeId(1);
		int eSize = exhibitions.size();
		List<Integer> eList = getRandom(eSize);
		for(int i=0;i<eList.size();i++) {
			Integer no = eList.get(i);
			
			Event event = exhibitions.get(no);
			Exhibition exhibition = backendService.selectExhibitionByEvent(event.getId());
			event.setExhibition(exhibition);
			smallexhibtion.add(event);
		}
		
		ArrayList<Event> attractions = backendService.queryStatusOKByTypeId(2);
		int aSize = attractions.size();
		List<Integer> aList = getRandom(aSize);
		System.out.println(aList.size());
		for(int i=0;i<aList.size();i++) {
			Integer no = aList.get(i);
			
			Event event = attractions.get(no);
			Attraction attraction = backendService.selectAttractionByEvent(event.getId());
			event.setAttraction(attraction);
			smallattraction.add(event);
		}
		
		ArrayList<Event> sports = backendService.queryStatusOKByTypeId(3);
		int sSize = sports.size();
		List<Integer> sList = getRandom(sSize);
		System.out.println(sList.size());
		for(int i=0;i<sList.size();i++) {
			Integer no = sList.get(i);
			
			Event event = sports.get(no);
			Sport sport = backendService.selectSportByEvent(event.getId());
			event.setSport(sport);
			smallsport.add(event);
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
		Company company = backendService.queryCompany(event.getCompanyId());
		EventType eventType = backendService.queryEventType(event.getTypeId());
		List<Price> priceList = backendService.selectPriceList(eventId);
		model.addAttribute("event",event);
		model.addAttribute("company",company);
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
			 model.addAttribute("sessionList",sessionList);
			 model.addAttribute("sessionSeatList",sessionSeatList);
			 
		}

		return "/ticket/CTicketShow";
		
	}
	@GetMapping("/TicketType/{typeId}")
	public String sortByType(@PathVariable int typeId,Model model) throws JsonProcessingException {
		EventType eventType = backendService.queryEventType(typeId);
		ArrayList<Event> events = backendService.queryStatusOKByTypeId(typeId);
		for(Event event:events) {
			if(event.getTypeId()==1) {
				event.setExhibition(backendService.selectExhibitionByEvent(event.getId()));
			}else if(event.getTypeId()==2) {
				event.setAttraction(backendService.selectAttractionByEvent(event.getId()));
			}else {
				event.setSport(backendService.selectSportByEvent(event.getId()));
			}
		}
		int totalCount = events.size();
		model.addAttribute("events", events);
		model.addAttribute("eventsJSON", new ObjectMapper().writeValueAsString(events));
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("eventType", eventType);
		model.addAttribute("queryType",2);
		return "/ticket/CTicketSort";

	}
	
	@GetMapping("/TicketCompany/{companyId}")
	public String sortByCompany(@PathVariable int companyId,Model model) throws JsonProcessingException {
		ArrayList<Event> events = backendService.queryStatusOKAll(companyId);
		Company company = backendService.queryCompany(companyId);
		for(Event event:events) {
			if(event.getTypeId()==1) {
				event.setExhibition(backendService.selectExhibitionByEvent(event.getId()));
			}else if(event.getTypeId()==2) {
				event.setAttraction(backendService.selectAttractionByEvent(event.getId()));
			}else {
				event.setSport(backendService.selectSportByEvent(event.getId()));
			}
		}
		int totalCount = events.size();
		model.addAttribute("events", events);
		model.addAttribute("eventsJSON", new ObjectMapper().writeValueAsString(events));
		model.addAttribute("company", company);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("queryType",1);
		return "/ticket/CTicketSort";
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
		
		while(list.size()<3){ //總共3個數字
			int n=r.nextInt(size); //產生的數字(看總共幾筆)
			if(list.contains(n)) 
				continue;     //重複的不加入
			else
				list.add(n);
			
			}
		return list;

	}
	
	public Timestamp getDeleteTime() {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		
		//==============afterDate為Date型別的deletTime
		Date afterDate = new Date(now.getTime() + 600000);
		Timestamp deleteTime = new Timestamp(afterDate.getTime());
		return deleteTime;
	}
	
	public Timestamp getValidTime() {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		Timestamp validTime = new Timestamp(now.getTime());
		return validTime;
	}
	
}
