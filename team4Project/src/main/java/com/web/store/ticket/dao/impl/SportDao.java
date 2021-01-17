package com.web.store.ticket.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.ticket.dao.ISportDao;
import com.web.store.ticket.model.Sport;

@Repository
public class SportDao implements ISportDao {
	@Autowired
	SessionFactory factory;
	
	
	@Override
	public void addSport(Sport sport) {
		Session session = factory.getCurrentSession();
		session.save(sport);
		
	}

	@Override
	public void updateSport(Sport sport) {
		Session session = factory.getCurrentSession();
		session.update(sport);

	}

	@Override
	public Sport queryOneAttraction(int id) {
		Session session = factory.getCurrentSession();
		return session.get(Sport.class, id);
	}

	@Override
	public ArrayList<Sport> querySports() {
		Session session = factory.getCurrentSession();
		Query<Sport> query = session.createQuery("FROM Sport",Sport.class);
		return (ArrayList<Sport>) query.list();
	}

	@Override
	public Sport selectByEvent(int eventId) {
		Session session = factory.getCurrentSession();
		String hqlstr = "FROM Sport S where S.eventId ="+eventId;
		Query<Sport> query = session.createQuery(hqlstr,Sport.class);
		List<Sport> resultList = query.list();
		Sport result = resultList.get(0);
		return result;
	}

	@Override
	public void delete(int id) {
		Session session = factory.getCurrentSession();
		Sport sport = session.get(Sport.class, id);
		if(sport!=null) {
			session.delete(sport);
		}
	}

}
