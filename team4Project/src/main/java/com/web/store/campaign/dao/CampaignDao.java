package com.web.store.campaign.dao;

import java.util.List;
import java.util.Map;

import com.web.store.campaign.model.Campaign;
import com.web.store.campaign.model.Page;
import com.web.store.campaign.model.SearchBean;
import com.web.store.company.model.Company;



public interface CampaignDao {
	
	int insert(Campaign camp);
	
	int update(Campaign camp);
	
	Page<Campaign> serchCampaignOfCompany(int companyId,SearchBean search,Page<Campaign> page);

	Campaign getCampaignById(int campId);
	
	List<Campaign> getRandomCampaignbyCompany(int companyId,int count);

	List<Campaign> getAllCampaign();
	
	List<Campaign> getCampaignByCompanyId(int companyId);
	
	List<Campaign> getCampaignByLaunchStatus(boolean launchStatus);
	
	List<Campaign> getSinglePageResultByCompanyId(int page,int compayId);
	
	Page<Campaign> getPageByCompanyId(Page<Campaign> page,int companyId);
	
	Long getTotalCampCountOfCompany(int companyId);
	
	int getTotalPage();
	
	int getTotalPageByCompanyId(int id);
	
	int deleteById(int id);	
	
}
