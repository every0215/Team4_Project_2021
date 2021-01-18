package com.web.store.report.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.report.dao.ReportDao;
import com.web.store.report.model.Report;

@Repository
public class ReportDaoImpl implements ReportDao {

	SessionFactory sessionFactory;

	@Autowired
	public void setFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	// 查詢全部
	@SuppressWarnings("unchecked")
	@Override
	public List<Report> queryAll() {
//		Session session = sessionFactory.getCurrentSession();
//		String hqlstr = "from Report";
//		Query<Report> queryObj = session.createQuery(hqlstr,Report.class); 			
//		return queryObj.list();	

		String hqlstr = "from Report";
		List<Report> list = new ArrayList<Report>();
		Session session = sessionFactory.getCurrentSession();
		list = session.createQuery(hqlstr).getResultList();
		return list;

	}

	// 查詢累計會員數
	@Override
	public List<Report> queryMember() {
		return null;
	}

	// 年度累計銷售金額
	@Override
	public String querySales(int companyid) {
		String Count = "";
		try {
			Session session = sessionFactory.getCurrentSession();
			String hql = "Select sum((productprice-productdiscountprice)*salesamount) AS Count FROM Report WHERE companyid=:comp";
			@SuppressWarnings("rawtypes") // 抑制單型別的警告
			List obj = session.createQuery(hql).setParameter("comp", companyid).getResultList();
//			System.out.println("obj ==> " + obj.get(0));
//			System.out.println("obj ==> " + obj.size());
//			System.out.println("1");
			Count = obj.get(0).toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Count;
	}

	// 目前門市數量
	public String queryStore(int companyid) {
		String Count = "";
		try {
			Session session = sessionFactory.getCurrentSession();
			String hql = "Select count(DISTINCT storename) FROM Report WHERE companyid=:comp";
			@SuppressWarnings("rawtypes") // 抑制單型別的警告
			List obj = session.createQuery(hql).setParameter("comp", companyid).getResultList();
			Count = obj.get(0).toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Count;
	}

	// 已銷售商品項目數量
	public String queryClass(int companyid) {
		String Count = "";
		try {
			Session session = sessionFactory.getCurrentSession();
			String hql = "Select count(DISTINCT productname) FROM Report WHERE companyid=:comp";
			@SuppressWarnings("rawtypes") // 抑制單型別的警告
			List obj = session.createQuery(hql).setParameter("comp", companyid).getResultList();
			Count = obj.get(0).toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Count;
	}

	// Tab1-年度各區業績
	@SuppressWarnings("unchecked")
	@Override
	public List<Report> queryAreaSales(int companyid) {

		String hqlstr = "select storearea,sum(salesamount) as amount,sum((productprice-productdiscountprice)*salesamount) AS Count,sum(productdiscountprice*salesamount) AS discount FROM Report WHERE companyid=:comp group by storearea";
		List<Report> list = new ArrayList<Report>();
		Session session = sessionFactory.getCurrentSession();
		list = session.createQuery(hqlstr).setParameter("comp", companyid).getResultList();
		return list;
	}

	// Tab2-年度品類銷售
	@SuppressWarnings("unchecked")
	@Override
	public List<Report> queryProdustClass(int companyid) {
		String hqlstr = "select productclass,sum(salesamount) as amount,sum((productprice-productdiscountprice)*salesamount) AS Count,sum(productdiscountprice*salesamount) AS discount FROM Report WHERE companyid=:comp group by productclass";
		List<Report> list = new ArrayList<Report>();
		Session session = sessionFactory.getCurrentSession();
		list = session.createQuery(hqlstr).setParameter("comp", companyid).getResultList();
		return list;
	}

	// Tab3-年度活動銷售
	@SuppressWarnings("unchecked")
	@Override
	public List<Report> queryActiveSales(int companyid) {
		String hqlstr = "select activeitem,sum(salesamount) as amount,sum((productprice-productdiscountprice)*salesamount) AS Count ,sum(productdiscountprice*salesamount) as discount FROM Report WHERE companyid=:comp group by activeitem";
		List<Report> list = new ArrayList<Report>();
		Session session = sessionFactory.getCurrentSession();
		list = session.createQuery(hqlstr).setParameter("comp", companyid).getResultList();
		return list;
	}


	// Tab4-各店-各店年度業績/折扣/店會員數(待補)
	@SuppressWarnings("unchecked")
	@Override
	public List<Report> queryAllStoreSales(int companyid) {
		String hqlstr = "select storearea,storename ,sum((productprice-productdiscountprice)*salesamount) AS Count ,sum(productdiscountprice*salesamount) as discount FROM Report WHERE companyid=:comp group by storename,storearea";
		List<Report> list = new ArrayList<Report>();
		Session session = sessionFactory.getCurrentSession();
		list = session.createQuery(hqlstr).setParameter("comp", companyid).getResultList();
		return list;
	}

	// Tab5-各店-各店活動業績
	@SuppressWarnings("unchecked")
	@Override
	public List<Report> queryAllActiveSales(int companyid) {
		String hqlstr = "select storename,activeitem,sum(salesamount) as amount,sum((productprice-productdiscountprice)*salesamount) AS Count ,sum(productdiscountprice*salesamount) as discount FROM Report WHERE companyid=:comp group by activeitem,storename";
		List<Report> list = new ArrayList<Report>();
		Session session = sessionFactory.getCurrentSession();
		list = session.createQuery(hqlstr).setParameter("comp", companyid).getResultList();
		return list;
	}

	// Tab6-各店-各店付款方式
	@SuppressWarnings("unchecked")
	@Override
	public List<Report> queryAllStorePayment(int companyid) {
		String hqlstr = "select storename,payment,sum(salesamount) as amount,sum((productprice-productdiscountprice)*salesamount) AS Count ,sum(productdiscountprice*salesamount) as discount FROM Report WHERE companyid=:comp group by payment,storename";
		List<Report> list = new ArrayList<Report>();
		Session session = sessionFactory.getCurrentSession();
		list = session.createQuery(hqlstr).setParameter("comp", companyid).getResultList();
		return list;
	}
	
	// Tab7-各店-各店無庫存項數
	@Override
	public List<Report> queryAllStoreStock(int companyid) {

		return null;
			}
	
	// Tab8-商品前十名排行
	@Override
	public List<Report> queryProductRanking(int companyid) {

		return null;
	}
	// 新增廣告排行榜商品
	@Override
	public void insert(Report report) {

	}

	// 修改廣告排行榜商品
	@Override
	public void update(Report report) {

	}

	// 刪除廣告排行榜商品
	@Override
	public void delete(int reportid) {

	}

}
