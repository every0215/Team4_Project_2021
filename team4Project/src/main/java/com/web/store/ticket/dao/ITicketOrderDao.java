package com.web.store.ticket.dao;

import java.util.ArrayList;

import com.web.store.ticket.model.TicketOrder;

public interface ITicketOrderDao {
	
	TicketOrder addTicketOrder(TicketOrder ticketOrder);
	
	TicketOrder updateTicketOrder(TicketOrder ticketOrder);
	
	void delete(String id);
	
	ArrayList<TicketOrder> queryTicketOrderByMemberId(Integer memberId);
	
	TicketOrder queryTicketOrderbyId(String ticketOrderId);
	
	TicketOrder queryTicketOrderbyshortId(String shortId);
	
	
}
