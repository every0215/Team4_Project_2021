package com.web.store.company.dao.impl;

import java.util.List;




import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.campaign.model.Campaign;
import com.web.store.company.dao.CompanyDao;
import com.web.store.company.model.Company;



//上下架的狀態判斷要寫在這裡


//企業的DAO
@Repository
public class CompanyDaoImpl implements CompanyDao {

	@Autowired
	SessionFactory sessionFactory;
	
	///////////////////////////////////////註冊功能///////////////////////////////////////
	
	//企業註冊資料(做好三個驗證)
	@Override
	public void addcompany(Company cmp) {

		Session session = sessionFactory.getCurrentSession();

		session.save(cmp);
		

	}

	//驗證企業名稱是否重複(才可新增)
	@Override
	public boolean getCompanyByName(String companyName) {
		
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Company where CompanyName = :companyName";
		Query<Company> queryObj = session.createQuery(hqlstr,Company.class);
		queryObj.setParameter("companyName", companyName);
		if(queryObj.uniqueResult()!=null) {
			return false;			
		}else {
			return true;
		}
	}

	//驗證統編是否重複(才可新增)
	@Override
	public boolean getCompanyByUniformNum(String uniformNumbers) {
		
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Company where UniformNumbers = :UniformNumbers";
		Query<Company> queryObj = session.createQuery(hqlstr,Company.class);
		queryObj.setParameter("UniformNumbers", uniformNumbers);
		
		if(queryObj.uniqueResult()!=null) {
			return false;			
		}else {
			return true;
		}
		
	}

	//驗證帳號是否重複(才可新增)
	@Override
	public Company getCompanyByAccount(String account) {
		
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Company where Account = :Account";
		Query<Company> queryObj = session.createQuery(hqlstr,Company.class);
		queryObj.setParameter("Account", account);
		return queryObj.uniqueResult();
		
		
	}
	///////////////////////////////////////註冊功能///////////////////////////////////////

	//更新企業資訊(要多寫一個用來更改企業狀態上下架)
	@Override
	public boolean update(Company cmp) {
		
		Session session = sessionFactory.getCurrentSession();

		Company comp = session.get(Company.class, cmp.getId());
		if(comp!=null) {
			session.update(cmp);
			System.out.println("update success");
			return true;
		}else {
			System.out.println("No data can be update");
			return false;
		}
	}

	//刪除企業資料
	@Override
	public boolean delete(Company cmp) {
		
		Session session = sessionFactory.getCurrentSession();
		Company comp = session.get(Company.class, cmp.getId());
		if(comp!=null) {
			session.delete(comp);
			System.out.println("delete success");
		}else {
			System.out.println("No data can be deleted");
		}
		
		return true;
	}
	

	//Show合作企業以及平台管理者查詢
	@Override
	public List<Company> getAllCompany() {
		
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Company";
		Query<Company> queryObj = session.createQuery(hqlstr,Company.class); 			
		return queryObj.list();	
	}

	@Override
	public boolean verifyLogin(String account, String password) {
		// TODO Auto-generated method stub
		return false;
	}
	
	

}
