package com.web.store.product.controller;


import java.util.List;

import javax.servlet.ServletContext;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.store.product.model.Product;
import com.web.store.product.service.ProductService;


@Controller
@SessionAttributes("product")
public class ProductController {
	@Autowired
	ProductService pService;
	@Autowired
	ServletContext context;
	
	@RequestMapping("/ProductIndex")
	public String ProductView(Model model) {
		List<Product> list = pService.selectAll();
		for (Product pb : list) {
			System.out.println(pb.getproductName());
		}
		model.addAttribute("ProductList", list);
		return "/product/ProductIndex";
	}

	@ModelAttribute("Product")
	public Product setProduct(Product pb) {
		return pb;
	}

}
