package com.web.store.ticket.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.ticket.dao.IExhibitionDao;
import com.web.store.ticket.model.Exhibition;

@Repository
public class ExhibitionDao implements IExhibitionDao {
	@Autowired
	SessionFactory factory;

	@Override
	public void addExhibition(Exhibition exhibition) {
		Session session = factory.getCurrentSession();
		session.save(exhibition);
	}

	@Override
	public void updateExhibition(Exhibition exhibition) {
		Session session = factory.getCurrentSession();
		session.update(exhibition);

	}

	@Override
	public Exhibition queryOneExhibition(int id) {
		Session session = factory.getCurrentSession();
		return session.get(Exhibition.class, id);
	}

	@Override
	public Exhibition selectByEvent(int eventId) {
		Session session = factory.getCurrentSession();
		String hqlstr = "FROM Exhibition E where E.eventId ="+eventId;
		Query<Exhibition> query = session.createQuery(hqlstr,Exhibition.class);
		List<Exhibition> resultList = query.list();
		Exhibition result = resultList.get(0);
		return result;
	}

	@Override
	public void delete(int id) {
		Session session = factory.getCurrentSession();
		Exhibition exhibition = session.get(Exhibition.class, id);
		if(exhibition!=null) {
			session.delete(exhibition);
		}

	}

}
