package com.web.store.report.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.store.report.model.Report;
import com.web.store.report.service.ReportService;



@Controller
//@RequestMapping(path="/reportindex", method = RequestMethod.GET)
public class ReporeQueryAllData_Servlet {

//測試用
//	@GetMapping("/reportindex") //網址顯示(請求路徑)不可重複
//	@RequestMapping(path="/reportindex", method = RequestMethod.GET)
//	public String welcome(Model model) {
//		model.addAttribute("title","歡迎");
//		model.addAttribute("subtitle","成功導字");
//		return "report/Report"; //將這個jsp內容導入到上面網址
//	}
//	
//	@RequestMapping(path="/reportindex1", method = RequestMethod.GET)
//	public String welcome1(Model model) {
//		model.addAttribute("title1","光臨");
//		model.addAttribute("subtitle1","導字OK");
//		return "report/Report"; //將這個jsp內容導入到上面網址
//	}	
	@Autowired
	ReportService reportService; 
	int companyid=1;
	
	
	//查詢全部明細
//	@GetMapping(value="/ReporyQueryAllData" ,produces = {"application/json; charset=UTF-8"})
//	
//		List<Report> lista = reportService.queryAll();
//		model.addAttribute("list", lista);
//		return "report/Report";
//		
//		}
	
	//查詢各店-年度累計銷售金額
	@RequestMapping(path="/reportindex", method = RequestMethod.GET)
	public String querySales(Model model) {
		// 年度累計銷售金額 
		String singleSales = reportService.querySales(companyid);
		model.addAttribute("singlesales", singleSales);
		// 目前門市數量
		String singleStore = reportService.queryStore(companyid);
		model.addAttribute("singlestore", singleStore);
		// 已銷售商品項目數量
		String queryClass = reportService.queryClass(companyid);
		model.addAttribute("queryclass", queryClass);
		
		// Tab1-年度各區業績	
		List<Report> arealista = reportService.queryAreaSales(companyid);
		model.addAttribute("area", arealista);

		return "report/Report";
		}
	
	// Tab2-年度品類銷售
	@RequestMapping("/queryProdustClass")
		public String queryProdustClass(Model model) {
		List<Report> classlista = reportService.queryProdustClass(companyid);
		model.addAttribute("classlist", classlista);
		
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
	
	// Tab3-年度活動銷售
	@RequestMapping("/queryActiveSales")
	public String queryActiveSales(Model model) {
	List<Report> activelista = reportService.queryActiveSales(companyid);
	model.addAttribute("activelist", activelista);
	
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
	
	//Tab4-各店-各店年度業績/折扣/會員數
	@RequestMapping("/SingleItemQuerySales")
		public String queryAllStoreSales(Model model) {
		List<Report> storelista = reportService.queryAllStoreSales(companyid);
		model.addAttribute("storelist", storelista);
		
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
	
	// Tab5-各店-各店活動業績
	@RequestMapping("/queryAllActiveSales")
	public String queryAllActiveSales(Model model) {
		List<Report> storeactivelista = reportService.queryAllActiveSales(companyid);
		model.addAttribute("storeactivelist", storeactivelista);
		
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
	
	// Tab6-各店-各店付款方式
	@RequestMapping("/queryAllStorePayment")
	public String queryAllStorePayment(Model model) {
		List<Report> storepaymentlista = reportService.queryAllStorePayment(companyid);
		model.addAttribute("storepaymentlist", storepaymentlista);
		
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
	
	
	}


