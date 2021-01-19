package com.web.store.product.service.impl;

import java.sql.SQLException;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.web.store.product.dao.ProductDao;
import com.web.store.product.model.ProductBean;
import com.web.store.product.service.ProductService;

@Service
@Transactional
public class ProductServiceimpl implements ProductService {
	@Autowired
	ProductDao productDao;

	@Override
	public List<ProductBean> selectAll() {

		return productDao.selectAll();
	}

	@Override
	public List<ProductBean> selectbyid(int ProductId) {
		return productDao.selectbyid(ProductId);

	};

	@Override
	public List<ProductBean> selectbystoreid(int storeId) {

		return productDao.selectbystoreid(storeId);
	}

	@Override
	public int insert(ProductBean pb) throws SQLException {

		return productDao.insert(pb);
	}

	@Override
	public int deletebyid(int id) throws SQLException {
		return productDao.deletebyid(id);

	}

	@Override
	public int alterbyid(ProductBean pb) throws SQLException {
		return productDao.alterbyid(pb);

	}
}
