package com.web.store.ticket.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.store.company.dao.impl.CompanyDaoImpl;
import com.web.store.company.model.Company;
import com.web.store.ticket.dao.impl.AttractionDao;
import com.web.store.ticket.dao.impl.BankDao;
import com.web.store.ticket.dao.impl.CreditCardDao;
import com.web.store.ticket.dao.impl.EventDao;
import com.web.store.ticket.dao.impl.EventTypeDao;
import com.web.store.ticket.dao.impl.ExhibitionDao;
import com.web.store.ticket.dao.impl.PriceDao;
import com.web.store.ticket.dao.impl.SportDao;
import com.web.store.ticket.dao.impl.SportSeatDao;
import com.web.store.ticket.dao.impl.SportSessionDao;
import com.web.store.ticket.dao.impl.TicketOnWayDao;
import com.web.store.ticket.dao.impl.TicketOrderDao;
import com.web.store.ticket.dao.impl.TicketOrderDetailDao;
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
import com.web.store.ticket.service.BackendService;

@Transactional
@Service
public class BackendServiceImpl implements BackendService {
	
	@Autowired
	EventDao eventDao;
	@Autowired
	AttractionDao attractionDao;
	@Autowired
	ExhibitionDao exhibitionDao;
	@Autowired
	SportDao sportDao;
	@Autowired
	PriceDao priceDao;
	@Autowired
	SportSessionDao sportSessionDao;
	@Autowired
	SportSeatDao sportSeatDao;
	@Autowired
	CreditCardDao creditCardDao;
	@Autowired
	EventTypeDao eventTypeDao;
	@Autowired
	BankDao bankDao;
	@Autowired
	CompanyDaoImpl companyDao;
	@Autowired
	TicketOrderDao ticketOrderDao;
	@Autowired
	TicketOrderDetailDao ticketOrderDetailDao;
	@Autowired
	TicketOnWayDao ticketOnWayDao;
	
	
	@SuppressWarnings("null")
	@Override
	public ArrayList<Integer> addEvent(Event event,Exhibition exhibition,Attraction attraction,Sport sport, ArrayList<Price> priceList) {
		ArrayList<Integer> priceIdList =new ArrayList<Integer>();
		eventDao.addEvent(event);
		int eventId = eventDao.queryLatestEvent().getId();
		for(Price price:priceList) {
			price.setEventId(eventId);
			priceDao.addPrice(price);
			System.out.println(price.getId());
			priceIdList.add(price.getId());
		}
		int typeId=event.getTypeId();
		if(typeId==1) {
			exhibition.setEventId(eventId);
			exhibitionDao.addExhibition(exhibition);
			
		}else if(typeId==2) {
			attraction.setEventId(eventId);
			attractionDao.addAttraction(attraction);
		}else if(typeId==3) {
			sport.setEventId(eventId);
			sportDao.addSport(sport);
		}
		return priceIdList;
	}

	@Override
	public ArrayList<Integer> updateEvent(Event event,Exhibition exhibition,Attraction attraction,Sport sport, List<Price> priceList) {
		ArrayList<Integer> priceIdList =new ArrayList<Integer>();
		eventDao.updateEvent(event);
		int typeId=event.getTypeId();
		int eventId=event.getId();
		List<Price> oldPriceList = priceDao.select(eventId);
		for(Price price:oldPriceList) {
			priceDao.delete(price.getId());
		}
		
		for(Price price:priceList) {
			price.setEventId(eventId);
			priceDao.addPrice(price);
			priceIdList.add(price.getId());
		}
		if(typeId==1) {
			exhibitionDao.updateExhibition(exhibition);
		}else if(typeId==2) {
			attractionDao.updateAttraction(attraction);
		}else if(typeId==3) {
			sportDao.updateSport(sport);
		}
		return priceIdList;
	}
	
	public ArrayList<Event> getEventsBytypeId(int typeId){
		return eventDao.queryByTypeId(typeId);
	}

	@Override
	public Event queryOneEvent(int id) {
		return eventDao.queryOneEvent(id);
	}

	@Override
	public ArrayList<Event> queryAll(int companyId) {
		return eventDao.queryAll(companyId);
	}

