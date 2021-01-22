package com.web.store.product.dao;

import java.sql.SQLException;
import java.util.List;

import com.web.store.product.model.Product;



public interface ProductDao {
	List<Product> selectAll();
	List<Product> selectbyid(int id);
	Product getProduct(String productId);
	int insert(Product pb) throws SQLException;
	int deletebyid(int id) throws SQLException;
	int alterbyid(Product pb) throws SQLException;
	
}
