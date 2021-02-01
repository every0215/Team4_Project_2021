package com.web.store.company.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.campaign.model.Campaign;
import com.web.store.company.dao.StoreDao;
import com.web.store.company.model.Company;
import com.web.store.company.model.Store;
import com.web.store.company.model.StoreService;

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
	public List<Store> getStoreByArea(Company cmp,String area) {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Store where StoreArea = :storeArea and CompanyId = :companyId";
		System.out.println(cmp);
		System.out.println(area);
		Query<Store> queryObj = session.createQuery(hqlstr,Store.class);
		queryObj.setParameter("storeArea", area);
		queryObj.setParameter("companyId", cmp.getId());
		
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

	@Override
	public List<Store> getStoreByOnlyArea(String area) {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Store where StoreArea = :storeArea";
		Query<Store> queryObj = session.createQuery(hqlstr,Store.class);
		queryObj.setParameter("storeArea", area);
		
		
		return queryObj.list();	
	}

	@Override
	public Store getStoreByMarker(Double lat, Double lng) {
		System.out.println(lat);
		System.out.println(lng);
		
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Store where Lat = :lat and Lng = :lng";
		Query<Store> queryObj = session.createQuery(hqlstr,Store.class);
		queryObj.setParameter("lat", lat);
		queryObj.setParameter("lng", lng);
		System.out.println(queryObj.getSingleResult());
		return queryObj.getSingleResult();
	}

	@Override
	public List<Store> getStoreByOnlyName(String stoName) {
		System.out.println(stoName);
		Session session = sessionFactory.getCurrentSession();
		System.out.println(1);
		String hqlstr = "from Store where StoreName like :storeName";
		System.out.println(2);
		Query<Store> queryObj = session.createQuery(hqlstr,Store.class);
		System.out.println(3);
		queryObj.setParameter("storeName", "%"+stoName+"%");
		System.out.println(4);
		System.out.println(queryObj.list());
		
		return queryObj.list();	
		
	}

	@Override
	public List<Store> cmpGetStoreByName(Integer tempcmpid, String stoName) {
		
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Store where  CompanyId = :companyId and StoreName like :storeName";
		Query<Store> queryObj = session.createQuery(hqlstr,Store.class);
		queryObj.setParameter("companyId", tempcmpid);
		queryObj.setParameter("storeName", "%"+stoName+"%");

		
		return queryObj.list();	
	}
	//, COUNT(*) as cnt
	@Override
	public List<Integer> getStoreByService(List<Integer> intList) {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr ="";
		for (int i:intList) {
			hqlstr+="select storeid from StoreService where serviceid in ("+i+") intersect ";
		}
		hqlstr=hqlstr.substring(0,hqlstr.lastIndexOf(" intersect "));
		
		//		String hqlstr = "SELECT StoreId FROM StoreService where serviceId in (" + getCollectIntString(intList) + ") GROUP BY storeId having count(*) = intList.length()";
		List<Integer> queryObj = session.createSQLQuery(hqlstr).getResultList();
//		queryObj.setParameter("ServiceId", companyId);
		//stoid list
//		System.out.println(queryObj.list());
		return queryObj;
//		.uniqueResult();
		
		
	}
	
	//轉List<Integer> to 3,4,5
	private String getCollectIntString(List<Integer> intList) {
		List<String> strList = new ArrayList<>();
		for (Integer tInt : intList) {
			strList.add(tInt.toString());
		}
		
		String result = strList.stream().collect(Collectors.joining(","));
//		System.out.println("result = " + result);
		return result;
	}
}
