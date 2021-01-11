package com.web.store.report.dao.impl;

import java.util.List;

import com.web.store.report.model.Report;



public interface IReportDao {
	
	//查詢全部
	List<Report> queryAll(Report report);
	
	//查詢累計會員數
	List<Report> queryMember(Report report);
	//年度累計銷售金額
	List<Report> querySales(Report report);
	//目前門市數量
	List<Report> queryStore(Report report);
	//商品項目數量
	List<Report> queryClass(Report report);
	
	
	//Tab1-年度各區業績(各店)
	List<Report> queryAreaSales(Report report);
	//Tab2-年度品類銷售
	List<Report> queryProdustClass(Report report);
	//Tab3-年度活動銷售
	List<Report> queryActiveSales(Report report);
	//Tab4-商品前十名排行
	List<Report> queryProductRanking(Report report);
	//Tab5-單項-各店年度業績
	List<Report> queryAllStoreSales(Report report);
	//Tab6-單項-各店年度折扣
	List<Report> queryAllStoreDicount(Report report);
	//Tab7-單項-各店會員數
	List<Report> queryAllStoreMember(Report report);
	//Tab8-單項-各店無庫存項數
	List<Report> queryAllStoreStock(Report report);
	//Tab9-單項-各店付款方式
	List<Report> queryAllStorePayment(Report report);	
	
	//新增廣告排行榜商品
	void insert(Report report);
	//修改廣告排行榜商品
	void update(Report report);
	//刪除廣告排行榜商品
	void delete(int reportid);
}
