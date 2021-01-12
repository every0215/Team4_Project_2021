package com.web.store.ticket.dao;

import java.util.ArrayList;

import com.web.store.ticket.model.Event;

public interface IEventDao {
	
	void addEvent(Event event);
	
	void updateEvent(Event event);
	
	Event queryOneEvent(int id);
	
	Event queryLatestEvent();
	
	ArrayList<Event> queryAll();
	
	ArrayList<Event> queryByTypeId(int typeId);
	
	void delete(int id);
}
