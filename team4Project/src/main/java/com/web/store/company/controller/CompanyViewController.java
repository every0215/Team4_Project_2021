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
}
