package com.web.store.account.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Properties;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

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
import com.web.store.account.common.VerifyReCAPTCHA;
import com.web.store.account.javabean.MemberBean;
import com.web.store.account.javabean.MemberSubscription;
import com.web.store.account.service.AccountService;
import com.web.store.account.validator.MemberValidator;
import com.web.store.company.model.Company;
import com.web.store.company.service.CompanyService;

//import mvc.examples.model.Cat;

@Controller
public class AccountController {
	@Autowired
	AccountService accountService;

	@Autowired
	CompanyService companyService;

	@Autowired
	ServletContext servletContext;

	@RequestMapping("/layout/lukeTop")
	public String layoutTop() {
		return "layout/lukeTop"; //
	}

	@RequestMapping("/account/register")
	public String register() {
		return "account/register";
	}

	@RequestMapping("/account/login")
	public String login() {
		return "account/login";
	}

	@RequestMapping("/account/logout")
	public ModelAndView logout(HttpSession session) {
		session.removeAttribute("currentUser");

		return new ModelAndView("redirect:/");
	}

	@PostMapping("/account/login")
	public ModelAndView login(@ModelAttribute("member") MemberBean member,
			@RequestParam("g-recaptcha-response") String gRecaptchaResponse, Model model, HttpSession session)
			throws Exception {
		// get request parameters for userID and password

		String user = member.getEmail();
		String pwd = member.getPwd();

		System.out.println("gRecaptchaResponse: " + gRecaptchaResponse);
		boolean verified = VerifyReCAPTCHA.verify(gRecaptchaResponse);

		if (!verified) {
			model.addAttribute("verified", false);
			model.addAttribute("msg", "驗證碼驗證失敗");
			return new ModelAndView("account/login");
		}

		System.out.println("Logging in User=" + user + "::password=" + pwd + ":: Captcha verified: " + verified);
		MemberBean m = accountService.selectByLoginInfo(member.getEmail(), member.getPwd());
		if (m == null) {
			model.addAttribute("verified", false);
			model.addAttribute("msg", "輸入電子郵件或密碼資訊有誤");
			return new ModelAndView("account/login");
		}

		if (!m.isVerified()) {
			return new ModelAndView("account/verifyAccount");
		}

		if (!m.isActive()) {
			model.addAttribute("verified", false);
			model.addAttribute("msg", "帳號已被暫停");
			return new ModelAndView("account/login");
		}

		session.setAttribute("currentUser", m);
		return new ModelAndView("redirect:/");
	}

	@PostMapping("/account/register")
	public String register(@ModelAttribute("member") MemberBean member,
			@RequestParam("g-recaptcha-response") String gRecaptchaResponse, Model model, BindingResult bindingResult,
			HttpSession session) throws Exception {
		// get request parameters for userID and password
		new MemberValidator().validate(member, bindingResult);
//		System.out.println("新增會員: " + member);
		System.out.println("bindingResult.hasErrors():" + bindingResult.hasErrors());
		if (bindingResult.hasErrors()) {
			return "account/register";
		}

		System.out.println("gRecaptchaResponse: " + gRecaptchaResponse);
		boolean verified = VerifyReCAPTCHA.verify(gRecaptchaResponse);

		System.out.println("Register User=" + member.getFullname() + "::password=" + member.getPassword()
				+ ":: Captcha verified: " + verified);

		if (!verified) {
			model.addAttribute("verified", false);
			model.addAttribute("msg", "Google驗證碼驗證失敗");
			return "account/register";
		}

		// 待調整
		member.setEmailVerifCode("NnV9W");

		// 組Email內容並發送
		SendInBlueMail mailSender = new SendInBlueMail();
		mailSender.setEmailTo(member.getEmail());
		mailSender.setSubject("滿滿大平台{{params.subject}}");
		mailSender.setHtmlContent("<html><body><h1>{{params.subject}}: {{params.parameter}}</h1></body></html>");
		Properties params = new Properties();
		params.setProperty("parameter", member.getEmailVerifCode());
		params.setProperty("subject", "註冊驗證碼");
		mailSender.setProperties(params);
		mailSender.SendEmail();

		// 發送備份信
		mailSender.setEmailTo("Java20201019@gmail.com");
		mailSender.SendEmail();

		member.setMemberSubscriptionList(generateSubscriptions(member));
		accountService.insert(member);

		session.setAttribute("currentUser", member);

		return "account/verifyAccount";
	}

	@RequestMapping("/account/verifyAccount")
	public String verifyAccount(RedirectAttributes redirectAttributes) {

		return "account/verifyAccount";
	}

	@PostMapping("/account/verifyAccount")
	public ModelAndView verifyAccount(@RequestParam String verificationCode, Model model, HttpSession session)
			throws Exception {

		MemberBean currentUser = (MemberBean) session.getAttribute("currentUser");
		if (!verificationCode.equals(currentUser.getEmailVerifCode())) {
			model.addAttribute("msg", "驗證碼錯誤");
			return new ModelAndView("account/verifyAccount");
		}

		Set<MemberSubscription> memberSubscriptionList = new HashSet<MemberSubscription>();

		// 預設訂閱所有公司
		for (Company company : companyService.getAllCompany()) {
			MemberSubscription memberSubscription = new MemberSubscription();
			memberSubscription.setMember(currentUser);
			memberSubscription.setCompany(company);
			memberSubscriptionList.add(memberSubscription);
		}
		
		try {
			currentUser.setVerified(true);
			currentUser.setActive(true);
			currentUser.setMemberSubscriptionList(memberSubscriptionList);
			accountService.update(currentUser);
			session.setAttribute("currentUser", currentUser);
			//accountService.updateVerified(currentUser);

		} catch (Exception ex) {
			System.out.println(ex);
		}
		
		return new ModelAndView("redirect:/");
	}

	private Set<MemberSubscription> generateSubscriptions(MemberBean m) {
		Set<MemberSubscription> memberSubscriptionList = new LinkedHashSet<MemberSubscription>();
		List<Company> companyList = companyService.getAllCompany();
		for (Company company : companyList) {
			MemberSubscription memberSubscription = new MemberSubscription();
			memberSubscription.setMember(m);
			memberSubscription.setCompany(company);
			memberSubscriptionList.add(null);
		}
		return memberSubscriptionList;
	}

}
