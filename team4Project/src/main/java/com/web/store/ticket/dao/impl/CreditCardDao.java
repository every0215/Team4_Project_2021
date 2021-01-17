package com.web.store.ticket.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.ticket.dao.ICreditCardDao;
import com.web.store.ticket.model.CreditCard;

@Repository
public class CreditCardDao implements ICreditCardDao {
	
	@Autowired
	SessionFactory factory;

	@Override
	public CreditCard queryCreditCard(int creditCardId) {
		Session session = factory.getCurrentSession();
		CreditCard creditCard = session.get(CreditCard.class, creditCardId);
		return creditCard;
	}

}
