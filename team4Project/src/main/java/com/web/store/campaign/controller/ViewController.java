package com.web.store.campaign.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/campaign/")
public class ViewController {
	
	@RequestMapping("/insertPage")
	public String CampaignBoIndex() {
		return "campaign/CampaignInsertPage";
	}
	
	@GetMapping("/CampaignAdd")
	public String CampaignAdd() {
		return "campaign/CampaignAdd";
	}
	
	@ModelAttribute
	public void getDate(Model model) {
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String dateStr = dateFormat.format(date);
		model.addAttribute("date",dateStr);//將當前日期傳給前端date表單
	}
	
}
