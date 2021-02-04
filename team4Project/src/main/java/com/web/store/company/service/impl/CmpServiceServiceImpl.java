package com.web.store.company.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.store.company.dao.CmpServiceDao;
import com.web.store.company.model.CmpService;
import com.web.store.company.model.Company;
import com.web.store.company.model.StoreService;
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
	public List<CmpService> getAllServiceBycmpId(Company cmpId) {
		
		return cmpsvDao.getAllServiceBycmpId(cmpId);
	}

	@Override
	public CmpService getCmpsvById(Integer id,Integer cmpId) {
		
		return cmpsvDao.getCmpsvById(id,cmpId);
	}

	@Override
	public CmpService getCmpsvBysvId(Integer id) {
		
		return cmpsvDao.getCmpsvBysvId(id);
	}
	@Override
	public List<Integer> getCmpsvBystoId(Integer stoid){
		List<Integer> stosv = cmpsvDao.getCmpsvBystoId(stoid);
		//List<Integer> svidlist = new ArrayList<>();
		
//		System.out.println("stosv有資料"+stosv);
//		System.out.println("轉型前");
//		for(StoreService stos :stosv) {
//			Integer svid = stos.getServiceId();
//			System.out.println("1==========="+stos.getServiceId());
//			System.out.println("2==========="+svid);
//			svidlist.add(svid);
//		}
		return stosv;
		
	}

}
