package com.web.store.ticket.dao;

import java.util.ArrayList;

import com.web.store.ticket.model.Sport;

public interface ISportDao {
	
	void addSport(Sport sport);
	
	void updateSport(Sport sport);
	
	Sport queryOneAttraction(int id);
	
	ArrayList<Sport> querySports();
	
	Sport selectByEvent(int eventId);
	
	void delete(int id);
}
