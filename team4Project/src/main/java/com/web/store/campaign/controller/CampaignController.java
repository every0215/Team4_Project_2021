package com.web.store.campaign.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.http.HttpResponse;
import java.sql.Blob;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.store.campaign.model.Campaign;
import com.web.store.campaign.model.DiscountParams;
import com.web.store.campaign.model.Page;
import com.web.store.campaign.model.SearchBean;
import com.web.store.campaign.service.CampaignService;
import com.web.store.campaign.validator.SearchValidator;
import com.web.store.company.model.Company;
import com.web.store.company.service.CompanyService;
import com.web.store.product.model.Product;
import com.web.store.product.service.ProductService;
import com.web.store.utils.ImgurAPI;



@Controller
@RequestMapping("/campaign/")
@SessionAttributes(names = {"company"}) ////存取session屬性
public class CampaignController {
	
	@Autowired
	CampaignService campService;
	@Autowired
	ServletContext context;
	@Autowired
	CompanyService companyService;
	@Autowired
	ProductService productService;
	
	@GetMapping("/show")
	public String showAllCamp(Model model) {
		List<Campaign> list = campService.getAllCampaign();
		model.addAttribute("camps", list);
		return "campaign/CampaignShow";
	}
	
	@GetMapping("/delete/{campId}")
	public String deleteCamp(@PathVariable int campId) {
		campService.deleteById(campId);
		return "redirect:/CampaignShow";
	}
	
	
	
