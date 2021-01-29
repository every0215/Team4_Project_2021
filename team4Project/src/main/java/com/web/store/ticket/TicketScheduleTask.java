package com.web.store.ticket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.web.store.ticket.service.BackendService;

@Component
public class TicketScheduleTask {
	
	@Autowired
	BackendService backendService;
	
	//確認活動狀態
    @Scheduled(initialDelay = 2000, fixedRate = 100000)
    public void checkTickeOnWay() {
    	backendService.checkTicketOnWay(); 	
    }
    
    
    
}