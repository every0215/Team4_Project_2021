package com.web.store.company.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.web.store.company.dao.StoreDao;
import com.web.store.company.model.Store;
import com.web.store.company.service.StoreService;

@Service
@Transactional
public class StoreServiceImpl implements StoreService {

	@Autowired
	StoreDao stoDao;
	
	@Override
	public List<Store> getAllStore() {
		
		return stoDao.getAllStore();
	}

}
