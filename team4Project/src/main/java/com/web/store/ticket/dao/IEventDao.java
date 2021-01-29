package com.web.store.ticket.dao;

import java.util.ArrayList;
import java.util.List;

import com.web.store.product.model.Product;
import com.web.store.ticket.model.Event;

public interface IEventDao {
	
	void addEvent(Event event);
	
	void updateEvent(Event event);
	
	Event queryOneEvent(int id);
	
	Event queryLatestEvent();
	
	ArrayList<Event> queryAll(int companyId);
	
	ArrayList<Event> queryStatusOKAll(int companyId);
	
	ArrayList<Event> queryByTypeId(int typeId);
	
	ArrayList<Event> queryStatusOKByTypeId(int typeId);
	
	void delete(int id);
	
	void updateStatusEvent(int eventId);
	
	List<Event> selectbyName(String EventName);
}
