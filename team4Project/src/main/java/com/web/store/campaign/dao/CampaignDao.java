package com.web.store.campaign.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.web.store.account.javabean.MemberBean;
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
	
	Page<Campaign> getActiveCampaignPageByCompany(Page<Campaign> page ,int companyId);

	List<Campaign> getAllCampaign();
	
	List<Campaign> getCampaignByCompanyId(int companyId);
	
	List<Campaign> getCampaignByLaunchStatus(boolean launchStatus);
	
	Page<Campaign> getPageByCompanyId(Page<Campaign> page,int companyId);
	
	Long getTotalCampCountOfCompany(int companyId);
	
	int getTotalPage();
	
	int getTotalPageByCompanyId(int id);
	
	int deleteById(int id);	
	
	Set<MemberBean> getMemberByCompanyId(int companyId);
	
	List<Campaign> selectActiveCampaign();
	
}
