package com.web.store.campaign.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.store.campaign.dao.CampaignDao;
import com.web.store.campaign.model.Campaign;
import com.web.store.campaign.model.Page;
import com.web.store.campaign.model.SearchBean;
import com.web.store.campaign.service.CampaignService;



@Service
@Transactional
public class CampaignServiceImpl implements CampaignService {
	
	@Autowired
	CampaignDao campDao;
	
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
		
}
