package com.web.store.ticket.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.web.store.company.model.Company;
import com.web.store.product.model.Product;
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
import com.web.store.ticket.model.TicketOnWay;
import com.web.store.ticket.model.TicketOrder;
import com.web.store.ticket.model.TicketOrderDetail;

public interface BackendService {
	
	public ArrayList<Integer> addEvent(Event event,Exhibition exhibition,Attraction attraction,Sport sport, ArrayList<Price> priceList);
	public ArrayList<Integer> updateEvent(Event event,Exhibition exhibition,Attraction attraction,Sport sport, List<Price> priceList);
	public Event queryOneEvent(int id);
	public ArrayList<Event> getEventsBytypeId(int typeId);
	public ArrayList<Event> queryStatusOKByTypeId(int typeId);
	public ArrayList<Event> queryAll(int companyId);
	public ArrayList<Event> queryStatusOKAll(int companyId);
	public void delete(int id);
//	public void addAttraction(Attraction attraction);
	public void updateAttraction(Attraction attraction);
	public Attraction queryOneAttraction(int id);
	public Attraction selectAttractionByEvent(int eventId);
//	public void addExhibition(Exhibition exhibition);
	public void updateExhibition(Exhibition exhibition);
	public Exhibition queryOneExhibition(int id);
	public Exhibition selectExhibitionByEvent(int eventId);
	public void addPrice(Price price);
	public List<Price> selectPriceList(int eventId);
	public List<Price> selectPriceListBySessionId(int sessionId);
	public void deletePriceList(int eventId);
	public Sport selectSportByEvent(int eventId);
	public void addSportSession(Sport sport,SportSession sportSession);
	public ArrayList<SportSession> selectBySport(int sportId);
	public void addSportSeat(SportSeat sportSeat);
	public List<SportSeat> selectSportSeatBySession(int sessionId);
	public void add(Event bean);
	public CreditCard queryCreditCard(int creditCardId);
	public EventType queryEventType(int eventTypeId);
	public Company queryCompany(int companyId);
	public void deleteSessionList(int sportId);
	public void deleteSeatList(int sessionId);
	public ArrayList<Bank> queryAllBank();
	public ArrayList<TicketOrder> queryTicketOrderByMemberId(int memberId);
	public TicketOrder addTicketOrder(TicketOrder ticketOrder);
	public TicketOrder updateTicketOrder(TicketOrder ticketOrder);
	public void deleteTicketOrder(String ticketOrderId);
	
	public TicketOnWay addTicketOnWay(TicketOnWay ticketOnWay);
	public TicketOnWay updateTicketOnWay(TicketOnWay ticketOnWay);
	public void deleteTicketOnWay(int ticketOnWayId);
	
	public TicketOrderDetail addTicketOrderDetail(TicketOrderDetail ticketOrderDetail);
	public TicketOrderDetail updateTicketOrderDetail(TicketOrderDetail ticketOrderDetail);
	public void deleteTicketOrderDetail(int ticketOrderDetailId);
	public SportSeat queryOneSportSeat(Integer seatId);
	public SportSeat updateSeatStock(SportSeat sportSeat);
	
	public void updateStatusEvent(int eventId);
	public List<Event> selectbyName(String eventName);
	public SportSession queryOneSportSession(Integer sessionId);
	
	public TicketOrder queryTicketOrderbyId(String ticketOrderId);
	
	public TicketOrder queryTicketOrderDetailByTicketOrder(TicketOrder ticketOrder);
	public TicketOrder queryTicketOnWayByTicketOrder(TicketOrder ticketOrder);
	
	public void checkTicketOnWay();
	
}
