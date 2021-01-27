package com.web.store.company.service;

import java.util.List;

import com.web.store.company.model.CmpService;

public interface CmpServiceService {

	boolean addService(CmpService sv);
	
	boolean updateService(CmpService sv);
	
	List<CmpService> getAllServiceBycmpId(Integer cmpId);
	
	CmpService getCmpsvById(Integer id,Integer cmpId);
}
