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
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

import com.web.store.campaign.model.Campaign;
import com.web.store.company.model.Company;
import com.web.store.company.model.Store;
import com.web.store.company.service.CompanyService;
//import com.web.store.company.service.StoreService;
import com.web.store.ticket.model.Event;


@Controller
@SessionAttributes("company") 
public class CompanyController {
	
	@Autowired
	CompanyService cmpService;
	
//	@Autowired
//	StoreService stoService;
//	
	@Autowired
	ServletContext context;
	///////////////////////////////////////企業新增///////////////////////////////////////////
	//註冊企業資料包含文字 圖片
	@PostMapping(value="/CompanyRegister")
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
	////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////
	@PostMapping(value="/updateCompany")
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
			SessionStatus sessionStatus,
			Model model
			) throws IOException {
		System.out.println("HELLO");
		sessionStatus.setComplete();
		
		
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
			Company cmp = new Company(id,companyName,logoblob,logoName,uniformNumbers,categories,account,password,email,phone,busRCblob,busRCName);
			//呼叫Service更新資料庫
//			System.out.println(cmp);
			cmpService.updateCompany(cmp);
			//更新之後要重設Session
			model.addAttribute("company", cmp);
		} catch (SerialException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/////////////////存圖片轉成Byte陣列////////////////////
		
		return "/index";
		
	}
	
	@GetMapping(value="/testImage")
	public String testImage() {
		return "\\company\\ShowCompanyInfo";
	}
	//輸出圖片
	@GetMapping(value = "/getCompanyimage/{account}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable String account) {
		String filePath = "/images/NoImage.jpg";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String logoname = "";
		
		int len = 0;
		Company cmp = cmpService.getCompany(account);
		
		if (cmp != null) {
			
			Blob logoblob = cmp.getLogo();
			
			logoname = cmp.getLogoName();
			
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
	//輸出圖片裡會用到的方法
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
	@PostMapping(value="/CompanyLogin")
	public String Login(
			@RequestParam String account,
			@RequestParam String password,
			Model model
			) {
		Company cmp = cmpService.verifyLogin(account, password);
		
		if(cmp!= null) {
//			setCompany(cmp);
			model.addAttribute("company", cmp);//直接這樣子就可以
			System.out.println("controller");
			return "redirect:/crm/backOffice";
		}else {
			return "/company/CompanyLogin";
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
	//登出
	@GetMapping(value="/Logout")
	public String Logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "/index";
	}
	 
	///////////////////////////////////////企業登入///////////////////////////////////////////
	///////////////////////////////////////秀合作企業///////////////////////////////////////////
	//秀合作企業
	@RequestMapping("/showCompany")
	public String showCompany(Model model) {

		List<Company> list = cmpService.getAllCompany();
		for(Company cmp:list) {
			System.out.println(cmp.getCompanyName());
		}
		model.addAttribute("CompanyList", list);
		return "/company/ShowCompany";
	}
	///////////////////////////////////////秀合作企業///////////////////////////////////////////
	
	@GetMapping("/CompanyInfo")
	public String companyInfo() {
		return "/company/CompanyRegister";
	}
	//////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////
	
//	@GetMapping(value="/ShowStore")
//	public String showAllStore(
//			Model model
//			) {
//		
//		List<Store> sto = stoService.getAllStore();
//		model.addAttribute("store", sto);
//		return "/company/ShowStore";
//	}
	
	
	
	
	
	
	
	
	
	
	
	
}
