package com.web.store.ticket.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.ticket.dao.ISportSessionDao;
import com.web.store.ticket.model.SportSession;

@Repository
public class SportSessionDao implements ISportSessionDao {

	@Autowired
	SessionFactory factory;
	
	@Override
	public void addSportSession(SportSession sportSession) {
		Session session = factory.getCurrentSession();
		session.save(sportSession);

	}

	@Override
	public void updateSportSession(SportSession sportSession) {
		Session session = factory.getCurrentSession();
		session.update(sportSession);
	}

	@Override
	public SportSession queryOneSportSession(int id) {
		Session session = factory.getCurrentSession();
		return session.get(SportSession.class, id);
	}

	@Override
	public ArrayList<SportSession> selectBySport(int sportId) {
		Session session = factory.getCurrentSession();
		String hqlstr = "FROM SportSession S where S.sportId ="+sportId;
		Query<SportSession> query = session.createQuery(hqlstr,SportSession.class);
		List<SportSession> resultList = query.list();
		return (ArrayList<SportSession>) resultList;
	}

	@Override
	public void delete(int id) {
		Session session = factory.getCurrentSession();
		SportSession sportSession = session.get(SportSession.class,id);
		if(sportSession!=null) {
			session.delete(sportSession);
		}

	}

}
