package com.web.store.account.dao.impl;


import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;
import java.util.Scanner;
import java.util.Set;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.account.common.HibernateUtil;
import com.web.store.account.common.Utility;
import com.web.store.account.dao.MemberDao;
import com.web.store.account.javabean.MemberBean;
import com.web.store.account.javabean.MemberNotification;
import com.web.store.account.javabean.MemberSubscription;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	SessionFactory factory;


	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> selectAll() throws SQLException {
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean";
		List<MemberBean> members = session.createQuery(hql).getResultList();
		return members;	
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public MemberBean selectById(int id) throws SQLException {
		Session session = factory.getCurrentSession();
		List<MemberBean> memberList = (List<MemberBean>) session.createQuery("From MemberBean m  "
				+ "LEFT JOIN FETCH m.memberCreditCardList "
				+ "LEFT JOIN FETCH m.mCoinTopupDetailList "
				+ "LEFT JOIN FETCH m.mCoin "
				//+ "LEFT JOIN FETCH m.memberSubscriptionList "
				+ "LEFT JOIN FETCH m.memberNotificationList "
				+ "WHERE m.id = :id ")
				.setParameter("id", id)
				.getResultList();
		if(memberList == null|| memberList.size() == 0)  {
			return null;
		}
		return memberList.get(0);	
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public MemberBean selectByLoginInfo(String email, String pwd) throws SQLException {
		Session session = factory.getCurrentSession();

		List<MemberBean> memberList = (List<MemberBean>) session.createQuery("From MemberBean m  "
				+ "LEFT JOIN FETCH m.memberCreditCardList "
				+ "LEFT JOIN FETCH m.mCoinTopupDetailList "
				+ "LEFT JOIN FETCH m.mCoin "
				//+ "LEFT JOIN FETCH m.memberSubscriptionList "
				+ "LEFT JOIN FETCH m.memberNotificationList mnl "
				+ "WHERE m.email = :email AND m.password = :password ")
				.setParameter("email", email)
				.setParameter("password", Utility.encryptUsingSHA512(pwd))
				.getResultList();
		if(memberList == null|| memberList.size() == 0)  {
			return null;
		}
		return memberList.get(0);	
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<MemberBean> selectByConditions(int page, int pageSize, String keywordFullname, String keywordEmail, String keywordQid, String columnName, Boolean sortASC ) throws SQLException {
		// pageSize = 0 is used for calculating total count of selected rows ONLY!!
		Session session = factory.getCurrentSession();
		System.out.println("searching.. keywordFullname: " + keywordFullname + ", keywordEmail: " + keywordEmail  + ", keywordQid: " + keywordQid);
		String hql = "Select ";
		
		if(pageSize == 0) {
			hql += " COUNT(m.id) ";
		}
		else {
			hql += "m.id as Id, m.fullname as Fullname, m.qid as Qid, m.email as Email, m.active as Active, m.createdDate as CreatedDate";
		}
				
		hql += " From MemberBean m ";
		int c = 0;
		if(!keywordFullname.equals("")) {
			if(c==0) hql += " WHERE ";
			hql += " m.fullname LIKE :keywordFullname ";
			c++;
		}
		if(!keywordEmail.equals("")) {
			if(c==0) hql += " WHERE ";
			if(c>0) hql += " AND ";
			hql += " m.email LIKE :keywordEmail ";
			c++;
		}
		if(!keywordQid.equals("")) {
			if(c==0) hql += " WHERE ";
			if(c>0) hql += " AND ";
			hql += " m.qid LIKE :keywordQid ";
			c++;
		}
		
		//進行排序(依照選取的欄位與排序方式)
		if (pageSize!=0) {
			Boolean doSort = false;
			if(columnName.equals("id") ) { hql += "Order By m.id "; doSort = true; }
			else if(columnName.equals("fullname") ) { hql += "Order By m.fullname "; doSort = true; }
			else if(columnName.equals("qid") ) { hql += "Order By m.qid "; doSort = true; }
			else if(columnName.equals("email") ) { hql += "Order By m.email "; doSort = true; }
			else if(columnName.equals("active") ) { hql += "Order By m.active "; doSort = true; }
			else if(columnName.equals("createddate") ) { hql += "Order By m.createdDate "; doSort = true; }
			
			if(doSort) {
				if(sortASC) hql += " ASC ";
				else hql += " DESC ";
			}
		}
		
		System.out.println("hql: " + hql);
		Query query = session.createQuery(hql);
		if(!keywordFullname.equals("")) {
			query.setParameter("keywordFullname", "%"+ keywordFullname +"%");
		}
		if(!keywordEmail.equals("")) {
			query.setParameter("keywordEmail", "%"+ keywordEmail +"%");
		}
		if(!keywordQid.equals("")) {
			query.setParameter("keywordQid", "%"+ keywordQid +"%");
		}
		
		if(pageSize!=0) {
			query.setFirstResult((page)*pageSize).setMaxResults(pageSize*3);
		}
		
		List<MemberBean> memberList = (List<MemberBean>) query.getResultList();
		
//		List<MemberBean> memberList = (List<MemberBean>) session.createQuery("From MemberBean m WHERE m.fullname LIKE :keywordFullname ")
//				.setParameter("keywordFullname", "%"+ keywordFullname.trim() +"%")
//				//.setFirstResult((page-1)*pageSize)
//				.setFirstResult((page)*pageSize)
//				.setMaxResults(pageSize*3)
//				.getResultList();
		
//		String hql = "From MemberBean m where m.email like :keyword";
//		 
//		//keywordStr = "test";
//		Query query = session.createQuery(hql);
//		query.setParameter("keyword", "%" + keywordStr.tr + "%");
//		 
//		List<MemberBean> memberList = query
//				.setFirstResult((page)*pageSize)
//				.setMaxResults(pageSize*3)
//				.list();
		
		return memberList;	
	}
	
	@Override
	public void insert(MemberBean m) throws SQLException {
		Session session = factory.getCurrentSession();
		m.setPassword(Utility.encryptUsingSHA512(m.getPwd()));
		m.setActive(false);
		m.setVerified(false);
		m.setLock(false);
		m.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		m.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		//....
		session.save(m);

	}
	
	@Override
	public int deleteById(int id) {
		Session session = factory.getCurrentSession();

		MemberBean member = (MemberBean)session.get(MemberBean.class, id);
		if(member!=null) {
			session.delete(member);
			
			return 1;
		}
		else {
			return 0;
		}
	}
	
	@Override
	public void update(MemberBean m) throws SQLException {
		Session session = factory.getCurrentSession();
		//....
		session.saveOrUpdate(m);
		
	}
	
	@Override
	public void updateWithClear(MemberBean m) throws SQLException {
		Session session = factory.getCurrentSession();
		//....
		session.clear();
		session.update(m);
		
	}
	
	
	@Override
	public int updatePassword(MemberBean m) throws SQLException {
		Session session = factory.getCurrentSession();
		m.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		Query query = session.createQuery("update MemberBean m SET m.password = :Password, m.modifiedDate = :ModifiedDate WHERE m.id = :Id")
				.setParameter("Id", m.getId())
				.setParameter("Password", m.getPassword())
				.setParameter("ModifiedDate", m.getModifiedDate());
		
			query.executeUpdate();

		return 1;
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public MemberBean selectByQidEmail(String qid, String email) throws SQLException {
		Session session = factory.getCurrentSession();
		List<MemberBean> memberList = (List<MemberBean>) session.createQuery("FROM MemberBean m WHERE m.qid = :qid AND m.email = :email ")
				.setParameter("qid", qid)
				.setParameter("email", email)
				.getResultList();
		if(memberList == null|| memberList.size() == 0)  {
			return null;
		}
		return memberList.get(0);	
	}
	
	@Override
	public MemberBean checkForgotPasswordCode(byte[] forgotPasswordCode) throws SQLException {
		Session session = factory.getCurrentSession();
		MemberBean member = (MemberBean) session.createQuery("FROM MemberBean m WHERE m.forgotPasswordCode = :forgotPasswordCode ")
				.setParameter("forgotPasswordCode", forgotPasswordCode).getSingleResult();
		
		return member;
	}
	
	@Override
	public int updateNickname(MemberBean m) throws SQLException {
		Session session = factory.getCurrentSession();
		m.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		Query query = session.createQuery("update MemberBean m SET m.nickname = :Nickname, m.modifiedDate = :ModifiedDate where m.id = :Id")
				.setParameter("Id", m.getId())
				.setParameter("Nickname", m.getNickname())
				.setParameter("ModifiedDate", m.getModifiedDate());
		
			query.executeUpdate();

		return 1;
	}
	
	@Override
	public int updateVerified(MemberBean m) throws SQLException {
		Session session = factory.getCurrentSession();

		Query query = session.createQuery("update MemberBean m SET m.verified = :Verified, m.active = :Active where m.id = :Id")
				.setParameter("Id", m.getId())
				.setParameter("Verified", m.isVerified())
				.setParameter("Active", m.isActive());
			query.executeUpdate();
		return 1;
	}
	
	@Override
	public int updateActive(MemberBean m) throws SQLException {
		Session session = factory.getCurrentSession();

		Query query = session.createQuery("update MemberBean m SET m.Active = :Active where m.id = :Id")
				.setParameter("Id", m.getId())
				.setParameter("Active", m.isActive());
		
			query.executeUpdate();
		return 1;
	}
	
	@Override
	public int updateProfileImages(MemberBean m) throws SQLException {
		Session session = factory.getCurrentSession();
		m.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		Query query = session.createQuery("update MemberBean m SET m.profileImage1 = :ProfileImage1, m.modifiedDate = :ModifiedDate  where m.id = :Id")
				.setParameter("Id", m.getId())
				.setParameter("ProfileImage1", m.getProfileImage1())
				.setParameter("ModifiedDate", m.getModifiedDate());
			query.executeUpdate();

		return 1;
	}
	
	@Override
	public void delete(MemberBean member) {
		Session session = factory.getCurrentSession();
		session.delete(member);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Set<MemberSubscription> getMemberSubscriptionList(int memberId) throws SQLException {
		Session session = factory.getCurrentSession();
		List<MemberSubscription> memberSubscriptionList = (List<MemberSubscription>) session.createQuery("From MemberSubscription ms WHERE ms.member.id = :memberId ")
				.setParameter("memberId", memberId)
				.getResultList();
	
		return Utility.ConvertListToSet(memberSubscriptionList);
	}
	
	@Override
	public void delete(MemberSubscription memberSubscription) {
		Session session = factory.getCurrentSession();
		session.delete(memberSubscription);
			

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Set<MemberNotification> getMemberNotificationList(int memberId) throws SQLException {
		Session session = factory.getCurrentSession();
		List<MemberNotification> memberNotificationList = (List<MemberNotification>) session.createQuery("From MemberNotification mn WHERE mn.member.id = :memberId AND mn.read = 0")
				.setParameter("memberId", memberId)
				.getResultList();
	
		return Utility.ConvertListToSet(memberNotificationList);
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public int getMemberNotificationCount(int memberId) throws SQLException {
		Session session = factory.getCurrentSession();
		Long memberNotificationCount = (Long) session.createQuery("SELECT COUNT(mn.id) From MemberNotification mn WHERE mn.member.id = :memberId AND mn.read = 0")
				.setParameter("memberId", memberId)
				.uniqueResult();

		return memberNotificationCount.intValue();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void updateMemberNotificationIsRead(int mNotificationId) throws SQLException {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("UPDATE MemberNotification mn SET mn.read = 1 WHERE mn.id = :mnId ")
				.setParameter("mnId", mNotificationId);
		
				query.executeUpdate();
	}
	
	
	@Override
	public void delete(MemberNotification memberNotification) {
		Session session = factory.getCurrentSession();
		session.delete(memberNotification);
	}
	
	
	@Override
	public int getTotalCount() throws SQLException {
		Session session = factory.getCurrentSession();
		String hql = "Select Count(id) FROM MemberBean";
		Long totalCount = (Long) session.createQuery(hql).getSingleResult();
		return totalCount.intValue();	
	}
}
