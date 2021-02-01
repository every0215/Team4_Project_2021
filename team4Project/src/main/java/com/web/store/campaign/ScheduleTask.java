package com.web.store.campaign;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.stereotype.Component;

import com.web.store.campaign.model.Campaign;
import com.web.store.campaign.service.CampaignService;
import com.web.store.product.service.ProductService;

@Component
public class ScheduleTask {
	
	@Autowired
	CampaignService campService;
	@Autowired
	ProductService productService;
	
	//確認活動狀態
    @Scheduled(initialDelay = 2000, fixedRate = 600000)
    public void checkCampaignStatus() {
    	campService.checkCampaignStatus();
    }
    
    //確認商品折扣
    @Scheduled(initialDelay = 2000, fixedRate = 100000)
    public void checkProductsDiscount() {
    	campService.updateProductDiscount();
    }  
    
    @Bean
    public TaskScheduler taskScheduler() {
        TaskScheduler scheduler = new ThreadPoolTaskScheduler();
        return scheduler;
    }
    
}