package com.web.store.product.service;

import java.sql.SQLException;
import java.util.List;

import com.web.store.product.model.Product;

public interface ProductService {

	List<Product> selectAll();

	List<Product> selectbyid(int ProductId);

	List<Product> selectbystoreid(int storeId);
	
	int insert(Product pb) throws SQLException;

	int deletebyid(int id) throws SQLException;

	int alterbyid(Product pb) throws SQLException;

}