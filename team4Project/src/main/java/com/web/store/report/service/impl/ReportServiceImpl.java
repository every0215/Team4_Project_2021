package com.web.store.report.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.store.product.model.Product;
import com.web.store.report.dao.ReportDao;
import com.web.store.report.model.Report;
import com.web.store.report.model.ReportProductAdv;
import com.web.store.report.service.ReportService;

@Service
@Transactional
public class ReportServiceImpl implements ReportService {
		
	ReportDao reportDao;
	@Autowired
	public void setDao(ReportDao reportDao) {
		this.reportDao=reportDao;
	}
	
	//查詢全部
	@Override
	public List<Report> queryAll() {
		return reportDao.queryAll();
	}
	//查詢累計會員數
	@Override
	public String queryMember(int companyid) {
		String list = reportDao.queryMember(companyid);
		return list;
		
//		return reportDao.queryMember();
	}
	//年度累計銷售金額
	@Override
	public String querySales(int companyid) {
		String list = reportDao.querySales(companyid);
		return list;
		
//		return reportDao.querySales(companyid);
	}
	//目前門市數量
	@Override
	public String queryStore(int companyid) {
		String list = reportDao.queryStore(companyid);
		return list;
		
//		return reportDao.queryStore(companyid);
	}
		
	//已銷售商品項目數量
	public String queryClass(int companyid) {
		String list = reportDao.queryClass(companyid);
		return list;
		
//		return reportDao.queryClass(companyid);
	}	
	
	//Tab1-年度各區業績(各店)
	@Override
	public List<Report> queryAreaSales(int companyid) {
	 		return reportDao.queryAreaSales(companyid);
	}
	
	//Tab2-年度品類銷售
	@Override
	public List<Report> queryProdustClass(int companyid) {
		return reportDao.queryProdustClass(companyid);
	}
	
	//Tab3-年度活動銷售
	@Override
	public List<Report> queryActiveSales(int companyid) {
		return reportDao.queryActiveSales(companyid);
	}
	
	//Tab4-各店-各店年度業績/折扣
	@Override
	public List<Report> queryAllStoreSales(int companyid) {
		return reportDao.queryAllStoreSales(companyid);
	}
	
	// Tab5-各店-各店活動業績
	@Override
	public List<Report> queryAllActiveSales(int companyid) {
		return reportDao.queryAllActiveSales(companyid);
	}
	
	//Tab6-各店-各店付款方式
	@Override
	public List<Report> queryAllStorePayment(int companyid) {
		return reportDao.queryAllStorePayment(companyid);
	}
	
	//Tab7-各店-各店無庫存項數
	@Override
	public List<Report> queryAllStoreStock(int companyid) {
		return reportDao.queryAllStoreStock(companyid);
	}
	
	//Tab8-匯入商品前五名排行
	@Override
	public List<Product> queryProductRanking(int companyid) {
		return reportDao.queryProductRanking(companyid);
	}
	
	 //Tab8-從adv資料庫搜尋
//	public List<Report> queryProductAdv(int companyid){
//		return reportDao.queryProductAdv(companyid);
//	}
	public List<ReportProductAdv> queryProductAdv(int companyid){
		return reportDao.queryProductAdv(companyid);
	}


	//修改廣告排行榜商品
	@Override
	public boolean updateProductAdv(int companyid,List<ReportProductAdv> list){
		return reportDao.updateProductAdv(companyid,list);
	}

	
	//查詢前五名商品
	@Override
	public	List<Report> queryProductTop(){
		return reportDao.queryProductTop();
	}

}
