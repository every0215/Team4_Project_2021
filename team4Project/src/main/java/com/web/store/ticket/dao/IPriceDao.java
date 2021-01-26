package com.web.store.ticket.dao;

import java.util.List;

import com.web.store.ticket.model.Price;


public interface IPriceDao {
	void addPrice(Price price);
	
	void updatePrice(Price price);
	
	Price queryPrice(int id);
	
	List<Price> queryPriceList();
	
	List<Price> select(int eventId);
	
	void delete(int id);
}
