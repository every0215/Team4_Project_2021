package com.web.store.company.service;

import java.util.List;

import com.web.store.company.model.CmpService;
import com.web.store.company.model.Company;

public interface CmpServiceService {

	boolean addService(CmpService sv);
	
	boolean updateService(CmpService sv);
	
	List<CmpService> getAllServiceBycmpId(Company cmpId);
	
	CmpService getCmpsvById(Integer id,Integer cmpId);
	
	CmpService getCmpsvBysvId(Integer id);
}
