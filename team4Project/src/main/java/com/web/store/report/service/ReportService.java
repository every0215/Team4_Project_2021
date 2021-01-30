package com.web.store.report.service;

import java.util.List;

import com.web.store.product.model.Product;
import com.web.store.report.model.Report;
import com.web.store.report.model.ReportProductAdv;

public interface ReportService {
		
		//查詢全部
		List<Report> queryAll();
		
		//查詢累計會員數
		String queryMember(int companyid);
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
		//Tab8-匯入商品前五名排行
		List<Product> queryProductRanking(int companyid);
	
		//Tab8-從adv資料庫搜尋
		List<ReportProductAdv> queryProductAdv(int companyid);
		
		//修改廣告排行榜商品
		boolean updateProductAdv(int companyid, List<ReportProductAdv> list);

		//查詢前五名商品
		List<Report> queryProductTop();
}
