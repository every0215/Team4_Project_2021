package com.web.store.company.service;

import java.util.List;

import com.web.store.company.model.Store;

public interface StoreService {
	//查詢秀門市
	List<Store> getAllStoreByCompanyId(Integer companyId);
	//新增門市
	boolean addStore(Store sto);
	//改變上架狀態
	boolean updateStatus(Integer id,Boolean status);
	//更新門市
	boolean update(Store sto);
	
	boolean updateProfiles(Integer id, String profiles);
	
	Store getStoreById(Integer id);
	
	void updated(Store sto);
	
	boolean combineStoreService(String[] svid,Integer stoid);
}
