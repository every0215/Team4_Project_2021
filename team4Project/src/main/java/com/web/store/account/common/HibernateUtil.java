package com.web.store.account.common;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.hibernate.cfg.Configuration;

public class HibernateUtil {

	private static SessionFactory factory;
	private static Session session;

	private HibernateUtil() {
    }

	public static synchronized SessionFactory getSessionFactory() {

		if (factory == null) {
			factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			//session = factory.getCurrentSession();
		}
		return factory;
	}
	
//	public static synchronized Session getSession() {
//		return session;
//	}

	public static void closeSessionFactory() {
		if (factory != null) {
			factory.close();
		}
	}
}
