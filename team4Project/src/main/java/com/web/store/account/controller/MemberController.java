package com.web.store.account.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.web.store.account.javabean.MemberBean;
import com.web.store.account.service.AccountService;
import com.web.store.account.service.impl.AccountServiceImpl;

//import mvc.examples.model.Cat;

@Controller
@RequestMapping("/member/")
public class MemberController {
	@Autowired
	AccountService accountService;
	
	@Autowired
	ServletContext servletContext;
	
	@GetMapping("/list")
	public String memberList(){
		return "account/memberList";
	}
	
	@GetMapping("/getMemberList")
	public @ResponseBody List<MemberBean> getMemberList() throws Exception{
		List<MemberBean> members = accountService.selectAllMembers();
		
		return members;
	}
	
	@PostMapping("/delete")
	public @ResponseBody int delete(@RequestParam int memberId) throws Exception{
		//int result = accountServiceImpl.deleteById(memberId);
		return memberId;
	}

}
