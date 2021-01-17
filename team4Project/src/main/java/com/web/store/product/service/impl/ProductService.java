package com.web.store.product.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.web.store.product.controller.ProductBean;

public interface ProductService {

	List<ProductBean> selectAll();

	List<ProductBean> selectbyid(int ProductId);

	List<ProductBean> selectbystoreid(int storeId);
	
	int insert(ProductBean pb) throws SQLException;

	int deletebyid(int id) throws SQLException;

	int alterbyid(int id) throws SQLException;

}