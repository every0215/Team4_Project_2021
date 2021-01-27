package com.web.store.company.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.campaign.model.Campaign;
import com.web.store.company.dao.StoreDao;
import com.web.store.company.model.Company;
import com.web.store.company.model.Store;

@Repository
public class StoreDaoImpl implements StoreDao {

	
	@Autowired
	SessionFactory sessionFactory;
	
	
	@Override
	public void addStore(Store sto) {
		Session session = sessionFactory.getCurrentSession();
		
		session.save(sto);

	}

	@Override
	public boolean update(Store sto) {
		Session session = sessionFactory.getCurrentSession();
		System.out.println("StoreDao-Company物件轉Id"+sto.getCompany());
		Query queryObj = session.createQuery("UPDATE Store SET  StoreName = :newStoreName , StoreArea = :newStoreArea , StoreAddress = :newStoreAddress , Phone = :newPhone ,Fex = :newFex , BusinessHour = :newBusinessHour ,Openhour = :newOpenhour ,Closehour = :newClosehour ,CompanyId = :newCompanyId ,Profiles = :newProfiles ,Status = :newStatus WHERE id = :Sid")
				.setParameter("Sid", sto.getId())
				.setParameter("newStoreName",sto.getStoreName() )
				.setParameter("newStoreArea", sto.getStoreArea())
				.setParameter("newStoreAddress",sto.getStoreAddress() )
				.setParameter("newPhone", sto.getPhone())
				.setParameter("newFex", sto.getFex())
				.setParameter("newBusinessHour", sto.getBusinessHour())
				.setParameter("newOpenhour", sto.getOpenhour())
				.setParameter("newClosehour", sto.getClosehour())
				////////////////////////////////////////////////////////
				.setParameter("newCompanyId", sto.getCompany())
				.setParameter("newProfiles", sto.getProfiles())
				.setParameter("newStatus", sto.getStatus());
				
				queryObj.executeUpdate();
				return true;

		
//		Store queryResult = null;
//		if(sto.getId()!=null) {
//			queryResult = session.get(Store.class, sto.getId());
//			session.evict(queryResult); //清除session的緩存，因為get
//		}
//		
//		if(queryResult != null) {
//			session.update(sto);
//			return true;
//		}
//		
//		return false;
		
	}

	@Override
	public List<Store> getAllStoreByCompanyId(Integer companyId) {
		

		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Store where CompanyId = :CompanyId";
		Query<Store> queryObj = session.createQuery(hqlstr,Store.class);
		queryObj.setParameter("CompanyId", companyId);
		
		return queryObj.list();	
		
		
	}

	@Override
	public List<Store> getStoreByArea(String storeArea) {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Store where StoreArea = :storeArea";
		Query<Store> queryObj = session.createQuery(hqlstr,Store.class);
		queryObj.setParameter("StoreArea", storeArea);
		
		return queryObj.list();	
	
	}

	@Override
	public List<Store> getStoreByName(String storeName) {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Store where StoreName = :storeName";
		Query<Store> queryObj = session.createQuery(hqlstr,Store.class);
		queryObj.setParameter("StoreName", storeName);
		
		return queryObj.list();	
	}

	@Override
	public boolean updateStatus(Integer id,Boolean status) {
		Session session = sessionFactory.getCurrentSession();
		
		Query queryObj = session.createQuery("UPDATE Store SET  Status = :newStatus WHERE Id = :Sid")
				.setParameter("Sid", id)
				.setParameter("newStatus", status);
		
		queryObj.executeUpdate();
		return true;
	}
	@Override
	public boolean updateProfiles(Integer id,String profiles) {
		Session session = sessionFactory.getCurrentSession();
		System.out.println("更新門市簡介");
		System.out.println(id);
		Query queryObj = session.createQuery("UPDATE Store SET  Profiles = :newProfiles WHERE Id = :Sid")
				.setParameter("Sid", id)
				.setParameter("newProfiles", profiles);
		
		queryObj.executeUpdate();
		return true;
	}

	@Override
	public Store getStoreById(Integer id) {
		
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Store where Id = :newId";
		Query<Store> queryObj = session.createQuery(hqlstr,Store.class);
		queryObj.setParameter("newId", id);
		return queryObj.getSingleResult();
		
	}
	
	
	
	
	
	@Override
	public boolean delete(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Store queryResult = session.get(Store.class, id);
		if(queryResult!=null) {
			session.delete(queryResult);
			return  true;
		}
		
		return false;
	}

	
	
	
	
	
	//沒在用
	@Override
	public void updated(Store sto) {
		//成功回傳1，失敗回傳0
		Session session = sessionFactory.getCurrentSession();
		
//		Store queryResult = null;
//		if(sto.getId()!=null) {
//			queryResult = session.get(Store.class, sto.getId());
//			session.evict(queryResult); //清除session的緩存，因為get
//		}
	    session.flush();
		session.saveOrUpdate(sto);
		
	}


}
