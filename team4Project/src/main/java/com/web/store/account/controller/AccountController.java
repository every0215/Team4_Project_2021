package com.web.store.account.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.web.store.account.javabean.MemberBean;
import com.web.store.account.service.impl.AccountServiceImpl;

//import mvc.examples.model.Cat;

@Controller
public class AccountController {
	@Autowired
	AccountServiceImpl accountServiceImpl;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping("/account/register")
	public String home() {
		return "account/register";     // 請視圖解析器由視圖的邏輯名稱index來找出真正的視圖
	}
	

	
	@GetMapping
	public @ResponseBody List<MemberBean> GetMemberList() throws Exception{
		List<MemberBean> members = accountServiceImpl.selectAllMembers();
		
		return members;
	}

}
