package com.web.store.campaign.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.transaction.Transactional;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.store.account.javabean.MemberBean;
import com.web.store.account.service.AccountService;
import com.web.store.campaign.dao.CampaignDao;
import com.web.store.campaign.model.ApplyBean;
import com.web.store.campaign.model.Campaign;
import com.web.store.campaign.model.Page;
import com.web.store.campaign.model.SearchBean;
import com.web.store.campaign.service.CampaignService;
import com.web.store.company.model.Company;
import com.web.store.product.dao.ProductDao;
import com.web.store.product.model.Product;
import com.web.store.product.service.ProductService;



@Service
@Transactional
public class CampaignServiceImpl implements CampaignService {
	
	@Autowired
	CampaignDao campDao;
	@Autowired
	ProductService productService;
	@Autowired
	AccountService accountService;
	
	@Override
	public int insert(Campaign camp) {
		return campDao.insert(camp);
	}

	@Override
	public Campaign getCampaignById(int campId) {
		Campaign camp = campDao.getCampaignById(campId);
		Hibernate.initialize(camp.getCompany());
		return camp;
	}
	
	@Override
	public List<Campaign> getAllCampaign() {
		return campDao.getAllCampaign();
	}

	@Override
	public List<Campaign> getCampaignByCompanyId(int companyId) {
		return campDao.getCampaignByCompanyId(companyId);
	}

	@Override
	public List<Campaign> getCampaignByMember(int memberId) {
		return null;
	}

	@Override
	public List<Campaign> getCampaignByLaunchStatus(boolean status) {
		return campDao.getCampaignByLaunchStatus(status);
	}

	@Override
	public int deleteById(int id) {
		return campDao.deleteById(id);
	}

	@Override
	public int update(Campaign camp) {
		return campDao.update(camp);
	}

	@Override
	public int getTotalPage() {
		return campDao.getTotalPage();
	}

	@Override
	public int getTotalPageByCompanyId(int id) {
		return campDao.getTotalPageByCompanyId(id);
	}

	@Override
	public List<Campaign> getActiveCampaign(List<Campaign> list) {
		List<Campaign> resultList = new ArrayList<Campaign>();
		for(Campaign camp:list) {
			if(camp.isActive()) {
				resultList.add(camp);
			}
		}
		return resultList;		
	}

	@Override
	public List<Campaign> getActiveCampaignByCompanyId(int companyId) {
		List<Campaign> resultList = getActiveCampaign(getCampaignByCompanyId(companyId));
		return resultList;
	}

	@Override
	public Page<Campaign> searchCampaignOfCompany(int companyId, SearchBean search, Page<Campaign> page) {
		
		return campDao.serchCampaignOfCompany(companyId, search, page);
	}

	@Override
	public Long getTotalCampCountOfCompany(int companyId) {	
		return campDao.getTotalCampCountOfCompany(companyId);
	}

	@Override
	public Page<Campaign> getCampaignPageOfCompany(Page<Campaign> page,int companyId) {

		return campDao.getPageByCompanyId(page, companyId);
	}

	@Override
	//排程任務呼叫的method，確認全部活動狀態，進行中、已過期之判斷
	public void checkCampaignStatus() {
		List<Campaign> camps = campDao.getAllCampaign();
		for(Campaign camp:camps) {
			camp.isActive();
			camp.isExpired();
		}
	}

	@Override
	public List<Campaign> getRandomCampaignbyCompany(int companyId, int count) {
		return campDao.getRandomCampaignbyCompany(companyId, count);
	}

	@Override
	public Page<Campaign> getActiveCampaignPageByCompany(Page<Campaign> page, int companyId) {
		return campDao.getActiveCampaignPageByCompany(page, companyId);
	}

	@Override
	public double checkProductDiscountById(int productId) {
		Product product = productService.getProduct(productId);
		Set<Campaign> campOfProduct = product.getCampaigns();
		Hibernate.initialize(campOfProduct);
		double lowestDiscount = 1;
		for(Campaign camp:campOfProduct) {
			
			//當活動類型是折扣 進行中，活動進行中才判斷
			if(camp.getDiscountParams().getType()==1 && camp.getStatus() && !camp.getExpired()) {			
				if(camp.getDiscountParams().getOffParam()!=null) {
					double OffParam = camp.getDiscountParams().getOffParam();
					if(OffParam<lowestDiscount) {
						lowestDiscount = OffParam;
					}		
				}					
			}		
		}
		return lowestDiscount;
	}

	@Override
	//分類商品，傳入campaignId、productName，
	//傳回map，已套用和未套用該活動的商品
	public Map<String, List<Product>> classifyProductIncamp(int campId,String companyName) {
		
		Map<String, List<Product>> classify= new HashMap<String, List<Product>>();
		List<Product> productsInCamp = new LinkedList<Product>();
		List<Product> productsNotInCamp = new LinkedList<Product>();
		List<Product> products = productService.selectbyCompanyName(companyName);
		Set<Product> currentProductIncamp = getCampaignById(campId).getProducts();
		
		//檢查商品是否為活動套用中
		for(Product product:products) {	
			boolean flag = true;
			for(Product productInCamp:currentProductIncamp) {		
				if(productInCamp.getproductId()==product.getproductId()) {
					productsInCamp.add(product);
					flag = false;
					break;
				}
			}
			if (flag) {
				productsNotInCamp.add(product);
			}
		}
		
		classify.put("productsInCamp",productsInCamp);
		classify.put("productsNotInCamp",productsNotInCamp);
		
		return classify;
		
	}

	@Override
	//套用活動商品方法
	public int applyProductWithCamp(ApplyBean apply, int campaignId) {
		Campaign camp = getCampaignById(campaignId);
		List<Integer> productIds = apply.getProductsIdInCamp();
		Set<Product> productSet = new HashSet<Product>();
		
		for(int productId:productIds) {
			Product product = productService.getProduct(productId);
			productSet.add(product);
		}
		
		camp.setProducts(productSet);	
		
		return 0;
	}

	@Override
	//依照訂閱推播活動
	public void pushCampaign(int campId) throws Exception {
		Campaign campaign = getCampaignById(campId);
		String title = campaign.getName();
		String description = campaign.getDescription();
		Hibernate.initialize(campaign.getCompany());
		int companyId = campaign.getCompany().getId();
		Set<MemberBean> members = campDao.getMemberByCompanyId(companyId);
		for(MemberBean mb : members) {
			accountService.addMemberNotification(mb, 3, title, description, "http://localhost:8080/proj/campaign/detail/"+campId);
		}
	}

	@Override
	public void updateProductDiscount() {
		productService.setProductDiscountToDefault();//先將所有折扣參數初始化為1
		List<Campaign> camps = campDao.selectActiveCampaign();//撈出進行中的活動
		//遍歷活動，並且遍歷活動套用的商品，如果商品套用折扣大於目前商品折扣，則將目前商品折扣取代
		for(Campaign camp:camps) {
			Double discount = camp.getDiscountParams().getOffParam();
			if(discount!=null) {
				Set<Product> pros = camp.getProducts();
				for(Product pro:pros) {	
					if(pro.getdiscount()>discount) {
						pro.setdiscount(discount);
					}		
				}
			}
		}
		
		System.out.println("更新成功");
	}
	
	
		
}
