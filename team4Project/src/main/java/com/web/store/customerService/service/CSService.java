package com.web.store.customerService.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.store.customerService.dao.CSDao;
import com.web.store.customerService.model.CustomerService;

@Service
@Transactional
public class CSService {
	
	@Autowired
	CSDao csDao;
	public CustomerService checkUser(String userId,String userPassword) {
		return csDao.checkUser(userId, userPassword);
	}
}
