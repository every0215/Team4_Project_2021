package com.web.store.product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.store.product.model.Cart;
import com.web.store.product.model.Items;
import com.web.store.product.model.Product;
import com.web.store.product.service.ProductService;

@Controller
@RequestMapping(value = "cart")
public class CartController {
	@Autowired
	ProductService pService;
	@RequestMapping(value="/Cartadd") 
    public String  addToCart(Integer productId,HttpSession session){
		Product pro=pService.selectbyid(productId);
		List<Cart> list = (List<Cart>) session.getAttribute("cart");
		 if (list == null) {
			  List<Items> cart = new ArrayList<Items>();
			   cart.add(new Items(pro, 1));
			   session.setAttribute("cart", cart);
			  }  else {
				  List<Items> cart = (List<Items>) session.getAttribute("cart");
		}
		return "cart/Cartadd";
       
        }
	@PostMapping(value="/ShoppingCart") 
	public String  ShoppingCart(HttpSession session){
		
		
		return "cart/ShoppingCart";
       
        }
	}


