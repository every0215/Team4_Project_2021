package com.web.store.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CompanyViewController {
	
	
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
		System.out.println("redirect");
		return "/company/CompanyProfiles";
	}
	
	@GetMapping("/company/StoreRegister_Profile")
	public String storeRegister_Profile() {
		System.out.println("redirect");
		return "/company/StoreRegister_Profile";
	}
	@GetMapping("/company/StoreRegister_Service")
	public String storeRegister_Service() {
		System.out.println("redirect");
		return "/company/StoreRegister_Service";
	}
	
	
}
