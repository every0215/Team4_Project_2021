package com.web.store.company.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.store.company.dao.CmpServiceDao;
import com.web.store.company.model.CmpService;
import com.web.store.company.service.CmpServiceService;


@Service
@Transactional
public class CmpServiceServiceImpl implements CmpServiceService {

	@Autowired
	CmpServiceDao cmpsvDao;
	
	@Override
	public boolean addService(CmpService sv) {
		cmpsvDao.addService(sv);
		return true;
	}

	@Override
	public boolean updateService(CmpService sv) {
		
		return cmpsvDao.update(sv);
	}

	@Override
	public List<CmpService> getAllServiceBycmpId(Integer cmpId) {
		
		return cmpsvDao.getAllServiceBycmpId(cmpId);
	}

	@Override
	public CmpService getCmpsvById(Integer id,Integer cmpId) {
		
		return cmpsvDao.getCmpsvById(id,cmpId);
	}

}
