package com.web.store.ticket.dao;

import java.util.ArrayList;

import com.web.store.ticket.model.CreditCard;

public interface ICreditCardDao {
	CreditCard queryCreditCard(int creditCardId);
	ArrayList<CreditCard> queryCreditCardByBank(int bankId);
}
