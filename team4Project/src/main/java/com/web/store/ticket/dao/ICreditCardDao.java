package com.web.store.ticket.dao;

import com.web.store.ticket.model.CreditCard;

public interface ICreditCardDao {
	CreditCard queryCreditCard(int creditCardId);
}
