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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.web.store.company.model.Company;
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
	@GetMapping("/product/productImage")
	public String ShowPageSP() {
		return "product/productImage";
	}
	
	
	@ModelAttribute("Product")
	public Product setProduct(Product pb) {
		return pb;
	}
	@PostMapping(value="/updateCompany")
	public String updateCompany(
			@RequestParam Integer id,
			@RequestParam String companyName,
			@RequestParam String uniformNumbers,
			@RequestParam Integer categories,
			@RequestParam String account,
			@RequestParam String password,
			@RequestParam String phone,
			@RequestParam String email,
			@RequestParam(value="logoA",required=false)MultipartFile logo,
			@RequestParam(value="busRCA",required=false)MultipartFile busRC,
//			HttpServletResponse response
			//
			SessionStatus sessionStatus,
			Model model
			) throws IOException {
		System.out.println("HELLO");
		sessionStatus.setComplete();
	}
//-----------------圖
	@GetMapping(value = "/getimage/{productId}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable String ProductId) {
		String filePath = "/images/NoImage.jpg";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String logoname = "";
		
		int len = 0;
		Product pb = pService.getProduct(ProductId);
		
		if (pb != null) {
			
			Blob logoblob = pb.getproductPic();
			
			logoname = pb.getproductName();
			
			if (logoblob != null) {
				
				try {
					len = (int) logoblob.length();
//					System.out.println(len);
					media = logoblob.getBytes(1, len);
//					System.out.println(media);
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				logoname = filePath;
			}
		} else {
			media = toByteArray(filePath);
			logoname = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		System.out.println("media"+media);
		String mimeType = context.getMimeType(logoname); //getMimeType 會抓出副檔名的mimetype  
		System.out.println("--------mimeType"+mimeType);
		System.out.println("123-----filename---"+logoname);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("66666mimeType = "+mimeType+"   mediaType = " + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}
	//輸出圖片裡會用到的方法
	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);  
		try {
//			System.out.println("filepath = "+filepath);  //resources/images/NoImage.jpg
//			System.out.println("realPath = "+realPath);  //C:\WebSource\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\mvcExercise\resources\images\NoImage.jpg
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
}
