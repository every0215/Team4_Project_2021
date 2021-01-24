package com.web.store.account.dao.impl;


import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;
import java.util.Scanner;

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
	
	@Override
	public MemberBean selectById(int id) throws SQLException {
		Session session = factory.getCurrentSession();
		MemberBean member = (MemberBean)session.get(MemberBean.class, id);
		return member;	
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public MemberBean selectByLoginInfo(String email, String pwd) throws SQLException {
		Session session = factory.getCurrentSession();
		byte[] aa = Utility.encryptUsingSHA512(pwd);
		List<MemberBean> memberList = (List<MemberBean>) session.createQuery("From MemberBean m WHERE m.email = :email AND m.password = :password")
				.setParameter("email", email)
				.setParameter("password", Utility.encryptUsingSHA512(pwd))
				.getResultList();
		if(memberList == null|| memberList.size() == 0)  {
			return null;
		}
		return memberList.get(0);	
	}
	
	@Override
	public void insert(MemberBean m) throws SQLException {
		Session session = factory.getCurrentSession();
		m.setPassword(Utility.encryptUsingSHA512(m.getPwd()));
		m.setActive(false);
		m.setVerified(false);
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
}