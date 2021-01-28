package com.web.store.ticket.dao;

import java.util.ArrayList;

import com.web.store.ticket.model.TicketOnWay;
import com.web.store.ticket.model.TicketOrder;

public interface ITicketOnWayDao {
	
	TicketOnWay addTicketOnWay(TicketOnWay ticketOnWay);
	
	TicketOnWay updateTicketOnWay(TicketOnWay ticketOnWay);
	
	void delete(int id);
	
	ArrayList<TicketOnWay> queryTicketOnWayByOrderId(TicketOrder ticketOrder);
	
}
