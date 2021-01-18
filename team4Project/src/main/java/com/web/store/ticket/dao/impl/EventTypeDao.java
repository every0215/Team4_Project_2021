package com.web.store.ticket.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.ticket.dao.IEventTypeDao;
import com.web.store.ticket.model.EventType;

@Repository
public class EventTypeDao implements IEventTypeDao {
	
	@Autowired
	SessionFactory factory;
	
	@Override
	public EventType queryEventType(int eventTypeId) {
		Session session = factory.getCurrentSession();
		EventType eventType = session.get(EventType.class, eventTypeId);
		return eventType;
	}

}
