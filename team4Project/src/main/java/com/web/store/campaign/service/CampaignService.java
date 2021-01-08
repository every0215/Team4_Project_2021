package com.web.store.campaign.service;

import java.util.List;
import java.util.Map;

import com.web.store.campaign.model.Campaign;

public interface CampaignService {
	
	int add(Campaign camp);

	Campaign getCampaignById(int campId);

	List<Campaign> getAllCampaign();
	
	List<Campaign> getCampaignByCompany(int companyId);
	
	List<Campaign> getCampaignByMember(int memberId);//藉由會員找出訂閱的廣告
	
	List<Campaign> getCampaignByStatus(boolean status);
	
	int deleteById(int id);

	int update(Campaign camp);
	
	int getTotalPage();
	
	List<Campaign> getPageCampaign(int page);
}
