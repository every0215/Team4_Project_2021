package com.web.store.company.dao;

import java.util.List;


import com.web.store.company.model.Store;

public interface StoreDao {
	//新增門市
	void addStore(Store sto);
	//更新門市資料
	boolean update(Store sto);
	//更新門市狀態
	
	
	/////////////////////門市查詢功能////////////////////////
	//查詢全部門市
	List<Store> getAllStoreByCompanyId(Integer id);
	
	//查詢依地區
	List<Store> getStoreByArea(String storeArea);
	
	//查詢依名字
	List<Store> getStoreByName(String store);
	
	/////////////////////門市查詢功能////////////////////////
	
	/////////////////////門市刪除功能////////////////////////
	//更改狀態為下架
	//待寫
	boolean updateStatus(Integer id,Boolean status);
	
	
	
	
	/////////////////////門市刪除功能////////////////////////
}
