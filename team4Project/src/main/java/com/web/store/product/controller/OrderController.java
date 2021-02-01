package com.web.store.product.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.store.account.javabean.MemberBean;
import com.web.store.product.model.ProductOrder;
import com.web.store.product.service.ProductOrderService;





//@Controller
//@RequestMapping("")
@SessionAttributes({"product"})
public class OrderController {
	@Autowired
	ServletContext context;
	@Autowired
	ProductOrderService productOrderService;
	@GetMapping("orderList")
	protected String orderList(Model model, HttpSession session) {
		

		MemberBean member = (MemberBean) session.getAttribute("currentUser");
		ArrayList<ProductOrder> memberOrders = productOrderService.queryOrderByMemberId(member.getId());
		
		model.addAttribute("memberOrders", memberOrders);
		return "orderList";
		
	}
	
//	@GetMapping("orderDetail")
//	protected String orderDetail(Model model, 
//			HttpSession session,
//			@RequestParam("orderNo") Integer no 
//			
//			) {
//		MemberBean member = (MemberBean) session.getAttribute("currentUser");
//		System.out.println("member="+member.getId());
//		
//		if (member == null) {
//			return "redirect:/account/login";
//		}
//
//		ProductOrder ob = ProductOrderService.getOrderId(no);
//		model.addAttribute("OrderBean", ob);
//		return "order";
//	}
	
}
