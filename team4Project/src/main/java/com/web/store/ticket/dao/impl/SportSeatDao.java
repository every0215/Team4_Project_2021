package com.web.store.ticket.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.ticket.dao.ISportSeatDao;
import com.web.store.ticket.model.SportSeat;

@Repository
public class SportSeatDao implements ISportSeatDao {
	
	@Autowired
	SessionFactory factory;
	
	@Override
	public void addSportSeat(SportSeat sportSeat) {
		Session session = factory.getCurrentSession();
		session.save(sportSeat);
			
	}

	@Override
	public void updateSportSeat(SportSeat sportSeat) {
		Session session = factory.getCurrentSession();
		session.update(sportSeat);
	}

	@Override
	public SportSeat queryOneSportSeat(int id) {
		Session session = factory.getCurrentSession();
		return session.get(SportSeat.class, id);
	}

	@Override
	public ArrayList<SportSeat> selectBySession(int sportSessionId) {
		Session session = factory.getCurrentSession();
		String hqlstr = "FROM SportSeat S where S.sessionId ="+sportSessionId;
		Query<SportSeat> query = session.createQuery(hqlstr,SportSeat.class);
		List<SportSeat> resultList = query.list();
		return (ArrayList<SportSeat>) resultList;
	}

	@Override
	public void delete(int id) {
		Session session = factory.getCurrentSession();
		SportSeat sportSeat = session.get(SportSeat.class,id);
		if(sportSeat!=null) {
			session.delete(sportSeat);
		}
	}

}
