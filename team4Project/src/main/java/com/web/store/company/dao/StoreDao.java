package com.web.store.company.dao;

import java.util.List;

import com.web.store.company.model.Company;
import com.web.store.company.model.Store;

public interface StoreDao {
	//新增門市
	void addStore(Store sto);
	//更新門市資料
	boolean update(Store sto);
	//更新門市狀態
	
	
	/////////////////////門市查詢功能////////////////////////
	//查詢全部門市
	List<Store> getAllStoreByCompanyId(Integer companyId);
	
	//查詢依企業地區
	List<Store> getStoreByArea(Company cmp, String area);
	//查詢依地區
	List<Store> getStoreByOnlyArea(String area);
	
	//查詢依名字
	List<Store> getStoreByName(String store);

	/////////////////////門市查詢功能////////////////////////
	
	/////////////////////門市刪除功能////////////////////////
	//更改狀態為下架
	//待寫
	boolean updateStatus(Integer id,Boolean status);
	
	boolean updateProfiles(Integer id,String profiles);
	
	Store getStoreById(Integer id);
	
	Store getStoreByMarker(Double lat,Double lng);
	
	void updated(Store sto);
	
	boolean delete(Integer id);
	
	List<Store> getStoreByOnlyName(String stoName);
	
	List<Store> cmpGetStoreByName(Integer tempcmpid,String stoName);
	
	List<Integer> getStoreByService(List<Integer> intList);
	/////////////////////門市刪除功能////////////////////////
}
