package com.web.store.account.dao;


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
	
	@Override
	public void insert(MemberBean m) throws SQLException {
		Session session = factory.getCurrentSession();

		
		//....
		session.save(m);
		session.getTransaction().commit();

	}
	
	@Override
	public int deleteById(int id) {
		Session session = factory.getCurrentSession();

		MemberBean member = (MemberBean)session.get(MemberBean.class, id);
		if(member!=null) {
			session.delete(member);
			session.getTransaction().commit();

			
			return 1;
		}
		else {
			return 0;
		}
	}
	
	@Override
	public int updateNickName(MemberBean m) throws SQLException {
		Session session = factory.getCurrentSession();

		Query query = session.createQuery("update MemberBean m SET m.nickname = :Nickname where m.id = :Id")
				.setParameter("Id", m.getId())
				.setParameter("Nickname", m.getNickname());
		
			query.executeUpdate();
			session.getTransaction().commit();

		return 1;
		
	}
	
	@Override
	public int updateProfileImages(MemberBean m) throws SQLException {
		Session session = factory.getCurrentSession();

		Query query = session.createQuery("update MemberBean m SET m.profileImage1 = :ProfileImage1 where m.id = :Id")
				.setParameter("Id", m.getId())
				.setParameter("ProfileImage1", m.getProfileImage1());
		
			query.executeUpdate();
			session.getTransaction().commit();

		return 1;
	}
}
