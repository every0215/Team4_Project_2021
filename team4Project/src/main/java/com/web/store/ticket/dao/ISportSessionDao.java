package com.web.store.ticket.dao;

import java.util.ArrayList;

import com.web.store.ticket.model.SportSession;

public interface ISportSessionDao {
	void addSportSession(SportSession sportSession);
	
	void updateSportSession(SportSession sportSession);
	
	SportSession queryOneSportSession(int id);
	
	ArrayList<SportSession> selectBySport(int sportId);
	
	void delete(int id);
}
