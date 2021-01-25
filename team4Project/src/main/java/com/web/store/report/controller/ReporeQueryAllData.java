package com.web.store.report.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.store.company.model.Company;
import com.web.store.report.model.Report;
import com.web.store.report.service.ReportService;



@Controller
@SessionAttributes(names = {"company"}) ////存取session屬性
public class ReporeQueryAllData {


	@Autowired
	ReportService reportService; 
//	int companyid=3;
	
	
	//查詢全部明細
	@GetMapping(value="/ReporyQueryAllData" ,produces = {"application/json; charset=UTF-8"})
	public @ResponseBody List<Report> ReportQueryAllData(Model model) {
				return reportService.queryAll();
		}
	
	//查詢-年度累計/門市數量/已銷售商品項目
	@RequestMapping(value="/reportin", method = RequestMethod.GET,produces = {"application/json; charset=UTF-8"})
	public String queryItem(Model model) {
	
		//取session companyid
		Company company = (Company)model.getAttribute("company");
		int companyid=company.getId();
//		System.out.println("222222222222:");
//		System.out.println(companyid);
		
		// 年度累計銷售金額 
		String singleSales = reportService.querySales(companyid);
		model.addAttribute("singlesales", singleSales);
		// 目前門市數量
		String singleStore = reportService.queryStore(companyid);
		model.addAttribute("singlestore", singleStore);
		// 已銷售商品項目數量
		String queryClass = reportService.queryClass(companyid);
		model.addAttribute("queryclass", queryClass);
		
		return "report/Report";
		}
	
	// Tab1-年度各區業績
	@RequestMapping(value="/queryAreaSales",produces = {"application/json; charset=UTF-8"})
	public @ResponseBody List<Report> queryAreaSales(Model model) {
		
		//取session companyid
		Company company = (Company)model.getAttribute("company");
		int companyid=company.getId();

		return reportService.queryAreaSales(companyid);
	}
	
	
	// Tab2-年度品類銷售
	@GetMapping(value="/queryProdustClass",produces = {"application/json; charset=UTF-8"})
		public @ResponseBody List<Report> queryProdustClass(Model model) {
		
		//取session companyid
		Company company = (Company)model.getAttribute("company");
		int companyid=company.getId();
		
			return reportService.queryProdustClass(companyid);
			}
	
	// Tab3-年度活動銷售
	@RequestMapping(value="/queryActiveSales",produces = {"application/json; charset=UTF-8"})
	public @ResponseBody List<Report> queryActiveSales(Model model) {
		
		//取session companyid
		Company company = (Company)model.getAttribute("company");
		int companyid=company.getId();
		
		
		return reportService.queryActiveSales(companyid);
		
		}
	
	//Tab4-各店-各店年度業績/折扣
	@RequestMapping(value="/queryAllStoreSales",produces = {"application/json; charset=UTF-8"})
		public @ResponseBody List<Report> queryAllStoreSales(Model model) {
		
		//取session companyid
		Company company = (Company)model.getAttribute("company");
		int companyid=company.getId();
		
			return reportService.queryAllStoreSales(companyid);
			}
	
	// Tab5-各店-各店活動業績
	@RequestMapping(value="/queryAllActiveSales",produces = {"application/json; charset=UTF-8"})
	public @ResponseBody List<Report> queryAllActiveSales(Model model) {
		
		//取session companyid
		Company company = (Company)model.getAttribute("company");
		int companyid=company.getId();
		
		return reportService.queryAllActiveSales(companyid);
		}
	
	// Tab6-各店-各店付款方式
	@RequestMapping(value="/queryAllStorePayment",produces = {"application/json; charset=UTF-8"})
	public @ResponseBody List<Report> queryAllStorePayment(Model model) {
		
		//取session companyid
		Company company = (Company)model.getAttribute("company");
		int companyid=company.getId();
		
		
		return reportService.queryAllStorePayment(companyid);
		}
	
	// Tab7-各店-各店無庫存項數
	@RequestMapping(value="/queryAllStoreStock",produces = {"application/json; charset=UTF-8"}, method = RequestMethod.GET)
	public @ResponseBody List<Report> queryAllStoreStock(Model model) {
		
		//取session companyid
		Company company = (Company)model.getAttribute("company");
		int companyid=company.getId();
		
		return reportService.queryAllStoreStock(companyid);
		}
	}


