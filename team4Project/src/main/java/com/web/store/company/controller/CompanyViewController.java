package com.web.store.company.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.web.store.company.model.CmpService;
import com.web.store.company.model.Company;
import com.web.store.company.service.CmpServiceService;

@Controller
public class CompanyViewController {
	
	@Autowired
	CmpServiceService cmpsvService;
	
	
	@GetMapping("/crm/backOffice")
	public String login() {
		System.out.println("redirect");
		return "/crm/backOffice";
	}
	
	@GetMapping("/index")
	public String companyRegister() {
		System.out.println("redirect");
		return "/index";
	}
//	@GetMapping("/company/ShowStore")
//	public String ShowStore() {
//		System.out.println("redirect");
//		return "/company/ShowStore";
//	}
	@GetMapping("/company/CompanyProfiles")
	public String Companyprofiles() {
		
		return "/company/CompanyProfiles";
	}
	
	@GetMapping("/company/StoreRegister_Profile")
	public String storeRegister_Profile() {
		
		return "/company/StoreRegister_Profile";
	}
	@GetMapping("/company/StoreRegister_Service")
	public String storeRegister_Service(Model model, HttpSession session) {
		Company company=(Company)session.getAttribute("company");
		System.out.println("================================================"+company.getId());
		Integer id = company.getId();
		List<CmpService> CmpsvList = cmpsvService.getAllServiceBycmpId(id);
		model.addAttribute("CmpsvList", CmpsvList);
		return "/company/StoreRegister_Service";
	}
	
	
}
