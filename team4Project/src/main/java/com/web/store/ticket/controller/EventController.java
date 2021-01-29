package com.web.store.ticket.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.store.company.model.Company;
import com.web.store.ticket.model.Attraction;
import com.web.store.ticket.model.Bank;
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
@SessionAttributes(names = {"company"}) ////存取session屬性
public class EventController {
	@Autowired
	BackendService backendService;
	
	@Autowired
	ServletContext context;
	
//	final static String DATE_FORMAT = "yyyy-MM-dd";
//	final static String DATETIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
	
	@GetMapping(value="/combobox",produces = {"application/json; charset=UTF-8"})
	public @ResponseBody ArrayList<Bank> combobox() {
		return backendService.queryAllBank();
	}
	
	//刪除票券
	@GetMapping("/EventDel/{eventId}")
	public String deleteEvent(@PathVariable int eventId) {
		System.out.println("========================================="+eventId);
		backendService.delete(eventId);
		return "redirect:/TicketIndex";
	}
	
	//上下架
		@GetMapping("/EventUpdateStatus/{eventId}")
		public String updateEventStatus(@PathVariable int eventId) {
			backendService.updateStatusEvent(eventId);
			return "redirect:/TicketIndex";
		}
	
	//更新票券
	@GetMapping("/EventUpdate/{eventId}")
	public String updateEvent(@PathVariable int eventId,Model model) {
		String s="";
		Event event = backendService.queryOneEvent(eventId);
		List<Price> priceList = backendService.selectPriceList(eventId);
		model.addAttribute("event",event);
		model.addAttribute("priceList",priceList);
		int priceSize = priceList.size();
		model.addAttribute("priceSize",priceSize);
		int typeId = event.getTypeId();
		if(typeId==1) {
			Exhibition exhibition = backendService.selectExhibitionByEvent(eventId);
			Integer creditCardId = exhibition.getCardId();
			CreditCard creditCard = backendService.queryCreditCard(creditCardId);
			model.addAttribute("creditCard",creditCard);
			model.addAttribute("exhibition",exhibition);
			s="/ticket/UpdatePageEX";
		}else if(typeId==2) {
			Attraction attraction = backendService.selectAttractionByEvent(eventId);
			model.addAttribute("attraction",attraction);
			s="/ticket/UpdatePageAT";
		}else if(typeId==3) {
			Sport sport = backendService.selectSportByEvent(eventId);
			Integer creditCardId = sport.getCardId();
			CreditCard creditCard = backendService.queryCreditCard(creditCardId);
			int sportId = sport.getId();
			 ArrayList<SportSession> sessionList = backendService.selectBySport(sportId);
			 SportSession session = sessionList.get(0);
			 Integer sportSessionId = session.getId();
			List<SportSeat> seatList = backendService.selectSportSeatBySession(sportSessionId);
			 model.addAttribute("creditCard",creditCard);
			 model.addAttribute("sport",sport);
			 model.addAttribute("sessionList",sessionList);
			 model.addAttribute("seatList",seatList);
			 s="/ticket/UpdatePageSP";
		}

		return s;
		
	}
	
	//顯示票券
	@GetMapping("/EventShow/{eventId}")
	@SuppressWarnings("null")
	public String showEvent(@PathVariable int eventId,Model model) {
		String s="";
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
			CreditCard creditCard = backendService.queryCreditCard(creditCardId);
			model.addAttribute("creditCard",creditCard);
			model.addAttribute("exhibition",exhibition);
			s="/ticket/ShowPageEX";
		}else if(typeId==2) {
			Attraction attraction = backendService.selectAttractionByEvent(eventId);
			model.addAttribute("attraction",attraction);
			s="/ticket/ShowPageAT";
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
			 s="/ticket/ShowPageSPdetail";
		}

