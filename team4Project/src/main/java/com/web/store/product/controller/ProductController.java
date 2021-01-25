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

import com.web.store.company.service.CompanyService;
import com.web.store.product.model.Product;
import com.web.store.product.service.ProductService;


@Controller
@SessionAttributes("product")
public class ProductController {
	@Autowired
	ProductService pService;
	@Autowired
	ServletContext context;
	@Autowired
	CompanyService cService;
	@RequestMapping("/ProductIndex")
	public String View(Model model) {
		List<Product> list = pService.selectAll();
		for (Product pb : list) {
			System.out.println(pb.getproductName());
		}
		model.addAttribute("ProductList", list);
		return "/product/ProductIndex";
	}
	@GetMapping("/ProductIndex/{companyName}")
	public String ViewIndex(@PathVariable String companyName,Model model) {
		List<Product> list = pService.selectbyCompanyName(companyName);
		for (Product pb : list) {
			System.out.println(pb.getproductName());
		}
		model.addAttribute("ProductList", list);
		return "/";
	}
//	------------------------
	@GetMapping("/product/ProductInsert")
	public String productInsert() {
		return "product/ProductInsert";
	}
	
	
	@ModelAttribute("Product")
	public Product setProduct(Product pb) {
		return pb;
	}
	//---------------------------------
	
	@GetMapping("/product/productimage")
	public String ShowPage() {
		return "product/productimage";
	}
	
	
	@PostMapping(value="/product/ProductInsert")
	public String porductIn(
			@RequestParam String productName,
			@RequestParam Integer productStuck,
			@RequestParam Integer productPrice,
			@RequestParam String productType,			
			@RequestParam(name = "cName") String comName,						
			@RequestParam String productDescript,
			@RequestParam("productimage") MultipartFile pImage,
			@RequestParam Integer status,
			
			SessionStatus sessionStatus,
			Model model
			) throws IOException {
		
			byte[] pic = pImage.getBytes();
			

		  try {
		   //再把Byte[]轉成Blob物件
		   Blob Pblob = new javax.sql.rowset.serial.SerialBlob(pic);
		  
		   //取得logo 的Filename
		   String picName = pImage.getOriginalFilename();
		  
		
		   //呼叫Service新增到資料庫
		   Product pb = new Product(Pblob, picName, productName, productType, productDescript, comName, productStuck, productPrice, status);
		   pService.insert(pb);
	   
		  } catch (SerialException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  } catch (SQLException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  }

		sessionStatus.setComplete();
		
		return "redirect:/ProductIndex";

	}
	@GetMapping(value="/product/productAlter/{productId}")
	public String porductAlter(@PathVariable int productId,Model model){
		Product product  = pService.selectbyid(productId);
		model.addAttribute("product",product);
		return "/product/ProductAlter";

	}	
		
	
//-----------------輸出圖
	@GetMapping(value = "/getimage/{productId}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer ProductId)  {
		String filePath = "/images/NoImage.jpg";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String logoname = "";
		
		int len = 0;
		Product pb = pService.getProduct(ProductId);
		
		if (pb != null) {
			
			Blob logoblob = pb.getproductPic();
			
			logoname = pb.getPicName();
			
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
