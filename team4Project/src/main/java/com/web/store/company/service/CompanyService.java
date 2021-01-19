package com.web.store.company.service;

import java.util.List;

import com.web.store.company.model.Company;

public interface CompanyService {
	//註冊企業(包含驗證是否新增成功)
	boolean addCompany(Company cmp);
	//顯示企業資訊(提供修改)
	Company getCompany(String Account);
	//平台顯示合作企業
	List<Company> getAllCompany();
	//登入功能驗證帳號密碼
	Company verifyLogin(String account, String password);
	//更新企業資料
	boolean updateCompany(Company cmp);
	
}