		return s;
	}
	
	@GetMapping(value="/TicketIndex")
	public String showAllEvent(
			Model model
			) {
		System.out.println("123123");
		System.out.println(RequestContextHolder.currentRequestAttributes().getSessionId());
		Company company = (Company)model.getAttribute("company");
		System.out.println(company);
		int companyId = company.getId();
		ArrayList<Event> events = backendService.queryAll(companyId);
		model.addAttribute("events", events);
		return "/ticket/TicketIndex";
	}
	
	//顯示圖片至前端
	@GetMapping(value="/serveFile", produces="image/jpeg")
	public @ResponseBody byte[] serveFile(Integer eventId) {
		Event event = backendService.queryOneEvent(eventId);
		Blob blob = event.getEventImage();
		byte[] b = null;
		String s = "";
		BufferedImage image;
		try {
			image = ImageIO.read( blob.getBinaryStream() );
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ImageIO.write(image, "png", baos);
			b = baos.toByteArray();
			s = new String(b,"UTF-8");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return b;
	}

	@PostMapping(value="/ticket/InputPageEX")
	public String proceedEx(
			RedirectAttributes ra,
			@RequestParam(value="id",required=false) Integer id, 
			@RequestParam(value="typeId") Integer typeId, 
			@RequestParam(value="eventName") String eventName, 
			@RequestParam(value="eventLocation")String eventLocation,
			Model model,
//			@RequestParam(value="companyId")Integer companyId,
			@RequestParam(value="eventImage")MultipartFile eventImage,
			@RequestParam(value="status")Integer status,
			@RequestParam(value="exhibitionId",required=false)Integer exhibitionId,
			@RequestParam(value="onSaleDate")String onSaleDate,
			@RequestParam(value="offSaleDate")String offSaleDate,
			@RequestParam(value="commDate")String commDate,
			@RequestParam(value="dueDate")String dueDate,
			@RequestParam(value="description")String description,
			@RequestParam(value="cardId")Integer cardId,
			@RequestParam(value="discountRatio")Double discountRatio,
			@RequestParam(value="priceName")String[] priceName,
			@RequestParam(value="priceCost")Integer[] priceCost

			) throws IOException {
		String s ="";

		byte[] bytes = eventImage.getBytes();

		try {
			Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
			String imageName = eventImage.getOriginalFilename();
			Company company = (Company)model.getAttribute("company");
			int companyId = company.getId();
				if(id==null) {
					Map<String, Object> map = addEx(typeId,eventName,eventLocation,companyId,blob,imageName, status, onSaleDate,offSaleDate,commDate,dueDate,description,cardId,discountRatio,priceName,priceCost);		
					Event event = (Event) map.get("event");
					EventType eventType = backendService.queryEventType(event.getTypeId());
					Exhibition exhibition = (Exhibition) map.get("exhibition");
					ra.addFlashAttribute("event", map.get("event"));
					ra.addFlashAttribute("eventType", eventType);
					ra.addFlashAttribute("exhibition", map.get("exhibition"));
					ra.addFlashAttribute("priceList", map.get("priceList"));
					Integer creditCardId = exhibition.getCardId();
					CreditCard creditCard = backendService.queryCreditCard(creditCardId);
					ra.addFlashAttribute("creditCard",creditCard);
					
				}else {
					Map<String, Object> map = updateEx(id,typeId,eventName,eventLocation,companyId,blob,imageName,status, exhibitionId, onSaleDate,offSaleDate,commDate,dueDate,description,cardId,discountRatio,priceName,priceCost);
					Event event = (Event) map.get("event");
					EventType eventType = backendService.queryEventType(event.getTypeId());
					Exhibition exhibition = (Exhibition) map.get("exhibition");
					ra.addFlashAttribute("event", map.get("event"));
					ra.addFlashAttribute("eventType", eventType);
					ra.addFlashAttribute("exhibition", map.get("exhibition"));
					ra.addFlashAttribute("priceList", map.get("priceList"));
					Integer creditCardId = exhibition.getCardId();
					CreditCard creditCard = backendService.queryCreditCard(creditCardId);
					ra.addFlashAttribute("creditCard",creditCard);
				}
				
				s="redirect:/ticket/ShowPageEX";
		} catch (SerialException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return s;
	}	
	
	
	@PostMapping(value="/ticket/InputPageAT")
	public String proceedAt(
			RedirectAttributes ra,
			@RequestParam(value="id",required=false) Integer id,
			@RequestParam(value="typeId") Integer typeId, 
			@RequestParam(value="eventName") String eventName, 
			@RequestParam(value="eventLocation")String eventLocation, 
			Model model,
//			@RequestParam(value="companyId")Integer companyId,
			@RequestParam(value="eventImage")MultipartFile eventImage,
			@RequestParam(value="status")Integer status,
			
			@RequestParam(value="attractionId",required=false)Integer attractionId,
			@RequestParam(value="onSaleDate")String onSaleDate,
			@RequestParam(value="offSaleDate")String offSaleDate,
			@RequestParam(value="commDate")String commDate,
			@RequestParam(value="dueDate")String dueDate,
			@RequestParam(value="description")String description,
			@RequestParam(value="priceName")String[] priceName,
			@RequestParam(value="priceCost")Integer[] priceCost
			) throws IOException {
		byte[] bytes = eventImage.getBytes();

		try {
			Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
			String imageName =eventImage.getOriginalFilename();
			Company company = (Company)model.getAttribute("company");
			int companyId = company.getId();
				
			if(id==null) {
				Map<String, Object> map = addAt(typeId,eventName,eventLocation,companyId,blob,imageName,status,onSaleDate,offSaleDate,commDate,dueDate,description,priceName,priceCost);		
				Event event = (Event) map.get("event");
				EventType eventType = backendService.queryEventType(event.getTypeId());
				ra.addFlashAttribute("event", map.get("event"));
				ra.addFlashAttribute("eventType", eventType);
				ra.addFlashAttribute("attraction", map.get("attraction"));
				ra.addFlashAttribute("priceList", map.get("priceList"));

			}else {
				Map<String, Object> map = updateAt(id,typeId,eventName,eventLocation,companyId,blob,imageName,status,attractionId,onSaleDate,offSaleDate,commDate,dueDate,description,priceName,priceCost);
				Event event = (Event) map.get("event");
				EventType eventType = backendService.queryEventType(event.getTypeId());
				ra.addFlashAttribute("event", map.get("event"));
				ra.addFlashAttribute("eventType", eventType);
				ra.addFlashAttribute("attraction", map.get("attraction"));
				ra.addFlashAttribute("priceList", map.get("priceList"));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} 

		return "redirect:/ticket/ShowPageAT";
	}
	
	@PostMapping(value="/ticket/InputPageSP")
	public String proceedSp(
			RedirectAttributes ra,
			@RequestParam(value="id",required=false) Integer id,
			@RequestParam(value="typeId") Integer typeId, 
			@RequestParam(value="eventName") String eventName, 
			@RequestParam(value="eventLocation")String eventLocation,
			Model model,
			@RequestParam(value="eventImage")MultipartFile eventImage,
			@RequestParam(value="status")Integer status,
//			@RequestParam(value="companyId")Integer companyId,
			
			@RequestParam(value="sportId",required=false)Integer sportId,
			@RequestParam(value="onSaleDate")String onSaleDate,
			@RequestParam(value="offSaleDate")String offSaleDate,
			@RequestParam(value="description")String description,
			@RequestParam(value="cardId")Integer cardId,
			@RequestParam(value="discountRatio")Double discountRatio,
			
			@RequestParam(value="priceName")String[] priceName,
			@RequestParam(value="priceCost")Integer[] priceCost,
			@RequestParam(value="kickOfTime")String[] kickOfTime,
			@RequestParam(value="seatNo")Integer[] seatNo
			) throws IOException {
		byte[] bytes = eventImage.getBytes();

		try {
			Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
			String imageName = eventImage.getOriginalFilename();
			Company company = (Company)model.getAttribute("company");
			int companyId = company.getId();
			if(id==null) {
				Map<String, Object> map = addSp(typeId,eventName,eventLocation,companyId,blob,imageName, status, onSaleDate,offSaleDate,description,cardId,discountRatio,priceName,priceCost,kickOfTime,seatNo);		
				Event event = (Event) map.get("event");
				EventType eventType = backendService.queryEventType(event.getTypeId());
				Sport sport = (Sport) map.get("sport");
				Integer creditCardId = sport.getCardId();
				CreditCard creditCard = backendService.queryCreditCard(creditCardId);
				ra.addFlashAttribute("creditCard",creditCard);
				ra.addFlashAttribute("event", map.get("event"));
				ra.addFlashAttribute("eventType", eventType);
				ra.addFlashAttribute("sport", map.get("sport"));
				ra.addFlashAttribute("priceList", map.get("priceList"));
				ra.addFlashAttribute("sessionList", map.get("sessionList"));
				ra.addFlashAttribute("seatList", map.get("seatList"));
				
			}else {
				//先把seatList刪掉 再刪sessionList
				ArrayList<SportSession> oldSessionList = backendService.selectBySport(sportId);
				for(SportSession session: oldSessionList) {
					backendService.deleteSeatList(session.getId());
					}
				backendService.deleteSessionList(sportId);
				//呼叫更新方法
				Map<String, Object> map = updateSp(id,typeId,eventName,eventLocation,companyId,blob,imageName,status, sportId,onSaleDate,offSaleDate,description,cardId,discountRatio,priceName,priceCost,kickOfTime,seatNo);		
				Event event = (Event) map.get("event");
				EventType eventType = backendService.queryEventType(event.getTypeId());
				Sport sport = (Sport) map.get("sport");
				Integer creditCardId = sport.getCardId();
				CreditCard creditCard = backendService.queryCreditCard(creditCardId);
				ra.addFlashAttribute("creditCard",creditCard);
				ra.addFlashAttribute("event", map.get("event"));
				ra.addFlashAttribute("eventType", eventType);
				ra.addFlashAttribute("sport", map.get("sport"));
				ra.addFlashAttribute("priceList", map.get("priceList"));
				ra.addFlashAttribute("sessionList", map.get("sessionList"));
				ra.addFlashAttribute("seatList", map.get("seatList"));
				
			}

		} catch (SerialException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/ticket/ShowPageSP";
	}
	
	
	@SuppressWarnings("null")
	public Map<String, Object> addEx(
			
			Integer typeId, 
			String eventName, 
			String eventLocation, 
		
			Integer companyId,
			Blob eventImage,
			String imageName,
			Integer status,
			
			String onSaleDate,
			String offSaleDate,
			String commDate,
			String dueDate,
			String description,
			Integer cardId,
			Double discountRatio,
			String[] priceName,
			Integer[] priceCost) {
		Event event = new Event(typeId, eventName,eventLocation, eventImage, imageName, companyId,status);
		
		Timestamp onSaleDateT = Timestamp.valueOf(onSaleDate+".00");
		Timestamp offSaleDateT = Timestamp.valueOf(offSaleDate+".00");
		Date commDateD = Date.valueOf(commDate);
		Date dueDateD = Date.valueOf(dueDate);
		Exhibition exhibition = new Exhibition(onSaleDateT, offSaleDateT, commDateD, dueDateD, description,cardId,discountRatio);
		ArrayList<Price> priceList = new ArrayList<Price>();
		for(int i=0;i<priceName.length;i++) {
			String name = priceName[i];
			System.out.print(name);
			Integer cost = priceCost[i];
			System.out.print(cost);
			Price price = new Price(name,cost);
			priceList.add(price);
		}
		//Event event,Exhibition exhibition,Attraction attraction,Sport sport,ArrayList<Price> priceList
		backendService.addEvent(event, exhibition, null, null, priceList);
		
		Map<String, Object> map = new HashMap<> ();
		map.put("event", event);
		map.put("exhibition", exhibition);
		map.put("priceList", priceList);
		return map;
	}
	
	@SuppressWarnings("null")
	public Map<String, Object> updateEx(
			Integer eventId,
			Integer typeId, 
			String eventName, 
			String eventLocation, 
			Integer companyId,
			Blob eventImage,
			String imageName,
			Integer status,
			
			Integer exhibitionId,
			String onSaleDate,
			String offSaleDate,
			String commDate,
			String dueDate,
			String description,
			Integer cardId,
			Double discountRatio,
			String[] priceName,
			Integer[] priceCost) {
		Event event = new Event(eventId,typeId, eventName,eventLocation, eventImage, imageName, companyId,status);
				
		Timestamp onSaleDateT = Timestamp.valueOf(onSaleDate+".00");
		Timestamp offSaleDateT = Timestamp.valueOf(offSaleDate+".00");
		Date commDateD = Date.valueOf(commDate);
		Date dueDateD = Date.valueOf(dueDate);
		Exhibition exhibition = new Exhibition(exhibitionId,eventId,onSaleDateT, offSaleDateT, commDateD, dueDateD, description,cardId,discountRatio);
		ArrayList<Price> priceList = new ArrayList<Price>();
		for(int i=0;i<priceName.length;i++) {
			String name = priceName[i];
			System.out.print(name);
			Integer cost = priceCost[i];
			System.out.print(cost);
			Price price = new Price(name,cost);
			priceList.add(price);
		}
		//Event event,Exhibition exhibition,Attraction attraction,Sport sport,ArrayList<Price> priceList
		backendService.updateEvent(event, exhibition, null, null, priceList);
		
		Map<String, Object> map = new HashMap<> ();
		map.put("event", event);
		map.put("exhibition", exhibition);
		map.put("priceList", priceList);
		return map;
	}
	
	@SuppressWarnings("null")
	public Map<String, Object> addAt(
			Integer typeId, 
			String eventName, 
			String eventLocation, 
			Integer companyId,
			Blob eventImage,
			String imageName,
			Integer status,
			
			String onSaleDate,
			String offSaleDate,
			String commDate,
			String dueDate,
			String description,

			String[] priceName,
			Integer[] priceCost) {
		Event event = new Event(typeId, eventName,eventLocation, eventImage,imageName,companyId,status);
		Timestamp onSaleDateT = Timestamp.valueOf(onSaleDate);
		Timestamp offSaleDateT = Timestamp.valueOf(offSaleDate);
		Date commDateD = Date.valueOf(commDate);
		Date dueDateD = Date.valueOf(dueDate);
		Attraction attraction = new Attraction(onSaleDateT, offSaleDateT, commDateD, dueDateD, description);
		ArrayList<Price> priceList = new ArrayList<Price>();
		for(int i=0;i<priceName.length;i++) {
			String name = priceName[i];
			Integer cost = priceCost[i];
			Price price = new Price(name,cost);
			priceList.add(price);
		}
		//Event event,Exhibition exhibition,Attraction attraction,Sport sport,List<Price> priceList
		backendService.addEvent(event, null, attraction, null, priceList);
		Map<String, Object> map = new HashMap<> ();
		map.put("event", event);
		map.put("attraction", attraction);
		map.put("priceList", priceList);
		return map;
	}
	
	@SuppressWarnings("null")
	public Map<String, Object> updateAt(
			Integer eventId,
			Integer typeId, 
			String eventName, 
			String eventLocation, 
			Integer companyId,
			Blob eventImage,
			String imageName,
			Integer status,
			
			Integer attractionId,
			String onSaleDate,
			String offSaleDate,
			String commDate,
			String dueDate,
			String description,

			String[] priceName,
			Integer[] priceCost) {
		Event event = new Event(eventId,typeId, eventName,eventLocation, eventImage, imageName, companyId,status);
		Timestamp onSaleDateT = Timestamp.valueOf(onSaleDate);
		Timestamp offSaleDateT = Timestamp.valueOf(offSaleDate);
		Date commDateD = Date.valueOf(commDate);
		Date dueDateD = Date.valueOf(dueDate);
		Attraction attraction = new Attraction(attractionId,eventId,onSaleDateT, offSaleDateT, commDateD, dueDateD, description);
		ArrayList<Price> priceList = new ArrayList<Price>();
		for(int i=0;i<priceName.length;i++) {
			String name = priceName[i];
			Integer cost = priceCost[i];
			Price price = new Price(name,cost);
			priceList.add(price);
		}
		//Event event,Exhibition exhibition,Attraction attraction,Sport sport,List<Price> priceList
		backendService.updateEvent(event, null, attraction, null, priceList);
		Map<String, Object> map = new HashMap<> ();
		map.put("event", event);
		map.put("attraction", attraction);
		map.put("priceList", priceList);
		return map;
	}
	
	@SuppressWarnings("null")
	public Map<String, Object> addSp(
			Integer typeId, 
			String eventName, 
			String eventLocation, 
			Integer companyId,
			Blob eventImage,
			String imageName,
			Integer status,
			
			String onSaleDate,
			String offSaleDate,
			String description,
			Integer cardId,
			Double discountRatio,
			String[] priceName,
			Integer[] priceCost,
			String[] kickOfTime,
			Integer[] seatNo
			
			) {
		
//		System.out.println("imageName in addSp : "+ imageName);
		Event event = new Event(typeId, eventName,eventLocation, eventImage, imageName, companyId,status);
		Timestamp onSaleDateT = Timestamp.valueOf(onSaleDate+".00");
		Timestamp offSaleDateT = Timestamp.valueOf(offSaleDate+".00");

		Sport sport = new Sport(onSaleDateT, offSaleDateT, description, cardId,discountRatio);
		ArrayList<Price> priceList = new ArrayList<Price>();
		for(int i=0;i<priceName.length;i++) {
			String name = priceName[i];
			Integer cost = priceCost[i];
			Price price = new Price(name,cost);
			priceList.add(price);
			
		}
		
		//Event event,Exhibition exhibition,Attraction attraction,Sport sport,List<Price> priceList
		List<Integer> priceIdList =backendService.addEvent(event, null, null, sport, priceList);
		ArrayList<SportSession> sessionList = new ArrayList<SportSession>();
		ArrayList<SportSeat> seatList = new ArrayList<SportSeat>();
		for(int i=0;i<kickOfTime.length;i++) {
			Timestamp kickOfTimeT = Timestamp.valueOf(kickOfTime[i]+":00.00");
			SportSession sportSession = new SportSession(kickOfTimeT);
			sessionList.add(sportSession);
			backendService.addSportSession(sport, sportSession);
			for(int j=0;j<seatNo.length;j++) {
				SportSeat sportSeat = new SportSeat(priceIdList.get(j),sportSession.getId(),seatNo[j],seatNo[j]);
				backendService.addSportSeat(sportSeat);
				if(i==0) {seatList.add(sportSeat);}
				
			}
		}
		Map<String, Object> map = new HashMap<> ();
		map.put("event", event);
		map.put("sport", sport);
		map.put("priceList", priceList);
		map.put("sessionList", sessionList);
		map.put("seatList", seatList);
		return map;		
		
	}
	
	@SuppressWarnings("null")
	public Map<String, Object> updateSp(
			Integer eventId,
			Integer typeId, 
			String eventName, 
			String eventLocation, 
			Integer companyId,
			Blob eventImage,
			String imageName,
			Integer status,
			
			Integer sportId,
			String onSaleDate,
			String offSaleDate,
			String description,
			Integer cardId,
			Double discountRatio,
			String[] priceName,
			Integer[] priceCost,
			String[] kickOfTime,
			Integer[] seatNo
			
			) {
		
//		System.out.println("imageName in addSp : "+ imageName);
		Event event = new Event(eventId,typeId, eventName,eventLocation, eventImage, imageName, companyId,status);
		Timestamp onSaleDateT = Timestamp.valueOf(onSaleDate+".00");
		Timestamp offSaleDateT = Timestamp.valueOf(offSaleDate+".00");

		Sport sport = new Sport(sportId,eventId,onSaleDateT, offSaleDateT, description, cardId,discountRatio);
		ArrayList<Price> priceList = new ArrayList<Price>();
		for(int i=0;i<priceName.length;i++) {
			String name = priceName[i];
			Integer cost = priceCost[i];
			Price price = new Price(name,cost);
			priceList.add(price);
			
		}
		
		//Event event,Exhibition exhibition,Attraction attraction,Sport sport,List<Price> priceList
		List<Integer> priceIdList =backendService.updateEvent(event, null, null, sport, priceList);
		ArrayList<SportSession> sessionList = new ArrayList<SportSession>();
		ArrayList<SportSeat> seatList = new ArrayList<SportSeat>();
		for(int i=0;i<kickOfTime.length;i++) {
			Timestamp kickOfTimeT = Timestamp.valueOf(kickOfTime[i]+":00.00");
			SportSession sportSession = new SportSession(kickOfTimeT);
			sessionList.add(sportSession);
			backendService.addSportSession(sport, sportSession);
			for(int j=0;j<seatNo.length;j++) {
				SportSeat sportSeat = new SportSeat(priceIdList.get(j),sportSession.getId(),seatNo[j],seatNo[j]);
				backendService.addSportSeat(sportSeat);
				if(i==0) {seatList.add(sportSeat);}
				
			}
		}
		Map<String, Object> map = new HashMap<> ();
		map.put("event", event);
		map.put("sport", sport);
		map.put("priceList", priceList);
		map.put("sessionList", sessionList);
		map.put("seatList", seatList);
		return map;		
		
	}
	
	@GetMapping(value = "/geteventimage/{id}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer id) {
		String filePath = "/images/NoImage.jpg";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		Event event = backendService.queryOneEvent(id);
		
		if (event != null) {
			
			Blob blob = event.getEventImage();
			filename = event.getImageName();
			if (blob != null) {
				
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		System.out.println("media"+media);
		String mimeType = context.getMimeType(filename); //getMimeType 會抓出副檔名的mimetype  
		System.out.println("--------mimeType"+mimeType);
		System.out.println("123-----filename---"+filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("66666mimeType = "+mimeType+"   mediaType = " + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}
	
	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);  
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
	
//	public boolean checkLogic(
//	String onSaleDate,
//	String offSaleDate,
//	String commDate,
//	String dueDate
//	) {
//
//Timestamp onSaleDateT = Timestamp.valueOf(onSaleDate+".00");
//Timestamp offSaleDateT = Timestamp.valueOf(offSaleDate+".00");
//Timestamp commDateT = Timestamp.valueOf(commDate+" 00:00:00.00");
//Timestamp dueDateT = Timestamp.valueOf(dueDate+" 00:00:00.00");
//
//boolean checktime=false;
//
//if (offSaleDateT.after(onSaleDateT)&&dueDateT.after(commDateT)&&commDateT.after(onSaleDateT)&&dueDateT.after(offSaleDateT)) {
//    checktime=true;
//  } 
//
//return checktime;
//}
	
}
