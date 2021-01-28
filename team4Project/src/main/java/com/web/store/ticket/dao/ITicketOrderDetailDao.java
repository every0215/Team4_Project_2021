package com.web.store.ticket.dao;

import java.util.ArrayList;

import com.web.store.ticket.model.TicketOrder;
import com.web.store.ticket.model.TicketOrderDetail;

public interface ITicketOrderDetailDao {
	
	
	TicketOrderDetail addTicketOrderDetail(TicketOrderDetail ticketOrderDetail);
	
	TicketOrderDetail updateTicketOrderDetail(TicketOrderDetail ticketOrderDetail);
	
	void delete(int id);
	
	ArrayList<TicketOrderDetail> queryTicketOrderDetailByOrderId(TicketOrder ticketOrder);
}
