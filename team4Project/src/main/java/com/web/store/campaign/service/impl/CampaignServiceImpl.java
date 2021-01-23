package com.web.store.campaign.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.transaction.Transactional;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.store.campaign.dao.CampaignDao;
import com.web.store.campaign.model.Campaign;
import com.web.store.campaign.model.Page;
import com.web.store.campaign.model.SearchBean;
import com.web.store.campaign.service.CampaignService;
import com.web.store.product.model.Product;
import com.web.store.product.service.ProductService;



@Service
@Transactional
public class CampaignServiceImpl implements CampaignService {
	
	@Autowired
	CampaignDao campDao;
	@Autowired
	ProductService productService;
	
	@Override
	public int insert(Campaign camp) {
		return campDao.insert(camp);
	}

	@Override
	public Campaign getCampaignById(int campId) {
		Campaign camp = campDao.getCampaignById(campId);
		Hibernate.initialize(camp);
		return camp;
	}
	
	@Override
	public List<Campaign> getAllCampaign() {
		return campDao.getAllCampaign();
	}

	@Override
	public List<Campaign> getCampaignByCompanyId(int companyId) {
		return campDao.getCampaignByCompanyId(companyId);
	}

	@Override
	public List<Campaign> getCampaignByMember(int memberId) {
		return null;
	}

	@Override
	public List<Campaign> getCampaignByLaunchStatus(boolean status) {
		return campDao.getCampaignByLaunchStatus(status);
	}

	@Override
	public int deleteById(int id) {
		return campDao.deleteById(id);
	}

	@Override
	public int update(Campaign camp) {
		return campDao.update(camp);
	}

	@Override
	public int getTotalPage() {
		return campDao.getTotalPage();
	}

	@Override
	public int getTotalPageByCompanyId(int id) {
		return campDao.getTotalPageByCompanyId(id);
	}

	@Override
	public List<Campaign> getActiveCampaign(List<Campaign> list) {
		List<Campaign> resultList = new ArrayList<Campaign>();
		for(Campaign camp:list) {
			if(camp.isActive()) {
				resultList.add(camp);
			}
		}
		return resultList;		
	}

	@Override
	public List<Campaign> getActiveCampaignByCompanyId(int companyId) {
		List<Campaign> resultList = getActiveCampaign(getCampaignByCompanyId(companyId));
		return resultList;
	}

	@Override
	public Page<Campaign> searchCampaignOfCompany(int companyId, SearchBean search, Page<Campaign> page) {
		
		return campDao.serchCampaignOfCompany(companyId, search, page);
	}

	@Override
	public Long getTotalCampCountOfCompany(int companyId) {	
		return campDao.getTotalCampCountOfCompany(companyId);
	}

	@Override
	public Page<Campaign> getCampaignPageOfCompany(Page<Campaign> page,int companyId) {

		return campDao.getPageByCompanyId(page, companyId);
	}

	@Override
	//排程任務呼叫的method，確認全部活動狀態，進行中、已過期之判斷
	public void checkCampaignStatus() {
		List<Campaign> camps = campDao.getAllCampaign();
		for(Campaign camp:camps) {
			camp.isActive();
			camp.isExpired();
		}
	}

	@Override
	public List<Campaign> getRandomCampaignbyCompany(int companyId, int count) {
		return campDao.getRandomCampaignbyCompany(companyId, count);
	}

	@Override
	public Page<Campaign> getActiveCampaignPageByCompany(Page<Campaign> page, int companyId) {
		return campDao.getActiveCampaignPageByCompany(page, companyId);
	}

	@Override
	public double checkProductDiscountById(int productId) {
		String productIdStr = String.valueOf(productId);
		Product product = productService.getProduct(productIdStr);
		Hibernate.initialize(product);
		Set<Campaign> campOfProduct = product.getCampaigns();
		double lowestDiscount = 1;
		for(Campaign camp:campOfProduct) {
			
			//當活動類型是折扣，活動進行中才判斷
			if(camp.getDiscountParams().getType()==1 && camp.getStatus() && !camp.getExpired()) {			
				if(camp.getDiscountParams().getOffParam()!=null) {
					double OffParam = camp.getDiscountParams().getOffParam();
					if(OffParam<lowestDiscount) {
						lowestDiscount = OffParam;
					}		
				}					
			}		
		}
		return lowestDiscount;
	}
		
}
