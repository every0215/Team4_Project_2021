package com.web.store.report.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.product.model.Product;
import com.web.store.report.dao.ReportDao;
import com.web.store.report.model.Report;
import com.web.store.report.model.ReportProductAdv;

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
	public String queryMember(int companyid) {
		String Count = "";
		try {
			Session session = sessionFactory.getCurrentSession();
			String hql = "Select count(memberid) AS Count FROM MemberSubscription WHERE companyid=:comp";
			@SuppressWarnings("rawtypes") // 抑制單型別的警告
			List obj = session.createQuery(hql).setParameter("comp", companyid).getResultList();
			Count = obj.get(0).toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Count;
	}

	// 年度累計銷售金額
	@Override
	public String querySales(int companyid) {
		String Count = "";
		try {
			Session session = sessionFactory.getCurrentSession();
			String hql = "Select sum((productprice*salesamount)-productdiscountprice) AS Count FROM Report WHERE companyid=:comp";
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
		String hqlstr = "select storearea,sum((productprice*salesamount)-productdiscountprice) AS Count FROM Report WHERE companyid=:comp group by storearea ";
		List<Report> list = new ArrayList<Report>();
		Session session = sessionFactory.getCurrentSession();
		list = session.createQuery(hqlstr).setParameter("comp", companyid).getResultList();
		return list;
	}

	// Tab2-年度品類銷售
	@SuppressWarnings("unchecked")
	@Override
	public List<Report> queryProdustClass(int companyid) {
		String hqlstr = "select productclass,sum(salesamount) as amount,sum((productprice*salesamount)-productdiscountprice) AS Count,sum(productdiscountprice) AS discount FROM Report WHERE companyid=:comp group by productclass";
		List<Report> list = new ArrayList<Report>();
		Session session = sessionFactory.getCurrentSession();
		list = session.createQuery(hqlstr).setParameter("comp", companyid).getResultList();
		return list;
	}

	// Tab3-年度活動銷售
	@SuppressWarnings("unchecked")
	@Override
	public List<Report> queryActiveSales(int companyid) {
		String hqlstr = "select activeitem,sum(salesamount) as amount,sum((productprice*salesamount)-productdiscountprice) AS Count ,sum(productdiscountprice) as discount FROM Report WHERE companyid=:comp group by activeitem";
		List<Report> list = new ArrayList<Report>();
		Session session = sessionFactory.getCurrentSession();
		list = session.createQuery(hqlstr).setParameter("comp", companyid).getResultList();
		return list;
	}

	// Tab4-各店-各店年度業績/折扣
	@SuppressWarnings("unchecked")
	@Override
	public List<Report> queryAllStoreSales(int companyid) {
		String hqlstr = "select storearea,storename ,sum((productprice*salesamount)-productdiscountprice) AS Count ,sum(productdiscountprice) as discount FROM Report WHERE companyid=:comp group by storename,storearea";
		List<Report> list = new ArrayList<Report>();
		Session session = sessionFactory.getCurrentSession();
		list = session.createQuery(hqlstr).setParameter("comp", companyid).getResultList();
		return list;
	}

	// Tab5-各店-各店活動業績
	@SuppressWarnings("unchecked")
	@Override
	public List<Report> queryAllActiveSales(int companyid) {
		String hqlstr = "select storename,activeitem,sum(salesamount) as amount,sum((productprice*salesamount)-productdiscountprice) AS Count ,sum(productdiscountprice) as discount FROM Report WHERE (companyid=:comp) and (Activeitem<>'null') group by storename,activeitem";
		List<Report> list = new ArrayList<Report>();
		Session session = sessionFactory.getCurrentSession();
		list = session.createQuery(hqlstr).setParameter("comp", companyid).getResultList();
		System.out.println(list);
		return list;

	}

	// Tab6-各店-各店付款方式
	@SuppressWarnings("unchecked")
	@Override
	public List<Report> queryAllStorePayment(int companyid) {
		String hqlstr = "select storename,payment,sum(salesamount) as amount,sum((productprice*salesamount)-productdiscountprice) AS Count ,sum(productdiscountprice) as discount FROM Report WHERE companyid=:comp group by storename,payment";
		List<Report> list = new ArrayList<Report>();
		Session session = sessionFactory.getCurrentSession();
		list = session.createQuery(hqlstr).setParameter("comp", companyid).getResultList();
		return list;
	}

	// Tab7-各店-各店無庫存項數
	@SuppressWarnings("unchecked")
	@Override
	public List<Report> queryAllStoreStock(int companyid) {
		String hqlstr = "select storename, count(stockamount) as stock from Report where companyid=:comp and (stockamount<10) group by storename";// and
																																					// (Stockamount<5)";
		List<Report> list = new ArrayList<Report>();
		Session session = sessionFactory.getCurrentSession();
		list = session.createQuery(hqlstr).setParameter("comp", companyid).getResultList();
		return list;
	}

	// Tab8-匯入商品前五名排行
//	@Override
	@SuppressWarnings("unchecked")
	public List<Product> queryProductRanking(int companyid) {
		String hqlstr1 = "SELECT productid FROM Report WHERE companyid=:comp group by productid order by count(salesamount) DESC";
		Session session = sessionFactory.getCurrentSession();
		@SuppressWarnings("rawtypes")
		List top5list = session.createQuery(hqlstr1).setParameter("comp", companyid).setMaxResults(5).getResultList();

		List<String> productIdStrs = new ArrayList<String>();
		for (int j = 0; j < top5list.size(); j++) {
			productIdStrs.add(top5list.get(j).toString());
		}

		String productIds = String.join(",", productIdStrs);
		String hqlstr2 = "SELECT productId,productName,productDescript,productPrice FROM Product WHERE productId IN ("
				+ productIds + ")";
		List<Product> list = session.createQuery(hqlstr2).list();
		return list;

//		String hqlstr = "select A.productid,A.Productname,B.ProductDescript,A.Productprice,B.ProductPic from\r\n"
//				+ "(select top 5 Productid,Productname,Productprice,count(Salesamount)as sss from Report where Companyid=1 group by Productid,Productname,Productprice order by count(Salesamount) desc)\r\n"
//				+ "as A\r\n"
//				+ "left join\r\n"
//				+ "(select ProductId,ProductName,ProductDescript,ProductPic from Product)as B\r\n"
//				+ "on A.productId=B.productId;";
//		List<Report> list = new ArrayList<Report>();
//		Session session = sessionFactory.getCurrentSession();
//		list = session.createQuery(hqlstr).setParameter("comp", companyid).getResultList();
//		return list;

	}

	// Tab8-從adv資料庫搜尋
	@SuppressWarnings("unchecked")
	public List<ReportProductAdv> queryProductAdv(int companyid){
		String hqlstr = "select orderAsc,companyid,productId,productName,productDescript,productPrice from ReportProductAdv where companyid=:comp";
		List<ReportProductAdv> list = new ArrayList<ReportProductAdv>();
		Session session = sessionFactory.getCurrentSession();
		list = session.createQuery(hqlstr).setParameter("comp", companyid).getResultList();
		return list;
//	@SuppressWarnings("unchecked")
//	public List<ReportProductAdv> queryProductAdv(int companyid) {
//		String hqlstr = "select orderAsc,productId,productName,productDescript,productPrice,productPic from ReportProductAdv where companyid=:comp";
//		List<ReportProductAdv> list = new ArrayList<ReportProductAdv>();
//		Session session = sessionFactory.getCurrentSession();
//		list = session.createQuery(hqlstr).setParameter("comp", companyid).getResultList();
//		return list;
	}

	// 修改廣告排行榜商品
	@Override
	public void update(ReportProductAdv adv) {
		
		String hqlstr ="update ReportProductAdv set orderAsc=?, productId=?,productname=?,productDescript=?,productprice=? where id=?";
		Session session = sessionFactory.getCurrentSession();
		session.update(hqlstr);
	
	}

	// 查詢前五名商品搜尋列下方
	@SuppressWarnings("unchecked")
	@Override
	public List<Report> queryProductTop() {
		String hqlstr = "select productname,count(salesamount) as totalsales,productid from Report group by productname,productid order by  totalsales desc";
		List<Report> list = new ArrayList<Report>();
		Session session = sessionFactory.getCurrentSession();
		list = session.createQuery(hqlstr).setMaxResults(5).list();
		return list;
	}
	public boolean updateProductAdv(int companyid, List<ReportProductAdv> list) {
		Session session = sessionFactory.getCurrentSession();
		for (int j = 0; j < list.size(); j++) {
			ReportProductAdv adv = list.get(j);
			adv.setCompanyId(companyid);
			String hqlstr1 = "FROM ReportProductAdv WHERE companyid=:comp and orderAsc=:orderAsc";
			List<ReportProductAdv> theAdvs = session.createQuery(hqlstr1,ReportProductAdv.class)
					.setParameter("comp", companyid)
					.setParameter("orderAsc", adv.getOrderAsc())
					.setMaxResults(1).getResultList();
			
			session.clear();
			if (theAdvs.size()>0) {
				adv.setId(theAdvs.get(0).getId());
				session.merge(adv);
			} else {
				session.save(adv);
			}
		}
		return true;
	}
}
