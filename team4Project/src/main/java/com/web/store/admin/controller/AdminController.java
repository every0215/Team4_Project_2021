package com.web.store.admin.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.store.account.common.SendInBlueMail;
import com.web.store.account.common.Utility;
import com.web.store.account.common.VerifyReCAPTCHA;
import com.web.store.account.javabean.MemberBean;
import com.web.store.account.javabean.MemberSubscription;
import com.web.store.account.service.AccountService;
import com.web.store.account.validator.MemberValidator;
import com.web.store.admin.service.AdminService;
import com.web.store.company.model.Company;
import com.web.store.company.service.CompanyService;

//import mvc.examples.model.Cat;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	@Autowired
	AccountService accountService;

	@Autowired
	AdminService adminService;

	@Autowired
	ServletContext servletContext;

	@RequestMapping("/login")
	public String login() {
		return "admin/login";
	}
	
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.removeAttribute("AdminLoggedIn");
		return new ModelAndView("redirect:/admin/login");
	}
	
	@RequestMapping("/memberManage")
	public String memberManage(HttpSession session) {
		Boolean adminLoggedIn = (Boolean) session.getAttribute("AdminLoggedIn");
		if ((adminLoggedIn == null) || (!adminLoggedIn)) {
			return "admin/login";
		}
		return "admin/memberManage";
	}

	@PostMapping("/login")
	public ModelAndView login(
			@RequestParam("accountName") String accountName,
			@RequestParam("pwd") String pwd,
			@RequestParam("g-recaptcha-response") String gRecaptchaResponse, Model model, HttpSession session)
			throws Exception {
		// get request parameters for userID and password


		System.out.println("gRecaptchaResponse: " + gRecaptchaResponse);
		boolean verified = VerifyReCAPTCHA.verify(gRecaptchaResponse);

		if (!verified) {
			model.addAttribute("verified", false);
			model.addAttribute("msg", "驗證碼驗證失敗");
			return new ModelAndView("admin/login");
		}

		System.out.println("Logging in Admin=" + accountName + "::password=" + pwd + ":: Captcha verified: " + verified);
		
		if ((!accountName.equals("superadminuser"))&(!pwd.equals("gNK!7H0u0tmu@AFmr"))) {
			model.addAttribute("verified", false);
			model.addAttribute("msg", "登入資訊有誤");
			return new ModelAndView("admin/login");
		}

		session.setAttribute("AdminLoggedIn", true);
		

		return new ModelAndView("redirect:/admin/memberManage");
	}

	@GetMapping(value = "/getMemberList", produces = "application/json")
	public @ResponseBody Object getMemberList(
			@RequestParam("page") int page, 
			@RequestParam("pageSize") int pageSize,
			@RequestParam("keywordFullname") String keywordFullname, 
			@RequestParam("keywordEmail") String keywordEmail,
			@RequestParam("keywordQid") String keywordQid,
			@RequestParam("columnName") String columnName,
			@RequestParam("sortASC") Boolean sortASC
			) throws Exception {
		List<MemberBean> members = new LinkedList<MemberBean>();

		// members.addAll(adminService.selectByConditions(1, pageSize)) ;

		page = (page - 1) - 1;
		if (page < 0)
			page = 0;
		for (int i = 0; i < (page) * pageSize; i++) {
			MemberBean m = new MemberBean();
			members.add(m);
		}
		members.addAll(adminService.selectByConditions(page, pageSize, keywordFullname, keywordEmail, keywordQid, columnName, sortASC));

//		for(int i = 0 ; i < (page-1)*pageSize; i++) {
//			MemberBean m = new MemberBean();
//			members.add(m);
//		}
//		members.addAll(adminService.selectByConditions(page, pageSize)) ;
		System.out.println(
				"Admin(MemberPage) page: " + page + "pageSize:" + pageSize + ", added members(" + members.size() + ")" + ", columnName:" + columnName + ", sortASC:" + sortASC );

		JSONObject json = new JSONObject();
		json.put("TotalCount", adminService.selectByConditions(0, 0, keywordFullname, keywordEmail, keywordQid, columnName, sortASC));
		json.put("Members", members);

//		MemberBean m = new MemberBean("nickname","fullname","A121212121","", null);
//		m.setId(1);
//		members.add(m);
//		

//		return members;
		return json.toString();
	}

	@GetMapping(value = "/getMemberTotalCount", produces = "application/json")
	public @ResponseBody int getMemberTotalCount() throws Exception {

		return adminService.getTotalCount();
	}

	@GetMapping("/updateStatus")
	public @ResponseBody String updateStatus(
			@RequestParam("memberId") String memberId,
			@RequestParam("status") Boolean status,
			Model model, HttpSession session)
			throws Exception {
		
		MemberBean m = accountService.selectById(memberId);
		m.setActive(status);
		accountService.update(m);
		System.out.println("Member(setActive): status=" + status );
		//model.addAttribute("verified", true);
		//model.addAttribute("msg", "會員狀態變更成功");
		
		
		return String.valueOf(status);
	}

}
