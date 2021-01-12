package com.web.store.ticket.dao;

import java.util.ArrayList;

import com.web.store.ticket.model.SportSeat;

public interface ISportSeatDao {
	void addSportSeat(SportSeat sportSeat);
	
	void updateSportSeat(SportSeat sportSeat);
	
	SportSeat queryOneSportSeat(int id);
	
	ArrayList<SportSeat> selectBySession(int sportSessionId);
	
	void delete(int id);
}
