package com.web.store.customerService.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.web.store.account.javabean.MemberBean;
import com.web.store.customerService.model.Customer;
import com.web.store.customerService.model.CustomerService;
import com.web.store.customerService.model.User;
import com.web.store.customerService.service.CSService;


@Controller
@RequestMapping("/cs")
public class ChatController {
	@Autowired
	CSService csService;
	// 跳转到登录页面
	@RequestMapping(value = "loginpage", method = RequestMethod.GET)
	public ModelAndView loginpage(HttpSession session) {
		
		if (null == session.getAttribute("customerService")) {
			return new ModelAndView("customer_service/login");
		}
		
		Customer customer = new Customer();
		customer.setType("cs");
		customer.setId(UUID.randomUUID().toString());
		CustomerService cs = (CustomerService)session.getAttribute("customerService");
		customer.setNickName(cs.getNickName());
		session.setAttribute("customer", customer);
		return new ModelAndView("redirect:/cs/mainpage");
	}

	// 登录进入聊天主页面
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute(name = "cs") CustomerService cs, 
			HttpSession session) {

//		String id = UUID.randomUUID().toString();
//		loginUser.setId(id);
		CustomerService csResult = csService.checkUser(cs.getUserId(), cs.getUserPassword());
		Customer customer = new Customer();
		
		if(csResult==null) {
			Map<String,String> errMsg = new HashMap();
			errMsg.put("wrongData", "帳號或密碼錯誤");
			return new ModelAndView("customer_service/login",errMsg);
		}
				
		customer.setType("cs");
		customer.setId(UUID.randomUUID().toString());
		customer.setNickName(csResult.getNickName());
		session.setAttribute("customerService", csResult);
		session.setAttribute("customer", customer);	
		return new ModelAndView("redirect:/cs/mainpage");
		
	}
	
	@RequestMapping(value = "clientLogin", method = RequestMethod.GET)
	public String customerLogin(Model model,HttpSession session) {
		
		session.removeAttribute("customer");
		
		MemberBean mbean = (MemberBean)session.getAttribute("currentUser");
		Customer customer = new Customer();
		
		if(session.getAttribute("customer")!=null) {
			return "redirect:/cs/mainpage";
		}
		
		if(mbean!=null) {
			customer.setType("member");
			String id = UUID.randomUUID().toString();
			customer.setId(id);
			customer.setNickName("【會員】"+mbean.getNickname());
			
		}else {
			String id = UUID.randomUUID().toString();
			customer.setType("guest");
			customer.setId(id);
			customer.setNickName("【訪客】"+id.substring(0, 5));
		}
		
		session.setAttribute("customer", customer);
		
		return "redirect:/cs/mainpage";
	}
	
	@RequestMapping(value="loginOut")
	public String loginOut(HttpSession session) {
		session.removeAttribute("customer");
		session.removeAttribute("customerService");
		return "redirect:/cs/mainpage";
	}
	
	// 跳转到聊天室页面
	@RequestMapping(value = "mainpage", method = RequestMethod.GET)
	public ModelAndView mainpage(HttpServletRequest request) {
		//判断，如果没有session，则跳到登录页面
		HttpSession session = request.getSession();
		if(null==session.getAttribute("customer") && null!=session.getAttribute("company")){
			return new ModelAndView("customer_service/login");
		}else if(null==session.getAttribute("customer") && null==session.getAttribute("company")){
			return new ModelAndView("redirect:/cs/clientLogin");
		}else{
			return new ModelAndView("customer_service/main");
		}
	}
	
	@ModelAttribute(name = "cs")
	public CustomerService csModel() {
		return new CustomerService();
	}

}
