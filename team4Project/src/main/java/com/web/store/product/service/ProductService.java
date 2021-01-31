package com.web.store.product.service;

import java.sql.SQLException;
import java.util.List;

import com.web.store.product.model.Product;

public interface ProductService {

	List<Product> selectAll();

	Product selectbyid(int ProductId);

	
	int insert(Product pb) throws SQLException;

	int deletebyid(int id) throws SQLException;

	int alterbyid(Product pb) throws SQLException;

	Product getProduct(Integer productId);
	List<Product> selectbyCompanyName(String companyName);
	List<Product> selectbyType(String productType);
	List<Product>  selectbyName(String productname);
	
	void setProductDiscountToDefault();
}