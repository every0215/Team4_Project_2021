package com.web.store.campaign.service;

import java.util.List;
import java.util.Map;

import com.web.store.campaign.model.ApplyBean;
import com.web.store.campaign.model.Campaign;
import com.web.store.campaign.model.Page;
import com.web.store.campaign.model.SearchBean;
import com.web.store.product.model.Product;

public interface CampaignService {

	int insert(Campaign camp);

	Page<Campaign> searchCampaignOfCompany(int companyId, SearchBean search, Page<Campaign> page);

	Campaign getCampaignById(int campId);

	List<Campaign> getAllCampaign();

	List<Campaign> getCampaignByCompanyId(int companyId);

	List<Campaign> getCampaignByMember(int memberId);// 藉由會員找出訂閱的廣告

	List<Campaign> getCampaignByLaunchStatus(boolean launchStatus);

	int getTotalPage();

	int getTotalPageByCompanyId(int id);

	int deleteById(int id);

	int update(Campaign camp);

	List<Campaign> getActiveCampaign(List<Campaign> list);

	List<Campaign> getActiveCampaignByCompanyId(int companyId);

	Long getTotalCampCountOfCompany(int companyId);
	
	Page<Campaign> getCampaignPageOfCompany(Page<Campaign> page,int companyId);
	
	void checkCampaignStatus();
	
	List<Campaign> getRandomCampaignbyCompany(int companyId, int count);
	
	Page<Campaign> getActiveCampaignPageByCompany(Page<Campaign> page,int companyId);
	
	Map<String,List<Product>> classifyProductIncamp(int campId,String companyName);
	
	double checkProductDiscountById(int productId);
	
	int applyProductWithCamp(ApplyBean apply, int campaignId);
	
	void pushCampaign(int campId) throws Exception;
	
	void updateProductDiscount();
}
