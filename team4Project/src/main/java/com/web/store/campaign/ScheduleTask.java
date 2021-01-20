package com.web.store.campaign;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.web.store.campaign.model.Campaign;
import com.web.store.campaign.service.CampaignService;

@Component
public class ScheduleTask {
	
	@Autowired
	CampaignService campService;
	
	//確認活動狀態
    @Scheduled(initialDelay = 2000, fixedRate = 600000)
    public void checkCampaignStatus() {
    	campService.checkCampaignStatus();
    }
    
}