package com.web.store.ticket.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.ticket.dao.IEventDao;
import com.web.store.ticket.model.Event;

@Repository
public class EventDao implements IEventDao {
	
	@Autowired
	SessionFactory factory;

	@Override
	public void addEvent(Event event) {
		Session session = factory.getCurrentSession();
			session.save(event);

	}

	@Override
	public void updateEvent(Event event) {
		Session session = factory.getCurrentSession();
		session.update(event);
	}

	@Override
	public Event queryOneEvent(int id) {
		Session session = factory.getCurrentSession();
		return session.get(Event.class, id);
	}

	@Override
	public Event queryLatestEvent() {
		Session session = factory.getCurrentSession();
		String hqlstr="FROM Event E ORDER BY E.id DESC";
		Query<Event> query = session.createQuery(hqlstr,Event.class);
		query.setMaxResults(1);
		List<Event> resultList = query.list();
		Event result = resultList.get(0);
		return result;
	}

	@Override
	public ArrayList<Event> queryAll(int companyId) {
		Session session = factory.getCurrentSession();
		String hqlstr = "FROM Event E where E.companyId="+companyId;
		Query<Event> query = session.createQuery(hqlstr,Event.class);
		return (ArrayList<Event>) query.list();
	}
	
	@Override
	public ArrayList<Event> queryStatusOKAll(int companyId) {
		Session session = factory.getCurrentSession();
		String hqlstr = "FROM Event E where E.status=1 and E.companyId="+companyId;
		Query<Event> query = session.createQuery(hqlstr,Event.class);
		return (ArrayList<Event>) query.list();
	}
	
	@Override
	public ArrayList<Event> queryByTypeId(int typeId){
		Session session = factory.getCurrentSession();
		String hqlstr="FROM Event E where E.typeId="+typeId;
		Query<Event> query = session.createQuery(hqlstr,Event.class);
		return (ArrayList<Event>) query.list();
	}

	@Override
	public void delete(int id) {
		Session session = factory.getCurrentSession();
		Event event = session.get(Event.class, id);
		if(event!=null) {
			session.delete(event);
		}

	}

	@Override
	public ArrayList<Event> queryStatusOKByTypeId(int typeId) {
		Session session = factory.getCurrentSession();
		String hqlstr="FROM Event E where E.status=1 and E.typeId="+typeId;
		Query<Event> query = session.createQuery(hqlstr,Event.class);
		return (ArrayList<Event>) query.list();
	}

	@Override
	public void updateStatusEvent(int eventId) {
		Session session = factory.getCurrentSession();
		Event event = session.get(Event.class, eventId);
		if(event.getStatus()==0) {
			event.setStatus(1);
		}else {
			event.setStatus(0);
		}		
		session.update(event);
		
	}

	@Override
	public List<Event> selectbyName(String EventName) {
		Session session = factory.getCurrentSession();
		String hqlstr = "from Event E where E.status=1 and E.eventName like :eventName  ";
		Query<Event> queryObj = session.createQuery(hqlstr,Event.class);
		queryObj.setParameter("eventName", '%'+EventName+'%');		
		return queryObj.list();	
	}

	@Override
	public ArrayList<Event> query() {
		Session session = factory.getCurrentSession();
		String hqlstr = "FROM Event";
		Query<Event> query = session.createQuery(hqlstr,Event.class);
		return (ArrayList<Event>) query.list();
	}


}
