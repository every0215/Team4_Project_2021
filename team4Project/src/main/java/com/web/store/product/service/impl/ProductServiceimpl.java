package com.web.store.product.service.impl;

import java.sql.SQLException;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.web.store.product.dao.ProductDao;
import com.web.store.product.model.Product;
import com.web.store.product.service.ProductService;

@Service
@Transactional
public class ProductServiceimpl implements ProductService {
	@Autowired
	ProductDao productDao;

	@Override
	public List<Product> selectAll() {

		return productDao.selectAll();
	}

	@Override
	public Product selectbyid(int ProductId) {
		return productDao.selectbyid(ProductId);

	};

	

	@Override
	public int insert(Product pb) throws SQLException {

		return productDao.insert(pb);
	}

	@Override
	public int deletebyid(int id) throws SQLException {
		return productDao.deletebyid(id);

	}

	@Override
	public int alterbyid(Product pb) throws SQLException {
		return productDao.alterbyid(pb);

	}

	@Override
	public Product getProduct(Integer productId) {
		// TODO Auto-generated method stub
		return productDao.getProduct(productId);
	}

	@Override
	public List<Product> selectbyCompanyName(String companyName) {
		// TODO Auto-generated method stub
		return productDao.selectbyCompanyName(companyName);
	}
	public List<Product> selectbyType(String productType){
		return productDao.selectbyType(productType);
	}
}
