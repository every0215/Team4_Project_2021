package com.web.store.company.controller;

import java.sql.Blob;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CompanyController {
	//註冊企業資料包含文字 圖片
	@RequestMapping(value="/CompanyRegister")
	public String companyRegister(@RequestParam String companyName,
			@RequestParam String uniformNumbers,
			@RequestParam Integer 行業類別,
			@RequestParam String account,
			@RequestParam String password,
			@RequestParam String phone,
			@RequestParam Blob logo,
			@RequestParam Blob busRC
			
			) {
		return "回到首頁重新登入";
		
	}

}
