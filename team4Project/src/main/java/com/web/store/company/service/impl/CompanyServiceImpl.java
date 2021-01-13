package com.web.store.company.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.store.company.dao.CompanyDao;
import com.web.store.company.model.Company;
import com.web.store.company.service.CompanyService;

@Service
@Transactional
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	CompanyDao cmpDao;
	
	@Override
	public boolean addCompany(Company cmp) {
		String cmpName = cmp.getCompany();
		String uniN = cmp.getUniformNumbers();
		String cmpAcc = cmp.getAccount();
		if(cmpDao.getCompanyByName(cmpName)) {
			if(cmpDao.getCompanyByUniformNum(uniN)) {
				if(cmpDao.getCompanyByAccount(cmpAcc)==null) {
					cmpDao.addcompany(cmp);
					return true;
				}else {
					return false;
				}
			}else {
				return false;
			}
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

}
