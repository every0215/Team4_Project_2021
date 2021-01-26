package com.web.store.report.service;

import java.util.List;

import com.web.store.report.model.Report;

public interface ReportService {
		
		//查詢全部
		List<Report> queryAll();
		
		//查詢累計會員數
		List<Report> queryMember();
		//年度累計銷售金額
		String querySales(int companyid);
		//目前門市數量
		String queryStore(int companyid);
//		List<Report> queryStore();
		//已銷售商品項目數量
		String queryClass(int companyid);
//		List<Report> queryClass();
		
		//Tab1-年度各區業績(各店)
		List<Report> queryAreaSales(int companyid);
		//Tab2-年度品類銷售
		List<Report> queryProdustClass(int companyid);
		//Tab3-年度活動銷售
		List<Report> queryActiveSales(int companyid);
		//Tab4-各店-各店年度業績/折扣
		List<Report> queryAllStoreSales(int companyid);
		// Tab5-各店-各店活動業績
		List<Report> queryAllActiveSales(int companyid);
		//Tab6-各店-各店付款方式
		List<Report> queryAllStorePayment(int companyid);	
		//Tab7-各店-各店無庫存項數
		List<Report> queryAllStoreStock(int companyid);
		//Tab8-商品前五名排行
		List<Report> queryProductRanking(int companyid);
		//新增廣告排行榜商品
		void insert(Report report);
		//修改廣告排行榜商品
		void update(Report report);
		//刪除廣告排行榜商品
		void delete(int reportid);
}
