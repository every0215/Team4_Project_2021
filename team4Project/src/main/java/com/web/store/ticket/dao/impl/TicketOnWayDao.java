package com.web.store.ticket.dao.impl;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.ticket.dao.ITicketOnWayDao;
import com.web.store.ticket.model.TicketOnWay;
import com.web.store.ticket.model.TicketOrder;

@Repository
public class TicketOnWayDao implements ITicketOnWayDao {
	
	@Autowired
	SessionFactory factory;
	
	@Override
	public TicketOnWay addTicketOnWay(TicketOnWay ticketOnWay) {
		Session session = factory.getCurrentSession();
		session.save(ticketOnWay);
		return ticketOnWay;
	}

	@Override
	public TicketOnWay updateTicketOnWay(TicketOnWay ticketOnWay) {
		Session session = factory.getCurrentSession();
		session.update(ticketOnWay);
		return ticketOnWay;
	}

	@Override
	public void delete(int id) {
		Session session = factory.getCurrentSession();
		TicketOnWay ticketOnWay = session.get(TicketOnWay.class, id);
		if(ticketOnWay!=null) {
			session.delete(ticketOnWay);
		}
	}

	@Override
	public ArrayList<TicketOnWay> queryTicketOnWayByOrderId(TicketOrder ticketOrder) {
		Session session = factory.getCurrentSession();
		String hqlstr="FROM TicketOnWay T where T.ticketOrder="+ticketOrder;
		Query<TicketOnWay> query = session.createQuery(hqlstr,TicketOnWay.class);
		return (ArrayList<TicketOnWay>) query.list();
	}

	@Override
	public ArrayList<TicketOnWay> queryAll() {
		Session session = factory.getCurrentSession();
		String hqlstr="FROM TicketOnWay";
		Query<TicketOnWay> query = session.createQuery(hqlstr,TicketOnWay.class);
		return (ArrayList<TicketOnWay>) query.list();
	}

	@Override
	public ArrayList<TicketOnWay> queryTicketOrder(TicketOnWay ticketOnWay) {
		Session session = factory.getCurrentSession();
		String hqlstr = "FROM TicketOnWay T where T.ticketOrder="+ticketOnWay.getTicketOrder();
		Query<TicketOnWay> query = session.createQuery(hqlstr,TicketOnWay.class);
		return (ArrayList<TicketOnWay>) query.list();
	}

}
