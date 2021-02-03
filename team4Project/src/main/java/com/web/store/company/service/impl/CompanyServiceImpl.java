package com.web.store.company.service.impl;

import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.store.company.dao.CmpServiceDao;
import com.web.store.company.dao.CompanyDao;
import com.web.store.company.model.CmpService;
import com.web.store.company.model.Company;
import com.web.store.company.service.CmpServiceService;
import com.web.store.company.service.CompanyService;

@Service
@Transactional
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	CompanyDao cmpDao;
	
	@Autowired
	CmpServiceDao cmpsvDao;
	
	@Autowired
	CmpServiceService cmpsvService;
	
	@Override
	public boolean addCompany(Company cmp) {
		String cmpName = cmp.getCompanyName();
		String uniN = cmp.getUniformNumbers();
		String cmpAcc = cmp.getAccount();
		if(cmpDao.getCompanyByName(cmpName)&&cmpDao.getCompanyByUniformNum(uniN)&&(cmpDao.getCompanyByAccount(cmpAcc)==null)) {
					cmpDao.addcompany(cmp);
					return true;
		}else {
			return false;
		}
		
	}

	@Override
	public Company getCompany(String Account) {
		
		return cmpDao.getCompanyByAccount(Account);
	}

	@Override
	public List<Company> getAllCompany() {
		return cmpDao.getAllCompany();
	}

	@Override
	public Company verifyLogin(String account, String password) {
		
		return cmpDao.verifyLogin(account, password);
	}

	@Override
	public boolean updateCompany(Company cmp) {
		
		return cmpDao.update(cmp);
	}
	//更新企業(不附圖)
	@Override
	public boolean updateCompanyWithoutLogo(Company cmp) {
		
		return cmpDao.updateWithoutLogo(cmp);
	}

	@Override
	public Company getCompanyById(Integer id) {
		Company cmp = cmpDao.getCompanyById(id);
//		Hibernate.initialize(cmp.getCampaigns());
//		Hibernate.initialize(cmp.getStores());
		return cmp;
//		return cmpDao.getCompanyById(id);
	}

	@Override
	public boolean statusCheck(Integer id) {
		
		return cmpDao.statusCheck(id);
	}

	@Override
	public boolean updateProfiles(Integer id, String profiles) {
		
		return cmpDao.updateProfiles(id,profiles);
	}

	@Override
	public Set<CmpService> getCompanyService(Integer id) {
		
		Set<CmpService> cmpsv = cmpDao.getAllServiceBycmpId(id);
	
		return cmpsv;
	}
	
	

}
