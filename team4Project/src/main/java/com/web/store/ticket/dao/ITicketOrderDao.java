package com.web.store.ticket.dao;

import java.util.ArrayList;

import com.web.store.ticket.model.TicketOrder;

public interface ITicketOrderDao {
	
	TicketOrder addTicketOrder(TicketOrder ticketOrder);
	
	TicketOrder updateTicketOrder(TicketOrder ticketOrder);
	
	void delete(int id);
	
	ArrayList<TicketOrder> queryTicketOrderByMemberId(Integer memberId);
	
	TicketOrder queryTicketOrderbyId(String ticketOrderId);
	
	
}
