package com.web.store.product.service;

import java.sql.SQLException;
import java.util.List;

import com.web.store.product.model.ProductBean;

public interface ProductService {

	List<ProductBean> selectAll();

	List<ProductBean> selectbyid(int ProductId);

	List<ProductBean> selectbystoreid(int storeId);
	
	int insert(ProductBean pb) throws SQLException;

	int deletebyid(int id) throws SQLException;

	int alterbyid(int id) throws SQLException;

}