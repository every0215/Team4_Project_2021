package com.web.store.ticket.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.ticket.dao.IPriceDao;
import com.web.store.ticket.model.Event;
import com.web.store.ticket.model.Price;

@Repository
public class PriceDao implements IPriceDao {
	
	@Autowired
	SessionFactory factory;

	@Override
	public void addPrice(Price price) {
		Session session = factory.getCurrentSession();
			session.save(price);
	}

	@Override
	public void updatePrice(Price price) {
		Session session = factory.getCurrentSession();
		session.update(price);

	}

	@Override
	public List<Price> queryPriceList() {
		Session session = factory.getCurrentSession();
		Query<Price> query = session.createQuery("FROM Price",Price.class);
		return query.list();
	}

	@Override
	public List<Price> select(int eventId) {
		Session session = factory.getCurrentSession();
		String hqlstr = "FROM Price P where P.eventId ="+eventId;
		Query<Price> query = session.createQuery(hqlstr,Price.class);
		List<Price> resultList = query.list();
		return resultList;
	}

	@Override
	public void delete(int id) {
		Session session = factory.getCurrentSession();
		Price price = session.get(Price.class, id);
		if(price!=null) {
			session.delete(price);
		}

	}

	@Override
	public Price queryPrice(int id) {
		Session session = factory.getCurrentSession();
		return session.get(Price.class, id);
	}

}
