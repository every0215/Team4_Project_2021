package com.web.store.product.dao;

import java.sql.SQLException;
import java.util.List;

import com.web.store.product.model.ProductBean;


public interface ProductDao {
	List<ProductBean> selectAll();
	List<ProductBean> selectbyid(int id);
	List<ProductBean> selectbystoreid(int storeId);	
	
	int insert(ProductBean pb) throws SQLException;
	int deletebyid(int id) throws SQLException;
	int alterbyid(ProductBean pb) throws SQLException;
	
}
