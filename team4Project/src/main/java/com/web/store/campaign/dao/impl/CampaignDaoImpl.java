package com.web.store.campaign.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.account.javabean.MemberBean;
import com.web.store.account.javabean.MemberSubscription;
import com.web.store.campaign.dao.CampaignDao;
import com.web.store.campaign.model.Campaign;
import com.web.store.campaign.model.Page;
import com.web.store.campaign.model.SearchBean;
import com.web.store.company.model.Company;




@Repository
public class CampaignDaoImpl implements CampaignDao {
	
	@Autowired
	SessionFactory sessionFactory;
	
	//每頁的數量
	final static int RESULT_PER_PAGE = 6;
	
	@Override
	public int insert(Campaign camp) {
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
	public List<Campaign> getCampaignByCompanyId(int companyId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Campaign where companyId=:companyId";
		Query<Campaign> queryObj = session.createQuery(hqlstr,Campaign.class);
		return queryObj.setParameter("companyId", companyId).list();
	}

	@Override
	public List<Campaign> getCampaignByLaunchStatus(boolean launchStatus) {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Campaign where launchStatus=:launchStatus";
		Query<Campaign> queryObj = session.createQuery(hqlstr,Campaign.class);	
		return queryObj.setParameter("companyId", launchStatus).list();
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
	public int getTotalPage() {
		String hql = "SELECT COUNT(*) FROM Campaign";
		Session session = sessionFactory.getCurrentSession();
		int page = (int)Math.ceil((long)session.createQuery(hql).uniqueResult()/(double)RESULT_PER_PAGE);
		return page;
	}

	@Override
	public int getTotalPageByCompanyId(int compayId) {
		String hql = "SELECT COUNT(*) FROM Campaign WHERE companyId=:companyId";
		Session session = sessionFactory.getCurrentSession();
		int pageCount = (int)Math.ceil((long)session.createQuery(hql).setParameter("companyId", compayId).uniqueResult()/(double)RESULT_PER_PAGE);
		return pageCount;
	}

	@Override
	public Page<Campaign> serchCampaignOfCompany(int companyId, SearchBean search, Page<Campaign> page) {
		
		String searchStr = search.getSearchStr();
		Query<Campaign> query = null;
		Session session = sessionFactory.getCurrentSession();
		
		String hql = "FROM Campaign where companyId=:companyId ";
				
		if(search.getByDate()) {
			hql += "and startDateTime>=:startDateTime "
					+ "and endDateTime<=:endDateTime ";
		}
		
		if(searchStr.trim().equals("")) {
			switch(search.getStatus()) {
				case 0:
					System.out.println("-------------1");
					System.out.println(hql);
					hql += "ORDER BY updateTime DESC ";
					query = session.createQuery(hql,Campaign.class);
					break;
				case 1:					
					hql += "and launchStatus=:launchStatus and status=false and expired=false ";
					hql += "ORDER BY updateTime DESC ";
					query = session.createQuery(hql,Campaign.class);
					query.setParameter("launchStatus", true);
					break;
				case 2:
					hql += "and launchStatus=:launchStatus and status=false and expired=false ";
					hql += "ORDER BY updateTime DESC ";
					query = session.createQuery(hql,Campaign.class);
					query.setParameter("launchStatus", false);
					break;
				case 3:
					hql += "and status=true and expired=false ";
					hql += "ORDER BY updateTime DESC ";
					query = session.createQuery(hql,Campaign.class);
					break;
				case 4:
					hql += "and status=true and expired=true ";
					hql += "ORDER BY updateTime DESC ";
					query = session.createQuery(hql,Campaign.class);
					break;
			}
			
		}else {
			hql += "and name like :searchStr ";
			switch(search.getStatus()) {
				case 0:
					hql += "ORDER BY updateTime DESC ";
					query = session.createQuery(hql,Campaign.class);
					break;
				case 1:
					hql += "and launchStatus=:launchStatus and status=false and expired=false ";
					hql += "ORDER BY updateTime DESC ";
					query = session.createQuery(hql,Campaign.class);
					query.setParameter("launchStatus", true);				
					break;
				case 2:
					hql += "and launchStatus=:launchStatus and status=false and expired=false ";
					hql += "ORDER BY updateTime DESC ";
					query = session.createQuery(hql,Campaign.class);
					query.setParameter("launchStatus", false);
					break;
				case 3:
					hql += "and status=true and expired=false ";
					hql += "ORDER BY updateTime DESC ";
					query = session.createQuery(hql,Campaign.class);
					break;
				case 4:
					hql += "and status=true and expired=true ";
					hql += "ORDER BY updateTime DESC ";
					query = session.createQuery(hql,Campaign.class);
					break;
			}
			query.setParameter("searchStr", "%"+searchStr+"%");
		}
		
		if(search.getByDate()) {
			query.setParameter("startDateTime", search.getStrDate());
			query.setParameter("endDateTime", search.getEndDate());
		}
		
		query.setParameter("companyId", companyId);
		

		int totalResult = query.list().size();
		int pageSize = page.getPageSize();
		int totalPage = (int)Math.ceil((double)totalResult/pageSize);	
		List<Campaign> camps = query.setMaxResults(page.getPageSize()).setFirstResult((page.getCurrentPage()-1)*page.getPageSize()).list();
		page.setContent(camps);
		page.setTotalpage(totalPage);
		page.setTotalResultCount(totalResult);
		
		return page;
	}

	@Override
	public Long getTotalCampCountOfCompany(int companyId) {
		String hql = "SELECT COUNT(*) FROM Campaign WHERE companyId=: companyId";
		Session session = sessionFactory.getCurrentSession();
		return (Long) session.createQuery(hql).setParameter("companyId", companyId).uniqueResult();
	}

	@Override
	public Page<Campaign> getPageByCompanyId(Page<Campaign> page,int companyId) {
		String hql = "SELECT COUNT(*) FROM Campaign WHERE companyId=:companyId";
		String hql2 = "FROM Campaign WHERE companyId=:companyId ORDER BY updateTime DESC";
		Session session = sessionFactory.getCurrentSession();
		int totalPage = (int)Math.ceil((long)session.createQuery(hql).setParameter("companyId", companyId).uniqueResult()/(double)page.getPageSize());
		System.out.println("dao正在查詢campaigns");
		List<Campaign> camps = session.createQuery(hql2,Campaign.class)
									  .setParameter("companyId", companyId)
									  .setMaxResults(page.getPageSize())
									  .setFirstResult((page.getCurrentPage()-1)*page.getPageSize())
									  .list();
		System.out.println("dao查詢campaigns完成");
		page.setContent(camps);
		page.setTotalpage(totalPage);
		page.setTotalResultCount((int)(long)getTotalCampCountOfCompany(companyId));
		return page;
	}

	@Override
	public List<Campaign> getRandomCampaignbyCompany(int companyId, int count) {
		String hql = "From Campaign Where status=true "
				+ "and expired=false "
				+ "and companyId=:companyId "
				+ "ORDER BY NEWID()";
		Session session = sessionFactory.getCurrentSession();
		Query<Campaign> query = session.createQuery(hql,Campaign.class);
		query.setParameter("companyId", companyId)
		.setMaxResults(count);
		return query.list();
	}

	@Override
	public Page<Campaign> getActiveCampaignPageByCompany(Page<Campaign> page, int companyId) {
		String hql = "From Campaign Where status=true "
				+ "and expired=false "
				+ "and companyId=:companyId ";
		String hql2 = "SELECT COUNT(*) " + hql;
		hql += "ORDER BY startDateTime DESC";
		Session session = sessionFactory.getCurrentSession();
		int pageSize = page.getPageSize();
		int currentPage = page.getCurrentPage();
		Query<Campaign> query = session.createQuery(hql,Campaign.class);
		List<Campaign> list = query.setParameter("companyId", companyId)
		.setMaxResults(pageSize).setFirstResult((currentPage-1)*pageSize).list();
		long totalResult = (long) session.createQuery(hql2).setParameter("companyId", companyId).uniqueResult();
		Integer totalPage = (int)Math.ceil(((double)totalResult/pageSize));
		page.setTotalResultCount((int)totalResult);
		page.setContent(list);
		page.setTotalpage(totalPage);
		return page;
	}

	@Override
	//取得公司訂閱用戶
	public Set<MemberBean> getMemberByCompanyId(int companyId) {
		Set<MemberBean> mbs = new HashSet<MemberBean>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM MemberSubscription WHERE companyId=:companyId";
		List<MemberSubscription> memberSubscriptions = session.createQuery(hql,MemberSubscription.class)
														.setParameter("companyId", companyId)
														.list();
		for(MemberSubscription ms:memberSubscriptions) {
			mbs.add(ms.getMember());
		}
		
		return mbs;
	}

	@Override
	//取得進行中的活動
	public List<Campaign> selectActiveCampaign() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Campaign WHERE status=true AND expired=false";		
		return session.createQuery(hql,Campaign.class).list();
	}

	
}
