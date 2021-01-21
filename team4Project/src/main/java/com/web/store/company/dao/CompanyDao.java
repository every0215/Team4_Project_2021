package com.web.store.company.dao;

import java.util.List;

import com.web.store.company.model.Company;

public interface CompanyDao {
	/////////////////////註冊功能////////////////////////
	//新增企業
	void addcompany(Company cmp);
	//驗證註冊
	boolean  getCompanyByName(String companyName);
	//驗證註冊
	boolean  getCompanyByUniformNum(String uniformNumbers);
	//驗證註冊,忘記密碼用來拿信箱
	Company  getCompanyByAccount(String Account);
	/////////////////////註冊功能////////////////////////
	
	/////////////////////登入功能////////////////////////
	//驗證登入帳號
	Company verifyLogin(String account , String password);
	
	//update驗證碼進(驗證碼By email)
	
	//update密碼by account
	
	/////////////////////登入功能////////////////////////
	
	/////////////////////後台功能////////////////////////
	//修改企業資訊,更改上下架狀態,改驗證碼,新增簡介 By id或name
	boolean update(Company cmp);
	//刪除企業資料
	boolean delete(Company cmp);
	//顯示合作企業
	List<Company> getAllCompany();
	//登出
	
	/////////////////////後台功能////////////////////////
	
//	簡介修改 特定Service新增
//	簡介修改 特定Service新增
//	簡介修改 特定Service新增
//	簡介修改 特定Service新增
//	簡介修改 特定Service新增
//	簡介修改 特定Service新增
//	簡介修改 特定Service新增
//	簡介修改 特定Service新增
	
	
	
	
 	
	
}
