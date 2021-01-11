package com.web.store.ticket.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.web.store.ticket.model.Attraction;
import com.web.store.ticket.model.Event;
import com.web.store.ticket.model.Exhibition;
import com.web.store.ticket.model.Price;
import com.web.store.ticket.model.Sport;
import com.web.store.ticket.model.SportSeat;
import com.web.store.ticket.model.SportSession;
import com.web.store.ticket.service.BackendService;

@Controller
public class EventController {
	@Autowired
	BackendService backendService;
	
	final static String DATE_FORMAT = "yyyy-MM-dd";
	final static String DATETIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
	
	@RequestMapping("/testevents")
	 public String getemps(Map<String, Object> map) {
	  //獲取event集合，存入 map 集合中
		ArrayList<Event> events = backendService.queryAll();
	  map.put("events", events);
	  return "ticket/testshow";
	 }
	
	@GetMapping("/EventDel/{eventId}")
	public String deleteEvent(@PathVariable int eventId) {
		backendService.delete(eventId);
		return "redirect:/TicketIndex";
	}
	
//	@GetMapping("/Event/{eventId}")
	public String showEvent(@PathVariable int eventId) {
		backendService.delete(eventId);
		return "redirect:/TicketIndex";
	}
	
	@GetMapping(value="TicketIndex")
	public String showAllEvent(
			Model model
			) {
		ArrayList<Event> events = backendService.queryAll();
		model.addAttribute("events", events);
		return "TicketIndex";
	}
	
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
		
//		System.out.println(s);
		
