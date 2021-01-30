package com.web.store.product.dao;

import java.sql.SQLException;
import java.util.List;

import com.web.store.product.model.Product;



public interface ProductDao {
	List<Product> selectAll();
	Product selectbyid(int id);
	List<Product> selectbyName(String productName);
	List<Product> selectbyCompanyName(String companyName);
	Product getProduct(Integer productId);
	int insert(Product pb) throws SQLException;
	int deletebyid(int id) throws SQLException;
	int alterbyid(Product pb) throws SQLException;
	List<Product> selectbyType(String productType);
	void setProductDiscountToDefault();
	
}
