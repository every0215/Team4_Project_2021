package com.web.store.campaign.service.impl;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.store.campaign.dao.CampaignDao;
import com.web.store.campaign.model.Campaign;
import com.web.store.campaign.service.CampaignService;



@Service
@Transactional
public class CampaignServiceImpl implements CampaignService {
	
	@Autowired
	CampaignDao campDao;
	
	@Override
	public int add(Campaign camp) {
		return campDao.add(camp);
	}

	@Override
	public Campaign getCampaignById(int campId) {
		return campDao.getCampaignById(campId);
	}
	
	@Override
	public List<Campaign> getAllCampaign() {
		return campDao.getAllCampaign();
	}

	@Override
	public List<Campaign> getCampaignByCompany(int companyId) {
		return campDao.getCampaignByCompany(companyId);
	}

	@Override
	public List<Campaign> getCampaignByMember(int memberId) {
		return null;
	}

	@Override
	public List<Campaign> getCampaignByStatus(boolean status) {
		return campDao.getCampaignByStatus(status);
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
	public List<Campaign> getPageCampaign(int page) {
	
		return campDao.getSinglePageResult(page);
		
	}
	
	
}