		return b;
	}

	@PostMapping(value="/ticket/InputPageEX")
	public String proceedEx(
			RedirectAttributes ra,
			@RequestParam(value="typeId") Integer typeId, 
			@RequestParam(value="eventName") String eventName, 
			@RequestParam(value="eventLocation")String eventLocation, 
		
			@RequestParam(value="companyId")Integer companyId,
			@RequestParam(value="eventImage",required=false)CommonsMultipartFile eventImage,
			@RequestParam(value="onSaleDate")String onSaleDate,
			@RequestParam(value="offSaleDate")String offSaleDate,
			@RequestParam(value="commDate")String commDate,
			@RequestParam(value="dueDate")String dueDate,
			@RequestParam(value="description")String description,
			@RequestParam(value="cardId")Integer cardId,
			@RequestParam(value="discountRatio")Double discountRatio,
			@RequestParam(value="priceName")String[] priceName,
			@RequestParam(value="priceCost")Integer[] priceCost,
			HttpServletResponse response
			) throws IOException {
		String s ="";
		PrintWriter out = response.getWriter();
		byte[] bytes = eventImage.getBytes();

		try {
			Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
			boolean result = checkLogic(onSaleDate,offSaleDate,commDate,dueDate);
			if(result) {
				Map<String, Object> map = addEx(typeId,eventName,eventLocation,companyId,blob,onSaleDate,offSaleDate,commDate,dueDate,description,cardId,discountRatio,priceName,priceCost);		
				ra.addFlashAttribute("event", map.get("event"));
				ra.addFlashAttribute("exhibition", map.get("exhibition"));
				ra.addFlashAttribute("priceList", map.get("priceList"));
				s="redirect:/ticket/ShowPageEX";
			}else {
				out.print("<script language=\"javascript\">alert('票券時間錯誤 請檢查起始/結束日期是否有誤')</script>");    
	            //弹窗提示并跳转到其他页面
				s="/login";
				
			}
		} catch (SerialException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		return "redirect:/ticket/ShowPageEX";
		return s;
	}
	
	
	@PostMapping(value="/ticket/InputPageAT")
	public String proceedAt(
			RedirectAttributes ra,
			@RequestParam(value="typeId") Integer typeId, 
			@RequestParam(value="eventName") String eventName, 
			@RequestParam(value="eventLocation")String eventLocation, 
		
			@RequestParam(value="companyId")Integer companyId,
			@RequestParam(value="eventImage",required=false)CommonsMultipartFile eventImage,
			@RequestParam(value="onSaleDate")String onSaleDate,
			@RequestParam(value="offSaleDate")String offSaleDate,
			@RequestParam(value="commDate")String commDate,
			@RequestParam(value="dueDate")String dueDate,
			@RequestParam(value="description")String description,
			@RequestParam(value="priceName")String[] priceName,
			@RequestParam(value="priceCost")Integer[] priceCost
			) {
		byte[] bytes = eventImage.getBytes();

		try {
			Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
			boolean result = checkLogic(onSaleDate,offSaleDate,commDate,dueDate);
			if(result) {
				Map<String, Object> map = addAt(typeId,eventName,eventLocation,companyId,blob,onSaleDate,offSaleDate,commDate,dueDate,description,priceName,priceCost);		
				ra.addFlashAttribute("event", map.get("event"));
				ra.addFlashAttribute("attraction", map.get("attraction"));
				ra.addFlashAttribute("priceList", map.get("priceList"));
			}else {
				
			}
		} catch (SerialException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		return "redirect:/ticket/ShowPageAT";
	}
	
	@PostMapping(value="/ticket/InputPageSP")
	public String proceedSp(
			RedirectAttributes ra,
			@RequestParam(value="typeId") Integer typeId, 
			@RequestParam(value="eventName") String eventName, 
			@RequestParam(value="eventLocation")String eventLocation, 
		
			@RequestParam(value="companyId")Integer companyId,
			@RequestParam(value="eventImage",required=false)CommonsMultipartFile eventImage,
			@RequestParam(value="onSaleDate")String onSaleDate,
			@RequestParam(value="offSaleDate")String offSaleDate,
			
			@RequestParam(value="description")String description,
			@RequestParam(value="cardId")Integer cardId,
			@RequestParam(value="discountRatio")Double discountRatio,
			@RequestParam(value="priceName")String[] priceName,
			@RequestParam(value="priceCost")Integer[] priceCost,
			@RequestParam(value="kickOfTime")String[] kickOfTime,
			@RequestParam(value="seatNo")Integer[] seatNo
			) {
		byte[] bytes = eventImage.getBytes();

		try {
			Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
			
			
				Map<String, Object> map = addSp(typeId,eventName,eventLocation,companyId,blob,onSaleDate,offSaleDate,description,cardId,discountRatio,priceName,priceCost,kickOfTime,seatNo);		
				ra.addFlashAttribute("event", map.get("event"));
				ra.addFlashAttribute("sport", map.get("sport"));
				ra.addFlashAttribute("priceList", map.get("priceList"));
				ra.addFlashAttribute("sessionList", map.get("sessionList"));
				ra.addFlashAttribute("seatList", map.get("seatList"));
			
		} catch (SerialException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/ticket/ShowPageSP";
	}
	
	public boolean checkLogic(
			String onSaleDate,
			String offSaleDate,
			String commDate,
			String dueDate
			) {
		
		Timestamp onSaleDateT = Timestamp.valueOf(onSaleDate+".00");
		Timestamp offSaleDateT = Timestamp.valueOf(offSaleDate+".00");
		Timestamp commDateT = Timestamp.valueOf(commDate+" 00:00:00.00");
		Timestamp dueDateT = Timestamp.valueOf(dueDate+" 00:00:00.00");
		
		boolean checktime=false;
		
		if (offSaleDateT.after(onSaleDateT)&&dueDateT.after(commDateT)&&commDateT.after(onSaleDateT)&&dueDateT.after(offSaleDateT)) {
		    checktime=true;
		  } 
		
		return checktime;
	}
	
	@SuppressWarnings("null")
	public Map<String, Object> addEx(
			
			Integer typeId, 
			String eventName, 
			String eventLocation, 
		
			Integer companyId,
			Blob eventImage,
			String onSaleDate,
			String offSaleDate,
			String commDate,
			String dueDate,
			String description,
			Integer cardId,
			Double discountRatio,
			String[] priceName,
			Integer[] priceCost) {
		Event event = new Event(typeId, eventName,eventLocation, eventImage, companyId);
		
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
	public Map<String, Object> addAt(
			Integer typeId, 
			String eventName, 
			String eventLocation, 
			
			Integer companyId,
			Blob eventImage,
			String onSaleDate,
			String offSaleDate,
			String commDate,
			String dueDate,
			String description,

			String[] priceName,
			Integer[] priceCost) {
		Event event = new Event(typeId, eventName,eventLocation, eventImage,companyId);
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
	public Map<String, Object> addSp(
			Integer typeId, 
			String eventName, 
			String eventLocation, 
			
			Integer companyId,
			Blob eventImage,
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
		Event event = new Event(typeId, eventName,eventLocation, eventImage, companyId);
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
				SportSeat sportSeat = new SportSeat(priceIdList.get(i),sportSession.getId(),seatNo[j]);
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
	
	
	
}
