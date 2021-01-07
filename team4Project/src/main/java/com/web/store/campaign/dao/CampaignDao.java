package com.web.store.campaign.dao;

import java.util.List;
import java.util.Map;

import com.web.store.campaign.model.Campaign;



public interface CampaignDao {
	
	int add(Campaign camp);

	Campaign getCampaignById(int campId);

	List<Campaign> getAllCampaign();
	
	List<Campaign> getCampaignByCompany(int companyId);
	
	List<Campaign> getCampaignByStatus(boolean status);
	
	int deleteById(int id);

	int update(Campaign camp);

	List<Campaign> getSinglePageResult(int page);
	
	int getTotalPage();
}
