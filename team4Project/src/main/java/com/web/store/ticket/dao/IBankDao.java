package com.web.store.ticket.dao;

import java.util.ArrayList;

import com.web.store.ticket.model.Bank;

public interface IBankDao {
	ArrayList<Bank> queryAllBank();
}
