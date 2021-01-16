package com.web.store.home.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;



//import mvc.examples.model.Cat;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String index() {
		return "index";     // 請視圖解析器由視圖的邏輯名稱index來找出真正的視圖
	}

	@RequestMapping("/layout/header")
	public String layoutHeader() {
		return "layout/header";     //
	}
	
	@RequestMapping("/bo")
	public String boIndex() {
		return "crm/backOffice";
	}
	
	@RequestMapping("/CmpRegi")
	public String companyRegister() {
		return "company/CompanyRegister";
	}
	@RequestMapping("/CmpLog")
	public String companyLogin() {
		return "company/CompanyLogin";
	}
}
