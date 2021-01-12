package com.web.store.campaign.service;

import java.util.List;
import java.util.Map;

import com.web.store.campaign.model.Campaign;

public interface CampaignService {

	int insert(Campaign camp);

	Campaign getCampaignById(int campId);

	List<Campaign> getAllCampaign();

	List<Campaign> getCampaignByCompanyId(int companyId);

	List<Campaign> getCampaignByMember(int memberId);// 藉由會員找出訂閱的廣告

	List<Campaign> getCampaignByLaunchStatus(boolean launchStatus);

	int getTotalPage();

	int getTotalPageByCompanyId(int id);

	List<Campaign> getSinglePageResult(int page);

	List<Campaign> getSinglePageResultByCompayId(int page, int companyId);

	int deleteById(int id);

	int update(Campaign camp);
	
	List<Campaign> getActiveCampaign(List<Campaign> list);
	
	List<Campaign> getActiveCampaignByCompanyId(int companyId);

}
