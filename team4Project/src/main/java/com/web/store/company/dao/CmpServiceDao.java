package com.web.store.company.dao;


import java.util.List;

import com.web.store.company.model.CmpService;

public interface CmpServiceDao {

	void addService(CmpService sv);
	
	boolean update(CmpService sv);
	
	List<CmpService> getAllServiceBycmpId(Integer cmpId);
	
	CmpService getCmpsvById(Integer id,Integer cmpId);
}
