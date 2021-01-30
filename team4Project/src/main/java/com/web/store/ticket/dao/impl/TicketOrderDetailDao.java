package com.web.store.ticket.dao.impl;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.ticket.dao.ITicketOrderDetailDao;
import com.web.store.ticket.model.TicketOrder;
import com.web.store.ticket.model.TicketOrderDetail;

@Repository
public class TicketOrderDetailDao implements ITicketOrderDetailDao {
	
	@Autowired
	SessionFactory factory;
	
	@Override
	public TicketOrderDetail addTicketOrderDetail(TicketOrderDetail ticketOrderDetail) {
		Session session = factory.getCurrentSession();
		session.save(ticketOrderDetail);
		return ticketOrderDetail;
	}

	@Override
	public TicketOrderDetail updateTicketOrderDetail(TicketOrderDetail ticketOrderDetail) {
		Session session = factory.getCurrentSession();
		session.update(ticketOrderDetail);
		return ticketOrderDetail;
	}

	@Override
	public void delete(int id) {
		Session session = factory.getCurrentSession();
		TicketOrderDetail ticketOrderDetail = session.get(TicketOrderDetail.class, id);
		if(ticketOrderDetail!=null) {
			session.delete(ticketOrderDetail);
		}
	}

	@Override
	public ArrayList<TicketOrderDetail> queryTicketOrderDetailByOrderId(TicketOrder ticketOrder) {
		Session session = factory.getCurrentSession();
		String hqlstr="FROM TicketOrderDetail T where T.ticketOrder="+ticketOrder;
		Query<TicketOrderDetail> query = session.createQuery(hqlstr,TicketOrderDetail.class);
		return (ArrayList<TicketOrderDetail>) query.list();
	}

}
