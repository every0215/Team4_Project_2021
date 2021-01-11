package com.web.store.report.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.web.store.report.dao.impl.IReportDao;
import com.web.store.report.model.Report;

public class ReportDao implements IReportDao {
	private Session session;
	public ReportDao(Session session) {
		this.session = session;
	}
	
	//查詢全部
	@Override
	public List<Report> queryAll(Report report) {
		Query<Report> repQuery = session.createQuery("from Report", Report.class);
		return repQuery.list();
	}
	
	//查詢累計會員數
	@Override
	public List<Report> queryMember(Report report) {
		
		return null;
	}
	//年度累計銷售金額
	@Override
	public List<Report> querySales(Report report) {
		
		return null;
	}
	//目前門市數量
	@Override
	public List<Report> queryStore(Report report) {
		
		return null;
	}
	//商品項目數量
	@Override
	public List<Report> queryClass(Report report) {
		
		return null;
	}

		
	//Tab1-年度各區業績(各店)
	@Override
	public List<Report> queryAreaSales(Report report) {
		 
		return null;
	}
	//Tab2-年度品類銷售
	@Override
	public List<Report> queryProdustClass(Report report) {
		 
		return null;
	}
	//Tab3-年度活動銷售
	@Override
	public List<Report> queryActiveSales(Report report) {
		 
		return null;
	}
	//Tab4-商品前十名排行
	@Override
	public List<Report> queryProductRanking(Report report) {
		 
		return null;
	}
	//Tab5-單項-各店年度業績
	@Override
	public List<Report> queryAllStoreSales(Report report) {
		 
		return null;
	}
	//Tab6-單項-各店年度折扣
	@Override
	public List<Report> queryAllStoreDicount(Report report) {
		 
		return null;
	}
	//Tab7-單項-各店會員數
	@Override
	public List<Report> queryAllStoreMember(Report report) {
		 
		return null;
	}
	//Tab8-單項-各店無庫存項數
	@Override
	public List<Report> queryAllStoreStock(Report report) {
		 
		return null;
	}
	//Tab9-單項-各店付款方式
	@Override
	public List<Report> queryAllStorePayment(Report report) {
		 
		return null;
	}
	//新增廣告排行榜商品
	@Override
	public void insert(Report report) {
		 

	}
	//修改廣告排行榜商品
	@Override
	public void update(Report report) {
		 

	}
	//刪除廣告排行榜商品
	@Override
	public void delete(int reportid) {
		 

	}


}
