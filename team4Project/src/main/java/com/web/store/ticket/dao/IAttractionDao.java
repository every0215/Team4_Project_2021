package com.web.store.ticket.dao;

import java.util.ArrayList;

import com.web.store.ticket.model.Attraction;

public interface IAttractionDao {
	void addAttraction(Attraction attraction);
	
	void updateAttraction(Attraction attraction);
	
	Attraction queryOneAttraction(int id);
	
	ArrayList<Attraction> queryAttractions();
	
	Attraction selectByEvent(int eventId);
	
	void delete(int id);
}
