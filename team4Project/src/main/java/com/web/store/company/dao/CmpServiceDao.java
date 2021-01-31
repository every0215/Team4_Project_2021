package com.web.store.company.dao;


import java.util.List;

import com.web.store.company.model.CmpService;
import com.web.store.company.model.Company;

public interface CmpServiceDao {

	void addService(CmpService sv);
	
	boolean update(CmpService sv);
	
	List<CmpService> getAllServiceBycmpId(Company cmpId);
	
	CmpService getCmpsvById(Integer id,Integer cmpId);
	
	CmpService getCmpsvBysvId(Integer id);
}