	@PostMapping("/insert")
	public String insertCamp(@RequestParam String name,
			@RequestParam String startDate,
			@RequestParam String startTime,
			@RequestParam Integer type,
			@RequestParam(required = false) Double offParam,
			@RequestParam(required = false) Integer amountUpTo,
			@RequestParam(required = false) Integer amountOffParam,
			@RequestParam String endDate,
			@RequestParam String endTime,
			@RequestParam Boolean launchStatus,
			@RequestParam String description,
			@RequestParam String content,
			@RequestParam MultipartFile picture,
			Model model,
			RedirectAttributes redirectAttributes ) {
		
		Timestamp StartDateTimeStamp = Timestamp.valueOf(startDate+" "+startTime+":00");

		Timestamp endDateTimeStamp = Timestamp.valueOf(endDate+" "+endTime+":00");
		
		Date date = new Date();
//		後端驗證區塊↓	
		HashMap<String,String> errMsg = new HashMap<String,String>();
		boolean isOk = true;
//		
//		
//		if(StartDateTimeStamp.compareTo(date)<0) {
//			errMsg.put("startAfterCurrentErr","開始時間不得小於當前時間");
//			isOk = false;
//		}
//		
//		if(StartDateTimeStamp.compareTo(endDateTimeStamp)>0) {
//			errMsg.put("startAfterEndErr","結束時間必須大於開始時間");
//			isOk = false;
//		}
//		
				
//		後端驗證區塊↑		
		
		
		Timestamp currentTime = new Timestamp(date.getTime());//獲取當前時間的TimeStamp物件
			
		//如果為1，是折扣塞入折扣參數
		//為2是滿額塞入滿額參數
		DiscountParams discountParams = new DiscountParams();
		discountParams.setType(type);
		
		if(type==1) {
			discountParams.setOffParam(offParam);
		}else if(type==2) {		
			discountParams.setAmountUpTo(amountUpTo);
			discountParams.setAmountOffParam(amountOffParam);
		}
		
		String picUrl="";
		if (!picture.isEmpty()) {
			String originFileName = picture.getOriginalFilename();
			try {
				byte[] picBytes = picture.getBytes();
				picUrl = ImgurAPI.upload(picBytes, originFileName);
				System.out.println(picUrl);
			} catch (IOException e) {
				System.out.println("圖片存取失敗----------------");
				e.printStackTrace();
			}
		}

		Company company = (Company)model.getAttribute("company");
		Campaign camp = new Campaign(name, picUrl, description, content, StartDateTimeStamp, endDateTimeStamp, launchStatus, false, currentTime, currentTime, company, discountParams);
		discountParams.setCampaign(camp);
		camp.setDiscountParams(discountParams);
		//寫入圖片檔案部分

		
		try {
			campService.insert(camp);
		}catch(Exception e){
			throw new RuntimeException("新增到資料庫失敗\n"+e.toString());
		}
		
		camp.convertTimestampToString();
		redirectAttributes.addFlashAttribute("camp", camp);
		redirectAttributes.addFlashAttribute("isInsert", true);
		
		if(!isOk) {
			return "redirect:/campaign/insertPage";
		}

		return "redirect:/campaign/campaignAddComfirm";
		
	}
	
	
	@PostMapping("/update/{campaignId}")
	public String updateCamp(@RequestParam String name,
			@RequestParam String startDate,
			@RequestParam String startTime,
			@RequestParam Integer type,
			@RequestParam(required = false) Double offParam,
			@RequestParam(required = false) Integer amountUpTo,
			@RequestParam(required = false) Integer amountOffParam,
			@RequestParam String endDate,
			@RequestParam String endTime,
			@RequestParam Boolean launchStatus,
			@RequestParam String description,
			@RequestParam String content,
			@RequestParam(required = false) MultipartFile picture,
			@PathVariable Integer campaignId,
			Model model,
			RedirectAttributes redirectAttributes ) {

		Timestamp StartDateTimeStamp = Timestamp.valueOf(startDate+" "+startTime+":00");
		Timestamp endDateTimeStamp = Timestamp.valueOf(endDate+" "+endTime+":00");
		
		Campaign campOrigin = campService.getCampaignById(campaignId);
		Date date = new Date();
//		後端驗證區塊↓		
//		boolean isOk = true;
//		
//		
//		if(StartDateTimeStamp.compareTo(date)<0) {
//			model.addAttribute("timeAfterCurrentErr","開始時間不得小於當前時間");
//			isOk = false;
//		}
//		if(StartDateTimeStamp.compareTo(endDateTimeStamp)>0) {
//			model.addAttribute("startAfterEndErr","結束時間必須大於開始時間");
//			isOk = false;
//		}
//		
//		if(!isOk) {
//			return "campaign/CampaignInsertPage";
//		}
		
//		後端驗證區塊↑	
		
		
		
		campOrigin.setName(name);
		campOrigin.setStartDateTime(StartDateTimeStamp);
		campOrigin.setEndDateTime(endDateTimeStamp);
		campOrigin.setDescription(description);
		campOrigin.setLaunchStatus(launchStatus);
		campOrigin.setContent(content);
		campOrigin.setUpdateTime(new Timestamp(date.getTime()));
		
		//如果為1，是折扣塞入折扣參數
		//為2是滿額塞入滿額參數
		DiscountParams discountParams = campOrigin.getDiscountParams();
		discountParams.setType(type);
		if (type == 1) {
			System.out.println(offParam);
			discountParams.setOffParam(offParam);
		} else if (type == 2) {
			discountParams.setAmountUpTo(amountUpTo);
			discountParams.setAmountOffParam(amountOffParam);
		}
		
		campOrigin.setDiscountParams(discountParams);
		discountParams.setCampaign(campOrigin);
		
		if (!picture.isEmpty()) {
			String originFileName = picture.getOriginalFilename();
			try {
				String picUrl = ImgurAPI.upload(picture.getBytes(), originFileName);
				campOrigin.setPicturePath(picUrl);
			} catch (IOException e) {
				System.out.println("圖片存取失敗----------------");
				e.printStackTrace();
			}
		}
		
		
		try {
			campService.update(campOrigin);
		}catch(Exception e){
			throw new RuntimeException("更新到資料庫失敗\n"+e.toString());
		}
		
		redirectAttributes.addFlashAttribute("camp", campOrigin);
		redirectAttributes.addFlashAttribute("isUpdate", true);
		
		return "redirect:/campaign/campaignAddComfirm";
		
	}
	
