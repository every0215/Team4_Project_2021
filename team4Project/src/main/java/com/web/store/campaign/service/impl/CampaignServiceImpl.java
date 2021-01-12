package com.web.store.campaign.service.impl;

import java.util.ArrayList;
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
	public int insert(Campaign camp) {
		return campDao.insert(camp);
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
	public List<Campaign> getSinglePageResult(int page) {
		return campDao.getSinglePageResult(page);		
	}

	@Override
	public int getTotalPageByCompanyId(int id) {
		return campDao.getTotalPageByCompanyId(id);
	}

	@Override
	public List<Campaign> getSinglePageResultByCompayId(int page, int companyId) {
		return campDao.getSinglePageResultByCompanyId(page, companyId);
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
		
}
