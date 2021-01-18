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
	ProductDao ProductDao;

	@Override
	public List<ProductBean> selectAll() {

		return ProductDao.selectAll();
	}

	@Override
	public List<ProductBean> selectbyid(int ProductId) {
		return ProductDao.selectbyid(ProductId);

	};

	@Override
	public List<ProductBean> selectbystoreid(int storeId) {

		return ProductDao.selectbystoreid(storeId);
	}

	@Override
	public int insert(ProductBean pb) throws SQLException {

		return ProductDao.insert(pb);
	}

	@Override
	public int deletebyid(int id) throws SQLException {
		return ProductDao.deletebyid(id);

	}

	@Override
	public int alterbyid(int id) throws SQLException {
		return ProductDao.alterbyid(id);

	}
}