	//傳送圖片
	@GetMapping(value="/pic/{id}")
	public ResponseEntity<byte[]> getPic(@PathVariable int id){
		ResponseEntity<byte[]> re = null;
		Campaign camp = campService.getCampaignById(id);
		String filePath = camp.getPicturePath();
		File Picfile = new File(filePath);
		
		if(!Picfile.exists()) {
			filePath = context.getRealPath("/campaign_Img/NoImage.jpg");
		}
		
		String mimeType = context.getMimeType(filePath);

		
		MediaType mediaType = MediaType.valueOf(mimeType);
		
		byte[] fileBytes = null;
		
		try(InputStream fileInp = new FileInputStream(Picfile);
			ByteArrayOutputStream bao = new ByteArrayOutputStream();) {
			
			int len = 0;
			byte[] buffer = new byte[81920];
			while((len = fileInp.read(buffer))!=-1) {
				bao.write(buffer,0,len);
			}
			
			fileBytes = bao.toByteArray();
			
		} catch (IOException e) {
			System.out.println("檔案讀取失敗");
			e.printStackTrace();
		}
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(mediaType);
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		re = new ResponseEntity<byte[]>(fileBytes,headers,HttpStatus.OK);
		return re;
	}
	
	@GetMapping(value="/pic64/{id}",produces="text/plain")
	public @ResponseBody String getPictureBase64(@PathVariable int id) {
		
		Campaign camp = campService.getCampaignById(id);
		
		if(camp == null) {
			return null;
		}
		
		String filePath = camp.getPicturePath();
		
		StringBuffer responseMsg = new StringBuffer();
		
		String mimeType = context.getMimeType(filePath);
		try (
				InputStream is = new FileInputStream(filePath);
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
			){
				byte[] b = new byte[819200];
				int len = 0;
				while ((len= is.read(b)) != -1) {
					baos.write(b, 0, len);
				}
				byte[] bytes = baos.toByteArray();
				String prefix = "data:" + mimeType + ";base64,";
				// 由於java.io.OutputStream類別無法寫出字串，因此將字串轉為位元組陣列寫出
				responseMsg.append(prefix);
				Base64.Encoder be = Base64.getEncoder();	
				responseMsg.append(new String(be.encode(bytes)));
			} catch(Exception ex) {
				ex.printStackTrace();
			}
		return responseMsg.toString();
	}
	
	
	@GetMapping("/boIndex/{pageNum}")
	public String BoCampaignPage(Model model,
			@PathVariable int pageNum) {
		
		
		Page<Campaign> page = new Page<Campaign>();
		page.setCurrentPage(pageNum);
		Company company = (Company)model.getAttribute("company");
		
		if(company==null) {
			return "redirect:/";
		}
		
		campService.getCampaignPageOfCompany(page,company.getId());
		List<Campaign> camps = page.getContent();
		for(Campaign camp:camps) {			
			camp.isActive();
		}
		model.addAttribute("page", page);
		return "campaign/CampaignShowPage";
	}
	
	@GetMapping("/boDetail/{campaignId}")
	public String boCampaignDeatail(@PathVariable Integer campaignId,Model model) {
		Campaign camp = campService.getCampaignById(campaignId);
		model.addAttribute("camp", camp);
		return "campaign/CampaignAddComfirmPage";
	}
	
	@GetMapping("/ShowUpdatePage/{campaignId}")
	public String showUpdatePage(@PathVariable int campaignId,Model model) {
		Campaign camp= campService.getCampaignById(campaignId);
		camp.convertTimestampToString();
		model.addAttribute("camp", camp);
		return "campaign/CampaignUpdatePage";
	}
	
	@GetMapping(value="/searchAjax/{companyId}/{page}",produces = "application/json; charset=UTF-8")
	public @ResponseBody Page<Campaign> searchCampaignAjax(@ModelAttribute SearchBean search, 
			@PathVariable int companyId,
			@PathVariable int page,
			HttpServletResponse response) {
		Page<Campaign> pageResult = new Page<Campaign>();
		search.convertStringToTimestamp();
		pageResult.setCurrentPage(page);
		pageResult = campService.searchCampaignOfCompany(companyId, search, pageResult);
		return pageResult;
	}
	
