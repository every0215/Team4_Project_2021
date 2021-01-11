package com.web.store.ticket.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.ticket.dao.IAttractionDao;
import com.web.store.ticket.model.Attraction;

@Repository
public class AttractionDao implements IAttractionDao {
	@Autowired
	SessionFactory factory;
	
	@Override
	public void addAttraction(Attraction attraction) {
		Session session = factory.getCurrentSession();
		session.save(attraction);
	}

	@Override
	public void updateAttraction(Attraction attraction) {
		Session session = factory.getCurrentSession();
		session.update(attraction);

	}

	@Override
	public Attraction queryOneAttraction(int id) {
		Session session = factory.getCurrentSession();
		return session.get(Attraction.class, id);
	}
	
	@Override
	public ArrayList<Attraction> queryAttractions() {
		Session session = factory.getCurrentSession();
		Query<Attraction> query = session.createQuery("FROM Attraction",Attraction.class);
		return (ArrayList<Attraction>) query.list();
	}


	@Override
	public Attraction selectByEvent(int eventId) {
		Session session = factory.getCurrentSession();
		String hqlstr = "FROM Attraction A where A.eventId ="+eventId;
		Query<Attraction> query = session.createQuery(hqlstr,Attraction.class);
		List<Attraction> resultList = query.list();
		Attraction result = resultList.get(0);
		return result;
	}

	@Override
	public void delete(int id) {
		Session session = factory.getCurrentSession();
		Attraction attraction = session.get(Attraction.class, id);
		if(attraction!=null) {
			session.delete(attraction);
		}

	}

	
}
