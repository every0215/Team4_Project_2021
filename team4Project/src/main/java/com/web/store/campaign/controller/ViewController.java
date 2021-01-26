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
	
	@GetMapping("/campaignAddComfirm")
	public String CampaignAddComfirm() {
		return "campaign/CampaignAddComfirmPage";
	}
	
	@GetMapping("/campaignShow")
	public String CampaigShow() {
		return "campaign/CampaignShowPage";
	}
	
	@GetMapping("/CampaignUpdate")
	public String CampaigUpdate() {
		return "campaign/CampaignUpdatePage";
	}
	
}
