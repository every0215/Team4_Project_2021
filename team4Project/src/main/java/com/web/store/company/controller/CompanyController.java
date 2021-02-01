package com.web.store.company.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.http.HttpResponse;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
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
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.web.store.campaign.model.Campaign;
import com.web.store.campaign.model.Page;
import com.web.store.campaign.model.SearchBean;
import com.web.store.company.model.CmpService;
import com.web.store.company.model.Company;
import com.web.store.company.model.Store;
import com.web.store.company.service.CmpServiceService;
import com.web.store.company.service.CompanyService;
import com.web.store.company.service.StoreService;
import com.web.store.ticket.model.Event;






@Controller
//@SessionAttributes("company") 
public class CompanyController {
	
	@Autowired
	CompanyService cmpService;
	
	@Autowired
	StoreService stoService;
	
	@Autowired
	CmpServiceService cmpsvService;
	
	@Autowired
	ServletContext context;
	///////////////////////////////////////企業新增///////////////////////////////////////////
	
	
	//註冊企業資料包含文字 圖片(V)
	@PostMapping(value="/company/CompanyRegister")
	public String companyRegister(
			@RequestParam String companyName,
			@RequestParam String uniformNumbers,
			@RequestParam Integer categories,
			@RequestParam String account,
			@RequestParam String password,
			@RequestParam String phone,
			@RequestParam String email,
			@RequestParam(value="brand",required=false)MultipartFile logo,
			@RequestParam(value="busR",required=false)MultipartFile busRC,
//			HttpServletResponse response
			SessionStatus sessionStatus
			) throws IOException {
		
		/////////////////存圖片轉成Byte陣列////////////////////

		//用getBytes方法把上傳的MultipartFile logo 轉成 byte[]
		byte[] logoB = logo.getBytes();
		byte[] busRCB = busRC.getBytes();

		  try {
		   //再把Byte[]轉成Blob物件
		   Blob logoblob = new javax.sql.rowset.serial.SerialBlob(logoB);
		   Blob busRCblob = new javax.sql.rowset.serial.SerialBlob(busRCB);
		   //取得logo 的Filename
		   String logoName = logo.getOriginalFilename();
		   String busRCName = busRC.getOriginalFilename();
		   //得到的參數塞到建構子                  Blob物件  Filename
		   Company cmp = new Company(companyName,logoblob,logoName,uniformNumbers,categories,account,password,email,phone,busRCblob,busRCName);
		   //呼叫Service新增到資料庫
		   cmpService.addCompany(cmp);
	   
		  } catch (SerialException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  } catch (SQLException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  }
		  
		/////////////////存圖片轉成Byte陣列////////////////////
		//密碼洩漏問題
		sessionStatus.setComplete();
		return "redirect:/index";
		
		
	}
	//更新企業資料(V)
	@PostMapping(value="/company/updateCompany")
	public String updateCompany(
			@RequestParam Integer id,
			@RequestParam String companyName,
			@RequestParam String uniformNumbers,
			@RequestParam Integer categories,
			@RequestParam String account,
			@RequestParam String password,
			@RequestParam String phone,
			@RequestParam String email,
			@RequestParam(value="logoA",required=false)MultipartFile logo,
			@RequestParam(value="busRCA",required=false)MultipartFile busRC,
//			HttpServletResponse response
			//
//			SessionStatus sessionStatus,
			HttpSession session,
			Model model
			) throws IOException {
		
//		sessionStatus.setComplete();
		session.removeAttribute("company");
		
		System.out.println("更新企業資料");
		/////////////////存圖片轉成Byte陣列////////////////////
		
		//用getBytes方法把上傳的MultipartFile logo 轉成 byte[]
		byte[] logoB = logo.getBytes();
		byte[] busRCB = busRC.getBytes();
		
		try {
			//再把Byte[]轉成Blob物件
			Blob logoblob = new javax.sql.rowset.serial.SerialBlob(logoB);
			Blob busRCblob = new javax.sql.rowset.serial.SerialBlob(busRCB);
			//取得logo 的Filename
			String logoName = logo.getOriginalFilename();
			String busRCName = busRC.getOriginalFilename();
			//得到的參數塞到建構子                     Blob物件  Filename
			System.out.println("更新企業資料 加入Bean");
			Company cmp = new Company(id,companyName,logoblob,logoName,uniformNumbers,categories,account,password,email,phone,busRCblob,busRCName);
			//呼叫Service更新資料庫
//			System.out.println(cmp);
			cmpService.updateCompany(cmp);
			System.out.println("更新成功");
			//更新之後要重設Session
			model.addAttribute("company", cmp);
			session.setAttribute("company", cmp);
			session.setMaxInactiveInterval(60 * 60 * 24* 3);
		} catch (SerialException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/////////////////存圖片轉成Byte陣列////////////////////
		
		return "redirect:/reportin";
		
	}
	

	//取企業圖片(V)
	@GetMapping(value = "/company/getCompanyimage/{id}")
	public ResponseEntity<byte[]> getPictureById(HttpServletResponse resp, @PathVariable Integer id) {
		String filePath = "/images/NoImage.jpg";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String logoname = "";
		
		int len = 0;
		Company cmp = cmpService.getCompanyById(id);
		
		if (cmp != null) {
			
			Blob logoblob = cmp.getLogo();
			
			logoname = cmp.getLogoName();
			
			if (logoblob != null) {
				
				try {
					len = (int) logoblob.length();

					media = logoblob.getBytes(1, len);

				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				logoname = filePath;
			}
		} else {
			media = toByteArray(filePath);
			logoname = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		System.out.println("media"+media);
		String mimeType = context.getMimeType(logoname); //getMimeType 會抓出副檔名的mimetype  
		System.out.println("--------mimeType"+mimeType);
		System.out.println("123-----filename---"+logoname);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("66666mimeType = "+mimeType+"   mediaType = " + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}
	
	
	
	
	

	//輸出圖片裡會用到的方法(V)
	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);  
		try {
//			System.out.println("filepath = "+filepath);  //resources/images/NoImage.jpg
//			System.out.println("realPath = "+realPath);  //C:\WebSource\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\mvcExercise\resources\images\NoImage.jpg
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
	///////////////////////////////////////企業新增///////////////////////////////////////////
	///////////////////////////////////////企業登入///////////////////////////////////////////
	

	//企業登入(V)
	@PostMapping(value="/company/CompanyLogin")
	public String Login(
			@RequestParam String account,
			@RequestParam String password,
			Model model,
			///////////////////
			HttpSession session
			///////////////////
			
			) {
		Company cmp = cmpService.verifyLogin(account, password);
		
		if(cmp!= null) {
//			setCompany(cmp);
//			model.addAttribute("company", cmp);//直接這樣子就可以
			//////////////////////////

			session.setAttribute("company", cmp);
			session.setMaxInactiveInterval(60 * 60 * 24* 3);
			//////////////////////////
			Company company=(Company)session.getAttribute("company");
			int companyId = company.getId();
			System.out.println("登入companyId:"+companyId);
			
			return "redirect:/reportin";
		}else {
			return "redirect:/";
		}	
	}
//	當@ModelAttribute標註在方法前，表示這個方法回傳的值會以model.addAttribute()攜帶，並且
//	優先於所有這個controller的方法前執行
//	所以當進入到登錄的映射方法前就會呼叫這個方法，此時cmp裡面還是空的，所以session接到的是一個空的Company
//	 @ModelAttribute("company")
//	    public Company setCompany(Company cmp) {
//	        return cmp;
//	    }
	//設為sessionAttribute
	@ModelAttribute("Company")
	    public Company setCompany(Company cmp) {
	        return cmp;
	}
	//登出(V)
	@GetMapping(value="/company/Logout")
	public String Logout(HttpSession session) {
		session.removeAttribute("company");
//		sessionStatus.setComplete();
		return "redirect:/";
//		/index
	}
	 
	///////////////////////////////////////企業登入///////////////////////////////////////////
	///////////////////////////////////////秀合作企業///////////////////////////////////////////
	//秀合作企業(V)
	@RequestMapping("/company/showCompany")
	public String showCompany(Model model) {

		List<Company> list = cmpService.getAllCompany();
		for(Company cmp:list) {
			System.out.println(cmp.getCompanyName());
		}
		model.addAttribute("CompanyList", list);
		return "/company/ShowCompany";
	}
	///////////////////////////////////////秀合作企業///////////////////////////////////////////
	
//	@GetMapping("/CompanyInfo")
//	public String companyInfo() {
//		return "/company/CompanyRegister";
//	}
	
	///////////////////////////////////////企業服務///////////////////////////////////////////
	
	@GetMapping("/company/CompanyServiceRegister")
	public String companyServiceRegister() {
		return "/company/CompanyServiceRegister";
	}
	//新增企業服務(V)
	@PostMapping(value="/company/serviceRegister")
	public String serviceRegister(
			
			@RequestParam(value="CompanyId")Integer id,
			@RequestParam(value="ServiceP",required=false)MultipartFile spServiceImg,
			@RequestParam(value="Ser")String spService,
			HttpSession session,
			Model model
			) throws IOException {
		Company company=(Company)session.getAttribute("company");
		
		/////////////////存圖片轉成Byte陣列////////////////////

		//用getBytes方法把上傳的MultipartFile logo 轉成 byte[]
		byte[] svB = spServiceImg.getBytes();
		

		  try {
		   //再把Byte[]轉成Blob物件
		   Blob svblob = new javax.sql.rowset.serial.SerialBlob(svB);
		  
		   //取得logo 的Filename
		   String svImgName = spServiceImg.getOriginalFilename();
		  
		   //得到的參數塞到建構子                  Blob物件  Filename
		   CmpService cmpsv = new CmpService(spService, svblob, svImgName,company);
		   //呼叫Service新增到資料庫
		   cmpsvService.addService(cmpsv);
		   model.addAttribute("respsv", "新增成功!!!");
	   
		  } catch (SerialException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  } catch (SQLException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  }
		  
		/////////////////存圖片轉成Byte陣列////////////////////
		return "/company/CompanyServiceRegister";
	}
	
	
	
	
	//企業簡介修改(V)
	@PostMapping("/company/updateCompanyProfile")
	public String insertCompanyProfiles(
		
		@RequestParam Integer id,
		@RequestParam String profiles,
		Model model
		,HttpSession session
		) {

		Company company=(Company)session.getAttribute("company");
		System.out.println("profiles:"+profiles);
		if(profiles.equals(null) || profiles.equals("")) {

			model.addAttribute("resp", "請輸入簡介!!!");
			return "/company/CompanyProfiles";
		}else {
			cmpService.updateProfiles(id,profiles);
			company.setProfiles(profiles);
			session.setAttribute("company", company);
		}
		//如果有找到就更新

		return "redirect:/reportin";
	}

	///////////////////////////////////////企業服務///////////////////////////////////////////
	
	/////////////////////////////////////////門市部分/////////////////////////////////////////
	
	//Show data table 查門市資料
	@GetMapping(value="/company/ShowStore")
	public String showAllStore(
			Model model,
			HttpSession session
			) {
		Company company=(Company)session.getAttribute("company");
		int companyId = company.getId();
		System.out.println("companyId:"+companyId);
		List<Store> sto = stoService.getAllStoreByCompanyId(companyId);
		
		model.addAttribute("storeList", sto);
		return "/company/ShowStore";
	}
	
	//新增門市頁面帶BEAN(V)
	@GetMapping("/company/storeRegister")
	public String showStoreForm(Model model) {
		
		Store sto = new Store();
		//可預設
		sto.setStatus(true);

		model.addAttribute("storeBean", sto);
		return "/company/StoreRegister";
	}
	//新增頁面(V)
	@PostMapping("/company/storeRegister")
	public String insertStoreData(
		@ModelAttribute("storeBean") Store sto ,
		HttpSession session
//		,@RequestParam String openhour
//		,@RequestParam String closehour
		///////////////////
		, RedirectAttributes ra
		///////////////////
//		, BindingResult bindingResult 
		) {
		Company company=(Company)session.getAttribute("company");
		//驗證判斷有無錯誤
//		new CustomerValidator().validate(bean, bindingResult);    
//		if (bindingResult.hasErrors()) {
//			return "_01_customer/CustomerForm";
//		}
		
//		System.out.println(sto.getId());
//		System.out.println(sto.getStoreName());
//		System.out.println(sto.getStoreArea());
//		System.out.println(sto.getStoreAddress());
//		System.out.println(sto.getPhone());
//		System.out.println(sto.getFex());
//		System.out.println(sto.getBusinessHour());
//		System.out.println(sto.getOpenhour());
//		System.out.println(sto.getClosehour());
//		System.out.println(sto.getCompanyId());
//		System.out.println(sto.getProfiles());
//		System.out.println(sto.getStatus());
		sto.setCompany(company);
		
		//如果有找到就更新
		if (sto.getId() != null ) {
			stoService.update(sto);
		} 
		
		stoService.addStore(sto);
		/////////////////////////////////
		ra.addFlashAttribute("storeBean", sto);
		
		/////////////////////////////////
		return "redirect:/company/StoreRegister_Profile";
	}
	

	//新增門市簡介(V)
	@PostMapping("/company/updateStoreProfiles")
	public String insertStoreProfiles(
		@RequestParam Integer cmpid,
		@RequestParam Integer id,
		@RequestParam String profiles,
		HttpSession session
		
		) {
		
		//驗證判斷有無錯誤
//		new CustomerValidator().validate(bean, bindingResult);    
//		if (bindingResult.hasErrors()) {
//			return "_01_customer/CustomerForm";
//		}
		
		
		Company company=(Company)session.getAttribute("company");
//		int companyId = company.getId();
//		System.out.println("companyId:"+companyId);
		System.out.println("profiles:"+profiles);
		if(profiles.equals(null) || profiles.equals("")) {
			System.out.println("==============================="+company.getId());
			Company cmp= cmpService.getCompanyById(company.getId());
			String newProfiles = cmp.getProfiles();
			System.out.println("cmp.getId()"+cmp.getId());
			System.out.println("企業簡介"+newProfiles);
			stoService.updateProfiles(id, newProfiles);
		}else {
			stoService.updateProfiles(id, profiles);
		}
		//如果有找到就更新
		
		session.setAttribute("tempStoreId", id);
//		if (sto.getId() != null ) {
//			stoService.update(sto);
//		} 
//		System.out.println("沒有update");
//		stoService.addStore(sto);
		return "redirect:/company/StoreRegister_Service";
	}
	

	////////////////////////////顯示門市服務圖片/////////////////////////////
	@GetMapping(value = "/company/getCompanyServiceImage/{id}")
	public ResponseEntity<byte[]> getCmpPictureById(HttpServletResponse resp, @PathVariable Integer id, HttpSession session) {
		
//		Company company=(Company)session.getAttribute("company");
		System.out.println("秀服務圖片");
		String filePath = "/images/NoImage.jpg";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String svFilename = "";
		
		int len = 0;
//		Company cmp = cmpService.getCompanyById(id);
		CmpService cmpsv = cmpsvService.getCmpsvBysvId(id);
		
		if (cmpsv != null) {
			
			Blob logoblob = cmpsv.getSpServiceImg();
			
			svFilename = cmpsv.getSvFilename();
			
			if (logoblob != null) {
				
				try {
					len = (int) logoblob.length();
//					System.out.println(len);
					media = logoblob.getBytes(1, len);
//					System.out.println(media);
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				svFilename = filePath;
			}
		} else {
			media = toByteArray(filePath);
			svFilename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		System.out.println("media"+media);
		String mimeType = context.getMimeType(svFilename); //getMimeType 會抓出副檔名的mimetype  
		System.out.println("--------mimeType"+mimeType);
		System.out.println("123-----filename---"+svFilename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("66666mimeType = "+mimeType+"   mediaType = " + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		System.out.println("秀服務圖片成功");
		return responseEntity;
	}
	
		///////////////////////////////////////門市服務新增//////////////////////////////////////////////
	
	//註冊門市服務(寫驗證不可為空)
	@PostMapping(value="/company/storeServiceRegister")
	public String storeServiceRegister(
			//Service的Id
			@RequestParam(value="service") String[] id,
			//Store的Id
//			@RequestParam(value="Ser")String spService,
			HttpSession session,
			Model model
			) throws IOException {
		Integer stoId = (Integer)session.getAttribute("tempStoreId");
		stoService.combineStoreService( id, stoId);
		session.removeAttribute("tempStoreId");


		return "redirect:/company/storeRegister";
		
		
	}
	
	
	
	
	
	
	
	//////////////////////////////////////查詢頁面修改按鈕//////////////////////////////////////////
	//門市頁面修改(V)
	@GetMapping("/company/ShowStore/{id}")
	public String editCustomerForm(Model model, @PathVariable Integer id) {
		
		Store sto = stoService.getStoreById(id);
		
		model.addAttribute("storeBean", sto);
		return "/company/StoreUpdate";
	}
	//門市修改
	@PostMapping("/company/updateStore")
	public String updateStoreData(
		@ModelAttribute("storeBean") Store sto 
		, RedirectAttributes ra
		,HttpSession session
		) {
		Company company=(Company)session.getAttribute("company");
		//驗證有無錯誤
//		new CustomerValidator().validate(bean, bindingResult);    
//		if (bindingResult.hasErrors()) {
//			return "_01_customer/CustomerForm";
//		}
		sto.setCompany(company);
		System.out.println("修改進控制器");
		System.out.println("sto.getId()"+sto.getId());
		//如果有找到就更新
		if (sto.getId() != null ) {
			System.out.println("update資料");
			stoService.update(sto);
		} 
		
//		stoService.addStore(sto);
		/////////////////////////////////
		ra.addFlashAttribute("storeBean", sto);
		
		/////////////////////////////////
		return "/company/StoreRegister_Service";
	}
	
	
//=========================================================================	
//                               地圖搜尋
//=========================================================================	
	//店名搜尋(V)
	@GetMapping(value="/company/mapGetStoreByName/{cmpid}/{stoName}",produces = "application/json; charset=UTF-8")
	public @ResponseBody List<Store> mapGetStoreByName( 
			@PathVariable("cmpid") String cmpid,
			@PathVariable("stoName") String stoName
			) {
		System.out.println("Ajax接收資料 地圖店名搜尋");
		
		//依名字找門市
		List<Store> storeByName = stoService.getStoreByName(cmpid,stoName);
		System.out.println("================================="+storeByName);
		return storeByName;
	}
	
	//服務搜尋(未完成)
	@PostMapping(value="/company/mapGetStoreByService ",produces = "application/json; charset=UTF-8")
	public @ResponseBody List<Store> mapGetStoreByService(
			@RequestParam(value="service") String[] id,
			HttpSession session,
			Model model
			) throws IOException {
		System.out.println("Ajax接收資料 地圖服務搜尋");
		
		List<Store> stoByService= stoService.getStoreByService(id);
		//要寫好SERVICE
		return stoByService;
		
		
		
	}
	
	//按區域搜尋(V)
	@GetMapping(value="/company/mapGetStoreByArea/{cmpid}/{area}",produces = "application/json; charset=UTF-8")
	public @ResponseBody List<Store> mapGetStoreByArea( 
			@PathVariable("cmpid") String cmpid,
			@PathVariable("area") String area
			) {
		
		System.out.println("Ajax接收資料 區域搜尋");

		
		
		List<Store> storeByArea = stoService.getStoreByArea(cmpid,area);
		
		return storeByArea;
	}
	
	//按企業丟回服務(V)
	@GetMapping(value="/company/testAjax",produces = "application/json; charset=UTF-8")
	public @ResponseBody Set<CmpService> searchCampaignAjax( 
			@RequestParam("test") String cmpid
			) {
		System.out.println("Ajax接收資料 企業搜尋服務");
		if(cmpid.equals("0")) {
			return null;
		}else {
			
			Set<CmpService> cmpsv = cmpService.getCompanyService(Integer.parseInt(cmpid));
			System.out.println(cmpsv);
			return cmpsv;
		}
	}
	//按座標找門市資訊(V)
	@GetMapping(value="/company/mapGetStoreByMarker",produces = "application/json; charset=UTF-8")
	public @ResponseBody Store searchStoreInfoByMarker( 
			@RequestParam("lat") String lat,
			@RequestParam("lng") String lng
			) {
		System.out.println("Ajax接收資料 座標搜尋門市 ");
		Store sto = stoService.getStoreByMarker(lat,lng);
		
		System.out.println(sto);
		return sto;
	}
}
