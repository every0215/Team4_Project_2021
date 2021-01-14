package com.web.store.product.dao;

import java.sql.SQLException;
import java.util.List;

import com.web.store.product.controller.ProductBean;
import com.web.store.product.dao.impl.ProductDaoimpl;

public class ProductDao implements ProductDaoimpl {
	public List<ProductBean> selectAll(){
		return null;
		
	}
	public List<ProductBean> selectbyid(int id){
		return null;
		
	};
	public List<ProductBean> selectbystoreid(int storeId){
		return null;
		
	}
	public int insert(ProductBean pb) throws SQLException{
		
		return 1;
	}
	public int deletebyid(int id) throws SQLException{
		return 1;
		
	}
	public int alterbyid(int id) throws SQLException{
		return 1;
		
	}
}
