package com.web.store.company.service.impl;




import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import java.util.Set;

import javax.transaction.Transactional;

import org.hibernate.Hibernate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.store.company.dao.CompanyDao;
import com.web.store.company.dao.StoreDao;
import com.web.store.company.model.CmpService;
import com.web.store.company.model.Company;
import com.web.store.company.model.Store;
import com.web.store.company.service.CmpServiceService;
import com.web.store.company.service.CompanyService;
import com.web.store.company.service.StoreService;

@Service
@Transactional
public class StoreServiceImpl implements StoreService {

	@Autowired
	StoreDao stoDao;
	
	@Autowired
	CompanyDao cmpDao;
	
	@Autowired
	CmpServiceService cmpsvService;
	
	@Autowired
	CompanyService cmpService;
	
	@Override
	public List<Store> getAllStoreByCompanyId(Integer companyId) {
		boolean chk = cmpService.statusCheck(companyId);
		
		if(chk) {
			System.out.println("企業上架中");
			return stoDao.getAllStoreByCompanyId(companyId);
			
		}else {
			return null;
		}
	}

	@Override
	public boolean addStore(Store sto) {
		
		stoDao.addStore(sto);
		return true;
		
	}

	@Override
	public boolean updateStatus(Integer id, Boolean status) {
		
		return stoDao.updateStatus(id, status);
	}
	@Override
	public boolean updateProfiles(Integer id, String profiles) {
		
		return stoDao.updateProfiles(id, profiles);
	}

	@Override
	public boolean update(Store sto) {
		
		return stoDao.update(sto);
	}

	@Override
	public Store getStoreById(Integer id) {
		
		return stoDao.getStoreById(id);
	}

	@Override
	public void updated(Store sto) {
		
	if(stoDao.delete(sto.getId())) {
		stoDao.addStore(sto);
	}else {
	stoDao.addStore(sto);
	}	
		
	}

	@Override
	public boolean combineStoreService(String[] svid, Integer stoid) {
		//取出原來的關聯remove
		//取出原來的關聯remove
		
		Store sto = getStoreById(stoid);
		
		Set<CmpService> set = sto.getCmpServiceS();
		//初始化
		Hibernate.initialize(set);
//		System.out.println("set:============================="+set.iterator().next());
		
		Iterator<CmpService> it = set.iterator();
		
		while(it.hasNext()) {
//			System.out.println("it=================================="+it.next());
			CmpService it1 = it.next();
			//有關連就刪
			it.remove();
		}
		
		
		//新增新的關聯
		//新增新的關聯
		
		Set<CmpService> newset = new HashSet<CmpService>();
		
		for(String svId : svid) {
			CmpService cmpsv = cmpsvService.getCmpsvBysvId(Integer.valueOf(svId));
			newset.add(cmpsv);
		}
		
		sto.setCmpServiceS(newset);
	
		return true;
	}

	@Override
	public Set<Store> getStoreByService(String[] id) {
		
		for(String svId : id) {
			CmpService cmpsv = cmpsvService.getCmpsvBysvId(Integer.valueOf(svId));
			
		}
		//遍歷從Service取store 有重複就塞到新的set
		
		//取store 有Service id才加入set  (VVV)
		//HQL select store where cmpsvId = 123
		
		
		return null;
	}
	//地圖取storeByArea
	@Override
	public List<Store> getStoreByArea(String cmpid, String area) {
		System.out.println(cmpid);
		System.out.println(area);
		Integer tempcmpid = Integer.parseInt(cmpid);
		System.out.println(tempcmpid == 0);
		
		if(tempcmpid == 0 && area.equals("0")) {
			return null;
			
		}else if(tempcmpid == 0 && !area.equals("0")) {
			
			List<Store> stor = stoDao.getStoreByOnlyArea(area);
			
			return stor;
		}
		else if(tempcmpid != 0 && area.equals("0")){
			List<Store> sto = stoDao.getAllStoreByCompanyId(tempcmpid);
			
			return sto;
		}
		else {
			Company cmp = cmpDao.getCompanyById(tempcmpid);
			List<Store> store = stoDao.getStoreByArea(cmp,area);

			return store;
		}
	}

	@Override
	public Store getStoreByMarker(String lat, String lng) {
		
		Double latd= Double.parseDouble(lat);
		Double lngd = Double.parseDouble(lng);
		
		return stoDao.getStoreByMarker(latd, lngd);
	}

	@Override
	public List<Store> getStoreByName(String cmpid, String stoName) {
		Integer tempcmpid = Integer.parseInt(cmpid);
		
		if(tempcmpid == 0) {
			List<Store> store = stoDao.getStoreByOnlyName(stoName);
			System.out.println("cmpid = 0 Service return"+store);
			return store;
		}else {
			List<Store> stor = stoDao.cmpGetStoreByName(tempcmpid,stoName);
			System.out.println("Service return"+stor);

			return stor;
		}
		
		
		
	}

	
	
	
	
}