	@Override
	public void delete(int id) {//此為eventId
		int typeId = eventDao.queryOneEvent(id).getTypeId();
		List<Price> priceList = priceDao.select(id);
		
		if(typeId!=3) {
			for(Price price:priceList) {
			priceDao.delete(price.getId());
			}
		}
		
		if(typeId == 1) {
			Exhibition exhibition = exhibitionDao.selectByEvent(id);
			
			exhibitionDao.delete(exhibition.getId());	
		}else if(typeId == 2) {
			Attraction attraction = attractionDao.selectByEvent(id);

			attractionDao.delete(attraction.getId());
		}else if(typeId ==3 ) {
			Sport sport = sportDao.selectByEvent(id);
			ArrayList<SportSession> sportSessions = sportSessionDao.selectBySport(sport.getId());
			for(SportSession sportsession : sportSessions) {
				ArrayList<SportSeat> sportSeats = sportSeatDao.selectBySession(sportsession.getId());
				for(SportSeat sportseat : sportSeats) {
					sportSeatDao.delete(sportseat.getId());
				}
				sportSessionDao.delete(sportsession.getId());
			}
			
			for(Price price:priceList) {
				priceDao.delete(price.getId());
				}
			sportDao.delete(sport.getId());
			
		}
		eventDao.delete(id);

	}

	

	@Override
	public void updateAttraction(Attraction attraction) {
		attractionDao.updateAttraction(attraction);

	}

	@Override
	public Attraction queryOneAttraction(int id) {
		return attractionDao.queryOneAttraction(id);
	}

	@Override
	public Attraction selectAttractionByEvent(int eventId) {
		return attractionDao.selectByEvent(eventId);
	}

	

	@Override
	public void updateExhibition(Exhibition exhibition) {
		exhibitionDao.updateExhibition(exhibition);

	}

	@Override
	public Exhibition queryOneExhibition(int id) {
		return exhibitionDao.queryOneExhibition(id);
	}

	@Override
	public Exhibition selectExhibitionByEvent(int eventId) {
		return exhibitionDao.selectByEvent(eventId);
	}

	@Override
	public void addPrice(Price price) {
		int eventId = eventDao.queryLatestEvent().getId();
		price.setEventId(eventId);
		priceDao.addPrice(price);
	}

	@Override
	public List<Price> selectPriceList(int eventId) {
		return priceDao.select(eventId);
	}

	@Override
	public void deletePriceList(int eventId) {
		List<Price> priceList = priceDao.select(eventId);
		for(Price price:priceList) {
			priceDao.delete(price.getId());
		}
	}

	@Override
	public void addSportSession(Sport sport,SportSession sportSession) {
		sportSession.setSportId(sport.getId());
		sportSessionDao.addSportSession(sportSession);
		
	}

	@Override
	public ArrayList<SportSession> selectBySport(int sportId) {
		return sportSessionDao.selectBySport(sportId);		
	}

	@Override
	public void addSportSeat(SportSeat sportSeat) {
		sportSeatDao.addSportSeat(sportSeat);
		
	}

	@Override
	public void add(Event event) {
		eventDao.addEvent(event);
	}

	@Override
	public Sport selectSportByEvent(int eventId) {
		return sportDao.selectByEvent(eventId);
	}

	@Override
	public List<SportSeat> selectSportSeatBySession(int sessionId) {
		return sportSeatDao.selectBySession(sessionId);
	}

	@Override
	public CreditCard queryCreditCard(int creditCardId) {
		return creditCardDao.queryCreditCard(creditCardId);
	}

	@Override
	public EventType queryEventType(int eventTypeId) {
		return eventTypeDao.queryEventType(eventTypeId);
	}

	@Override
	public void deleteSessionList(int sportId) {
		ArrayList<SportSession> sessionList = sportSessionDao.selectBySport(sportId);
		for(SportSession session:sessionList) {
			sportSessionDao.delete(session.getId());
		}
	}

	@Override
	public void deleteSeatList(int sessionId) {
		ArrayList<SportSeat> seatList = sportSeatDao.selectBySession(sessionId);
		for(SportSeat seat: seatList) {
			sportSeatDao.delete(seat.getId());
		}
		
	}

	@Override
	public ArrayList<Bank> queryAllBank() {
		ArrayList<Bank> bankList = bankDao.queryAllBank();
		 ArrayList<Bank> creditCardList = new ArrayList<>();
		for(Bank bank:bankList) {
			Integer bankId = bank.getId();
			
			ArrayList<CreditCard> creditCardListbyBank = creditCardDao.queryCreditCardByBank(bankId);
			bank.setCards(creditCardListbyBank);
			creditCardList.add(bank);
		}
		return creditCardList;
	}

	@Override
	public Company queryCompany(int companyId) {
		Company company = companyDao.getCompanyById(companyId);
		return company;
	}

