package com.web.store.ticket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BaseController {
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/ticket/InputPageAT(Form)")
	public String InputPageATForm() {
		return "/ticket/InputPageAT(Form)";
	}
	
	@GetMapping("/ticket/InputPageEX")
	public String InputPageEX() {
		return "ticket/InputPageEX";
	}
	
	@GetMapping("/ticket/InputPageAT")
	public String InputPageAT() {
		return "ticket/InputPageAT";
	}
	
	@GetMapping("/ticket/InputPageSP")
	public String InputPageSP() {
		return "ticket/InputPageSP";
	}
	
	@GetMapping("/ticket/ShowPageEX")
	public String ShowPageEX() {
		return "ticket/ShowPageEX";
	}
	
	@GetMapping("/ticket/ShowPageAT")
	public String ShowPageAT() {
		return "ticket/ShowPageAT";
	}
	
	@GetMapping("/ticket/ShowPageSP")
	public String ShowPageSP() {
		return "ticket/ShowPageSP";
	}
	
}
