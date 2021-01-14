package com.web.store.company.dao;

import java.util.List;

import com.web.store.company.model.Company;

public interface CompanyDao {
	/////////////////////註冊功能////////////////////////
	void addcompany(Company cmp);
	
	boolean  getCompanyByName(String Company);
	
	boolean  getCompanyByUniformNum(String uniformNumbers);
	
	Company  getCompanyByAccount(String Account);
	/////////////////////註冊功能////////////////////////
	
	boolean update(Company cmp);
	
	boolean delete(Company cmp);
	
	List<Company> getAllCompany();
 	
	
}
