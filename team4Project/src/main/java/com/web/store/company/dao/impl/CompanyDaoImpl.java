package com.web.store.company.dao.impl;

import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.campaign.model.Campaign;
import com.web.store.company.dao.CompanyDao;
import com.web.store.company.model.CmpService;
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
		
//		String hqlstr = "UPDATE Company SET id = :newId , companyName = :newName , logo = :newLogo , logoName = :newLogoName , uniformNumbers = :newUniformNum ,categories = :newCategories , email = :newEmail ,phone = :newPhone ,busRC = :newBusRC ,busRCName = :newBusRCName WHERE id = :Cid";
		
		
		Query queryObj = session.createQuery("UPDATE Company SET  companyName = :newName , logo = :newLogo , logoName = :newLogoName , uniformNumbers = :newUniformNum ,categories = :newCategories , email = :newEmail ,phone = :newPhone ,busRC = :newBusRC ,busRCName = :newBusRCName ,profiles = :newpro WHERE id = :Cid")
		.setParameter("Cid", cmp.getId())
		.setParameter("newName", cmp.getCompanyName())
		.setParameter("newLogo", cmp.getLogo())
		.setParameter("newLogoName", cmp.getLogoName())
		.setParameter("newUniformNum", cmp.getUniformNumbers())
		.setParameter("newCategories", cmp.getCategories())
		.setParameter("newEmail", cmp.getEmail())
		.setParameter("newPhone", cmp.getPhone())
		.setParameter("newBusRC", cmp.getBusRC())
		.setParameter("newBusRCName", cmp.getBusRCName())
		.setParameter("newpro", cmp.getProfiles());
		
		queryObj.executeUpdate();
		return true;

	}
	//更新企業資訊(不更新圖片的狀況)(X)
	@Override
	public boolean updateWithoutLogo(Company cmp) {
		
		Session session = sessionFactory.getCurrentSession();

		Query queryObj = session.createQuery("UPDATE Company SET  companyName = :newName , uniformNumbers = :newUniformNum ,categories = :newCategories , email = :newEmail ,phone = :newPhone WHERE id = :Cid")
				.setParameter("Cid", cmp.getId())
				.setParameter("newName", cmp.getCompanyName())

				.setParameter("newUniformNum", cmp.getUniformNumbers())
				.setParameter("newCategories", cmp.getCategories())
				.setParameter("newEmail", cmp.getEmail())
				.setParameter("newPhone", cmp.getPhone());
		
		
		queryObj.executeUpdate();
		return true;
		
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
	public Company verifyLogin(String account, String password) {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Company where Account = :Account and Password = :Password"; 
		Query<Company> queryObj = session.createQuery(hqlstr,Company.class);
		queryObj.setParameter("Account", account);
		queryObj.setParameter("Password", password);
		Company cmp = queryObj.uniqueResult();
		//確認上架狀態
		if(cmp!=null) {
			if(cmp.getStatus()) {
				return cmp;
			}else {
				return null;
			}
		}else  {
			return null;
		}
	}

	@Override
	public Company getCompanyById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Company where Id = :id";
		Query<Company> queryObj = session.createQuery(hqlstr,Company.class);
		queryObj.setParameter("id", id);
//		return queryObj.uniqueResult();
		Company cmp = queryObj.uniqueResult();
		
		if(cmp!=null) {
			if(cmp.getStatus()) {
				return cmp;
			}else {
				return null;
			}
		}else  {
			return null;
		}
		
	
	}

	@Override
	public boolean statusCheck(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Company where Id = :id";
		Query<Company> queryObj = session.createQuery(hqlstr,Company.class);
		queryObj.setParameter("id", id);
		Company cmp = queryObj.uniqueResult();
		
		if(cmp == null) {
			return false;
		}else {
			boolean chk = cmp.getStatus();
			
			if(chk) {
				return true;
				
			}else {
				return false;
				
			}
			
		}

//		boolean chk = cmp.getStatus();
//		
//		
//		
//		
//		if(chk) {
//			return true;
//			
//		}else {
//			return false;
//			
//		}
	}

	@Override
	public boolean updateProfiles(Integer id, String profiles) {
		Session session = sessionFactory.getCurrentSession();
		System.out.println("更新企業簡介");
		System.out.println(id);
		Query queryObj = session.createQuery("UPDATE Company SET  Profiles = :newProfiles WHERE Id = :Cid")
				.setParameter("Cid", id)
				.setParameter("newProfiles", profiles);
		
		queryObj.executeUpdate();
		return true;
		
	}
	
	@Override
	public Set<CmpService> getAllServiceBycmpId(Integer cmpId) {
		Session session = sessionFactory.getCurrentSession();
		System.out.println("1");
		String hqlstr = "from Company c join fetch c.cmpServiceC where c.id = :CmpId";
		System.out.println("2");
		Query queryObj = session.createQuery(hqlstr,Company.class); 			
		System.out.println("3");
		queryObj.setParameter("CmpId", cmpId);
		System.out.println("4");
		Company cmp = (Company) queryObj.uniqueResult();
		System.out.println("5");
		 Set<CmpService> serve = cmp.getCmpServiceC();
		return serve;
	}
	
}