	@Override
	public List<Price> selectPriceListBySessionId(int sessionId) {
		ArrayList<SportSeat> seatList = sportSeatDao.selectBySession(sessionId);
		List<Price> priceList = new ArrayList<>();
		for(SportSeat seat:seatList) {
			Integer priceId = seat.getPriceId();
			Price price = priceDao.queryPrice(priceId);
			priceList.add(price);
		}
		return priceList;
	}

	@Override
	public ArrayList<TicketOrder> queryTicketOrderByMemberId(int memberId) {
		ArrayList<TicketOrder> ticketOrderList = ticketOrderDao.queryTicketOrderByMemberId(memberId);
		return ticketOrderList;
	}

	@Override
	public TicketOrder addTicketOrder(TicketOrder ticketOrder) {
		ticketOrderDao.addTicketOrder(ticketOrder);
		return ticketOrder;
		
	}

	@Override
	public TicketOrder updateTicketOrder(TicketOrder ticketOrder) {
		ticketOrderDao.updateTicketOrder(ticketOrder);
		return ticketOrder;
		
	}

	@Override
	public void deleteTicketOrder(int ticketOrderId) {
		ticketOrderDao.delete(ticketOrderId);
		
	}

	@Override
	public TicketOnWay addTicketOnWay(TicketOnWay ticketOnWay) {
		ticketOnWayDao.addTicketOnWay(ticketOnWay);
		return ticketOnWay;
	}

	@Override
	public TicketOnWay updateTicketOnWay(TicketOnWay ticketOnWay) {
		ticketOnWayDao.updateTicketOnWay(ticketOnWay);
		return ticketOnWay;
	}

	@Override
	public void deleteTicketOnWay(int ticketOnWayId) {
		ticketOnWayDao.delete(ticketOnWayId);
		
	}

	@Override
	public TicketOrderDetail addTicketOrderDetail(TicketOrderDetail ticketOrderDetail) {
		ticketOrderDetailDao.addTicketOrderDetail(ticketOrderDetail);
		return ticketOrderDetail;
	}

	@Override
	public TicketOrderDetail updateTicketOrderDetail(TicketOrderDetail ticketOrderDetail) {
		ticketOrderDetailDao.updateTicketOrderDetail(ticketOrderDetail);
		return ticketOrderDetail;
	}

	@Override
	public void deleteTicketOrderDetail(int ticketOrderDetailId) {
		ticketOrderDetailDao.delete(ticketOrderDetailId);
		
	}

	@Override
	public SportSeat updateSeatStock(SportSeat sportSeat) {
		sportSeatDao.updateSportSeat(sportSeat);
		return sportSeat;
	}

	@Override
	public SportSeat queryOneSportSeat(Integer seatId) {
		SportSeat seat = sportSeatDao.queryOneSportSeat(seatId);
		return seat;
	}

	@Override
	public void updateStatusEvent(int eventId) {
		eventDao.updateStatusEvent(eventId);
		
	}

	@Override
	public ArrayList<Event> queryStatusOKByTypeId(int typeId) {
		return eventDao.queryStatusOKByTypeId(typeId);
		
	}

	@Override
	public ArrayList<Event> queryStatusOKAll(int companyId) {
		return eventDao.queryStatusOKAll(companyId);
	}

	@Override
	public List<Event> selectbyName(String eventName) {
		return eventDao.selectbyName(eventName);
	}

	@Override
	public SportSession queryOneSportSession(Integer sessionId) {
		SportSession sportSession = sportSessionDao.queryOneSportSession(sessionId);
		return sportSession;
	}

	@Override
	public TicketOrder queryTicketOrderbyId(String ticketOrderId) {
		TicketOrder ticketOrder = ticketOrderDao.queryTicketOrderbyId(ticketOrderId);
		return ticketOrder;
	}

	@Override
	public TicketOrder queryTicketOrderDetailByTicketOrder(TicketOrder ticketOrder) {
		TicketOrder ticketOrderN = ticketOrderDao.queryTicketOrderbyId(ticketOrder.getId());
		Set<TicketOrderDetail> ticketOrderDetails = ticketOrderN.getTicketOrderDetails();
		Hibernate.initialize(ticketOrderDetails);
		return ticketOrderN;
	}

	@Override
	public TicketOrder queryTicketOnWayByTicketOrder(TicketOrder ticketOrder) {
		TicketOrder ticketOrderN = ticketOrderDao.queryTicketOrderbyId(ticketOrder.getId());
		Set<TicketOnWay> ticketOnWays = ticketOrderN.getTicketOnWays();
		Hibernate.initialize(ticketOnWays);
		return ticketOrderN;
	}
	
	
	
	

}
