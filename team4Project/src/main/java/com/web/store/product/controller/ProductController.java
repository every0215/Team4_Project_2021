package com.web.store.product.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.store.product.model.ProductBean;
import com.web.store.product.service.ProductService;


@Controller
@RequestMapping("/product")
@SessionAttributes("ProductBeans")
public class ProductController {
	@Autowired
	ProductService pService;
	@Autowired
	ServletContext context;

	@RequestMapping("/ProductView")
	public String ProductView(Model model) {
		List<ProductBean> list = pService.selectAll();
		for (ProductBean pb : list) {
			System.out.println(pb.getproductName());
		}
		model.addAttribute("ProductList", list);
		return "ProductView";
	}

	@ModelAttribute("ProductBeans")
	public ProductBean setProduct(ProductBean pb) {
		return pb;
	}

}