	@GetMapping(value="/search/{pageNum}")
	public String searchCampaign(@ModelAttribute SearchBean searchBean	,
									@PathVariable Integer pageNum,
									Model model,
									BindingResult result
			) {
		
		Company company = (Company)model.getAttribute("company");
		if(company==null) {
			return "redirect:/";
		}
		
		SearchValidator validator = new SearchValidator();
		validator.validate(searchBean, result);
		if(result.hasErrors()) {
			return "campaign/CampaignShowPage";
		}
		Page<Campaign> page = new Page<Campaign>();
		searchBean.convertStringToTimestamp();
		page.setCurrentPage(pageNum);
		page = campService.searchCampaignOfCompany(company.getId(), searchBean, page);
		List<Campaign> camps = page.getContent();
		for(Campaign camp:camps) {			
			camp.isActive();
		}
		model.addAttribute("page", page);
		model.addAttribute("search",searchBean);
		model.addAttribute("isSearch",true);
		new String();
		return "campaign/CampaignShowPage";
	}
	
	
	
	@GetMapping("/index")
	public String campaignUserIndex(Model model) {
		List<Company> companys = companyService.getAllCompany();
		for(Company company:companys) {
			//篩選企業，狀態為false則continue
			if(company.getStatus()==false) {
				
				companys.remove(company);
				continue;
				
			}
			
			List<Campaign> camps = campService.getRandomCampaignbyCompany(company.getId(), 3);
			Set<Campaign> campsSet = new HashSet<Campaign>(camps);
			company.setCampaigns(campsSet);
		}
		model.addAttribute("companys", companys);
		return "campaign/CampaignIndex";
	}
	
	@GetMapping("/index/{companyId}")
	public String ComapnyCampaignFP(@PathVariable int companyId,
			Model model) {
		Page<Campaign> page = new Page<Campaign>();
		page.setCurrentPage(1);
		campService.getActiveCampaignPageByCompany(page,companyId);
		model.addAttribute("page", page);
		model.addAttribute("comp", companyService.getCompanyById(companyId));
		return "/campaign/CampaignOfCompany";
	}
	
	@PostMapping("/companyCampPage/{companyId}")
	public @ResponseBody Page<Campaign> ComapnyCampaignPage (@ModelAttribute Page<Campaign> page,
																@PathVariable Integer companyId
			){
		campService.getActiveCampaignPageByCompany(page,companyId);
		for(Campaign camp :page.getContent()) {
			camp.convertTimestampToString();
		}
		return page;
	}
	
	@GetMapping("/getIndexCamp")
	public @ResponseBody List<Campaign> CampaignOfIndex(){
		
		List<Campaign> resultCamps = new ArrayList<Campaign>();//要傳到首頁的活動
		List<Campaign> AllCamps = campService.getAllCampaign();//全部活動
		List<Campaign> activeCamp = new ArrayList<Campaign>();//進行中的活動容器
		
		//篩選進行中的活動
		for(Campaign camp:AllCamps) {
			if(camp.getStatus() && !camp.getExpired()) {
				activeCamp.add(camp);
			}
		}
		
		//當活動數量小於6並且進行中得活動大於0則繼續取
		while(resultCamps.size()<6 && activeCamp.size()>0) {
			int randomNum = (int)(Math.random()*activeCamp.size());
			resultCamps.add(activeCamp.get(randomNum));
			activeCamp.remove(randomNum);//刪除已經取得的活動，避免重複
		}
		
		return resultCamps;
	}
	
	@GetMapping("/detail/{campId}")
	public String CampDetailPage(@PathVariable Integer campId,
									Model model
			) {
		Campaign camp = campService.getCampaignById(campId);
		List<Campaign> sideCamps = campService.getRandomCampaignbyCompany(camp.getCompany().getId(), 3);
		model.addAttribute("camp", camp);
		model.addAttribute("sideCamps", sideCamps);
		return "/campaign/CampaignDetailFE";
	}
	
	@GetMapping("/applyPage/{campaignId}")
	public String applyCampaignPage(Model model, @PathVariable Integer campaignId) {
		return "campaign/CampaignApplyPage";
	}
	
	@PostMapping("/applyCampaign")
	public @ResponseBody Map<String,String> applyCampaign(@RequestBody List<Integer> productIds														 
			){
		for(int i:productIds) {
			Product product = productService.getProduct(i);
		}
		return null;
	}
	
	@ModelAttribute(name = "searchBean")
	public SearchBean getSearchbean() {
		SearchBean searchbean = new SearchBean();
		searchbean.setStatus(0);
		return searchbean;
	}
	
}
