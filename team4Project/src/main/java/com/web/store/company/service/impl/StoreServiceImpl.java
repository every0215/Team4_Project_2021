package com.web.store.company.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.store.company.dao.CompanyDao;
import com.web.store.company.dao.StoreDao;
import com.web.store.company.model.Store;
import com.web.store.company.service.CompanyService;
import com.web.store.company.service.StoreService;

@Service
@Transactional
public class StoreServiceImpl implements StoreService {

	@Autowired
	StoreDao stoDao;
	
	@Autowired
	CompanyDao cmpDao;
	
	@Autowired
	CompanyService cmpService;
	
	@Override
	public List<Store> getAllStoreByCompanyId(Integer companyId) {
		boolean chk = cmpService.statusCheck(companyId);
		
		if(chk) {
			System.out.println("企業上架中");
			return stoDao.getAllStoreByCompanyId(companyId);
			
		}else {
			return null;
		}
	}

	@Override
	public boolean addStore(Store sto) {
		
		stoDao.addStore(sto);
		return true;
		
	}

	@Override
	public boolean updateStatus(Integer id, Boolean status) {
		
		return stoDao.updateStatus(id, status);
	}
	@Override
	public boolean updateProfiles(Integer id, String profiles) {
		
		return stoDao.updateProfiles(id, profiles);
	}

	@Override
	public boolean update(Store sto) {
		
		return stoDao.update(sto);
	}

	@Override
	public Store getStoreById(Integer id) {
		
		return stoDao.getStoreById(id);
	}

	@Override
	public void updated(Store sto) {
		
	if(stoDao.delete(sto.getId())) {
		stoDao.addStore(sto);
	}else {
	stoDao.addStore(sto);
	}	
		
	}

	
	
	
	
}
