package com.web.store.ticket.dao;

import com.web.store.ticket.model.Exhibition;

public interface IExhibitionDao {
	
	void addExhibition(Exhibition exhibition);
	
	void updateExhibition(Exhibition exhibition);
	
	Exhibition queryOneExhibition(int id);
	
	Exhibition selectByEvent(int eventId);
	
	void delete(int id);
}
