package com.web.store.campaign.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.campaign.dao.CampaignDao;
import com.web.store.campaign.model.Campaign;




@Repository
public class CampaignDaoImpl implements CampaignDao {
	
	@Autowired
	SessionFactory sessionFactory;
	
	int resultPerPage = 6;//每頁的數量
	
	@Override
	public int add(Campaign camp) {
	//成功回傳1，失敗回傳0	
		
		Session session = sessionFactory.getCurrentSession();
		
		Campaign resultBean = null;
		
		if(camp.getId() != null) {
			resultBean = session.get(Campaign.class, camp.getId());
		}
		
		if(resultBean == null) {
			session.save(camp);	
		}else {
			return 0;
		}
					
		return 1;		

	}

	@Override
	public Campaign getCampaignById(int campId) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(Campaign.class, campId);
	}

	@Override
	public List<Campaign> getAllCampaign() {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Campaign";
		Query<Campaign> queryObj = session.createQuery(hqlstr,Campaign.class); 			
		return queryObj.list();	
	}

	@Override
	public List<Campaign> getCampaignByCompany(int companyId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Campaign where companyId=:companyId";
		Query<Campaign> queryObj = session.createQuery(hqlstr,Campaign.class);
		return queryObj.setParameter("companyId", companyId).list();
	}

	@Override
	public List<Campaign> getCampaignByStatus(boolean status) {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Campaign where status=:status";
		Query<Campaign> queryObj = session.createQuery(hqlstr,Campaign.class);	
		return queryObj.setParameter("companyId", status).list();
	}

	@Override
	public int deleteById(int id) {
		//成功回傳1，失敗回傳0
		Session session = sessionFactory.getCurrentSession();
		Campaign queryResult = session.get(Campaign.class, id);
		if(queryResult!=null) {
			session.delete(queryResult);
			return 1;
		}
		
		return 0;
	}

	@Override
	public int update(Campaign camp) {
		//成功回傳1，失敗回傳0
		Session session = sessionFactory.getCurrentSession();
		
		Campaign queryResult = null;
		if(camp.getId()!=null) {
			queryResult = session.get(Campaign.class, camp.getId());
			session.evict(queryResult); //清除session的緩存，因為get
		}
		
		if(queryResult != null) {
			session.update(camp);
			return 1;
		}
		
		return 0;
	}


	@Override
	public List<Campaign> getSinglePageResult(int page) {
		
		String hql = "FROM Campaign";
		Session session = sessionFactory.getCurrentSession();
		Query<Campaign> query = session.createQuery(hql,Campaign.class).setMaxResults(resultPerPage).setFirstResult((page-1)*resultPerPage);
		List<Campaign> list = query.list();

		return list;
	}
	
	@Override
	public int getTotalPage() {
		String hql = "SELECT COUNT(*) FROM Campaign";
		Session session = sessionFactory.getCurrentSession();
		int page = (int)Math.ceil((long)session.createQuery(hql).uniqueResult()/(double)resultPerPage);
		return page;
	}


}
