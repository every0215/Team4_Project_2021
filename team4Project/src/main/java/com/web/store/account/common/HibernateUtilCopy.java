package com.web.store.account.common;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;






public class HibernateUtilCopy {
	private static final SessionFactory factory = createSessionFactory();

	private static SessionFactory createSessionFactory() {
		StandardServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().configure().build();
		SessionFactory factory = new MetadataSources(serviceRegistry).buildMetadata().buildSessionFactory();
		//System.out.println("Memory address: " + VM.current().addressOf(factory));
		System.out.println("toString: " + factory);
		System.out.println("hashCode: " + factory.hashCode());
		System.out.println("hashCode: " + System.identityHashCode(factory));
		
		return factory;
	}
	
	public static SessionFactory getSessionFactory() {
		return factory;
		
	}
	
	public static void closeSessionFactory() {
		if(factory!= null) {
			factory.close();
		}
	}
}
