package com.web.store.home.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.store.account.javabean.MemberBean;
import com.web.store.account.service.AccountService;
import com.web.store.product.service.ProductService;
import com.web.store.report.model.Report;
import com.web.store.report.service.ReportService;


//import mvc.examples.model.Cat;

@Controller
public class HomeController {
	@Autowired
	AccountService accountService;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	ProductService pService;
	
	@Autowired
	ReportService reportService; 
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}

	@RequestMapping("/layout/head")
	public String layoutHead() {
		return "layout/head"; //
	}

	@RequestMapping("/layout/footer")
	public String layoutFooter() {
		return "layout/footer"; //
	}
	
	
	@RequestMapping("/layout/accountMenu")
	public String accountMenu() {
		return "layout/accountMenu"; //
	}
	
	@RequestMapping("/layout/accountHeader")
	public String accountHeader() {
		return "layout/accountHeader"; //
	}

	@RequestMapping("/layout/header")
	public String layoutHeader(Model model, HttpSession session) throws IOException, SQLException {
		MemberBean member = (MemberBean) session.getAttribute("currentUser");
		if (member != null) {
			System.out.println("MemeberId: " + member.getId() + ", Fullname: " + member.getFullname() + ", Email: "
					+ member.getEmail());

			if (member.isVerified()) {

				if (member.isActive()) {
					// 讀取圖片檔
					byte[] imagebytes = null;
					if (member.getProfileImage1() != null) {
						imagebytes = member.getProfileImage1();
					} else {
						File aFile = new File(servletContext.getRealPath("/WEB-INF/views/img/profile-icon.png"));
						System.out.println("size:" + aFile.length());
						InputStream is = new FileInputStream(aFile);
						imagebytes = is.readAllBytes();
					}
					byte[] encodeBase64 = Base64.encodeBase64(imagebytes);
					String base64Encoded = new String(encodeBase64, "UTF-8");
					member.setProfileImage1Base64(base64Encoded);

					model.addAttribute("user", member);
					model.addAttribute("userNotificationNo", (member != null) ? accountService.getMemberNotificationCount(member.getId()) : null);
				}
			}
			

		}
		//搜尋列下方所有廠商的銷售前五名商品
		List<Report> queryProductTop = reportService.queryProductTop();
		model.addAttribute("queryproducttop", queryProductTop);
		
		return "layout/header"; //
	}
	
	
	@RequestMapping("/bo")
	public String boIndex() {
		return "crm/backOffice";
	}
	
	@RequestMapping("/company/CmpRegi")
	public String companyRegister() {
		return "company/CompanyRegister";
	}
//	@RequestMapping("/CmpLog")
//	public String companyLogin() {
//		return "company/CompanyLogin";
//	}
	
	//Report.Jsp頁面連結
	@RequestMapping("/reportindex")
	public String reportindex() {
		return "report/Report";
	}

}
