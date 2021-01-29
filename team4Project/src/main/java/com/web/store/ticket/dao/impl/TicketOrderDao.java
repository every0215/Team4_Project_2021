package com.web.store.ticket.dao.impl;

import java.util.ArrayList;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.ticket.dao.ITicketOrderDao;
import com.web.store.ticket.model.Event;
import com.web.store.ticket.model.TicketOnWay;
import com.web.store.ticket.model.TicketOrder;

@Repository
public class TicketOrderDao implements ITicketOrderDao {
	
	@Autowired
	SessionFactory factory;
	
	@Override
	public TicketOrder addTicketOrder(TicketOrder ticketOrder) {
		Session session = factory.getCurrentSession();
		session.save(ticketOrder);
		return ticketOrder;

	}

	@Override
	public TicketOrder updateTicketOrder(TicketOrder ticketOrder) {
		Session session = factory.getCurrentSession();
		session.update(ticketOrder);
		return ticketOrder;
	}

	@Override
	public void delete(String id) {
		Session session = factory.getCurrentSession();
		TicketOrder ticketOrder = session.get(TicketOrder.class, id);
		if(ticketOrder!=null) {
			session.delete(ticketOrder);
		}

	}

	@Override //會員查詢我的訂單時 可以用
	public ArrayList<TicketOrder> queryTicketOrderByMemberId(Integer memberId) {
		Session session = factory.getCurrentSession();
		String hqlstr="FROM TicketOrder T where T.memberId="+memberId;
		Query<TicketOrder> query = session.createQuery(hqlstr,TicketOrder.class);
		return (ArrayList<TicketOrder>) query.list();
	}

	@Override
	public TicketOrder queryTicketOrderbyId(String ticketOrderId) {
		Session session = factory.getCurrentSession();
		TicketOrder ticketOrder = session.get(TicketOrder.class, ticketOrderId);
		return ticketOrder;
	}

	

}
