package com.web.store.product.controller;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.store.account.javabean.MemberBean;
import com.web.store.company.model.Company;
import com.web.store.company.service.CompanyService;
import com.web.store.product.model.Cart;
import com.web.store.product.model.Items;
import com.web.store.product.model.Product;
import com.web.store.product.model.ProductOrder;
import com.web.store.product.model.ProductOrderDetail;
import com.web.store.product.service.ProductService;






@SuppressWarnings("unchecked")
@Controller
@SessionAttributes({ "product","ProductList"})
public class ProductController {
	@Autowired
	ProductService pService;
	@Autowired
	ServletContext context;
	@Autowired
	CompanyService cService;
//-----------------------後台顯示商品
	@RequestMapping("/ProductIndex")
	public String View(Model model,HttpSession session) {
		Company company=(Company)session.getAttribute("company");
		List<Product> list = pService.selectbyCompanyName(company.getCompanyName());
		
		for (Product pb : list) {
			System.out.println(pb.getProductName());
		}
		
		
		model.addAttribute("ProductList", list);
		return "/product/ProductIndex";
	}
	
//	@GetMapping("/ProductIndex/{companyName}")
//	public String ViewIndex(@PathVariable String companyName,Model model) {
//		List<Product> list = pService.selectbyCompanyName(companyName);
//		model.addAttribute("ProductList", list);
//		return "/";
//	}
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
	
//	------------------------------輸入商品
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
	//------------------------------購買商品
	@GetMapping("/ProductBuy/{productId}")
	public String BuyShowPage(@PathVariable int productId,Model model) {
		Product product = pService.selectbyid(productId);
		model.addAttribute("product",product);
		return "product/ProductBuy";
	}
//	--------------------------------------變更商品
	@GetMapping(value="/product/productAlter/{productId}")
	public String porductAlter(@PathVariable int productId,Model model){
		Product product  = pService.selectbyid(productId);
		model.addAttribute("product",product);
		return "product/ProductAlter";

	}
	@PostMapping(value="/product/productAlter/{productId}")
	public String porductAlterPost(
			@PathVariable int productId,
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
		   Product pb = new Product(productId, Pblob, picName, productName, productType, productDescript, comName, productStuck, productPrice, status);
		   pService.alterbyid(pb);
	   
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
//----------------------------------------首頁商品類別		
	@GetMapping(value="/productShow/{productType}")
	public String porductShow(@PathVariable String productType,Model model){
		System.out.println(productType);
		List<Product> list=null;
		if(productType.equals("all")) {
			list  = pService.selectAll();
			System.out.println("alllllllllll");
		}
		else {
			 list  = pService.selectbyType(productType);
			 System.out.println("成功"+productType);
		}
		model.addAttribute("ProductList",list);
		
		
		return "/product/productShow";
	}	

//-----------	搜尋
	
	@GetMapping(value="/ProductSearch" )
	public String porductSearch(@RequestParam String search,Model model){
		System.out.println(search);
		List<Product> list  = pService.selectbyName(search);
		model.addAttribute("ProductList",list);
		System.out.println("成功"+search);
		
		return "/product/ProductSearch";
	}	
	

	
//--------------------------購物車
	
	@GetMapping("/ProductBuy/{productId}/ProductPayment")
	public String ProductPayment(@PathVariable int productId,
			@RequestParam(value="sessionId",required=false) Integer sessionId, 
			Model model,HttpSession session,RedirectAttributes ra) {
//		MemberBean member = (MemberBean) session.getAttribute("currentUser");
		
//		Product product = pService.selectbyid(productId);
//		model.addAttribute("product",product);
		return "product/ProductPayment";
	}
//----------------------購物車
	@SuppressWarnings("unused")
	@RequestMapping(value="/ShoppingCart") 
	public String  ShoppingCart(HttpSession session,Model model){
		MemberBean member = (MemberBean) session.getAttribute("currentUser");
		System.out.println("member="+member.getId());
		
		if (member == null){
			return "redirect:/account/login";
		}
		
		List<Cart> list = (List<Cart>) session.getAttribute("cart");
		
		
		return "product/ShoppingCart";
	}
	//-----------------------------確認購買
	
	@SuppressWarnings("unused")
	@RequestMapping(value="/Cartadd") 
	public String  Cartadd(HttpSession session,Model model ,
			@RequestParam("qty") Integer qty,
			@RequestParam("productId") Integer productId){
		MemberBean member = (MemberBean) session.getAttribute("currentUser");
		
		
		if (member == null) {
			return "redirect:/account/login";
		}
		System.out.println("member="+member.getId());
		model.addAttribute("Member", member);  
		Cart cart = (Cart) model.getAttribute("Cart");
		if (cart == null) {
			// 就新建ShoppingCart物件
			cart = new Cart();
			// 並將此新建ShoppingCart的物件放到session物件內，成為它的屬性物件
			model.addAttribute("Cart", cart);  
			System.out.println("cart");
		}
		
			Product bean = pService.getProduct(productId);
			
			ProductOrderDetail oib = new ProductOrderDetail(
					bean.getProductPrice(),
					qty,
					null,
					bean.getproductId(),
					bean.getdiscount());
			
			cart.addToCart(productId, oib);
			
			System.out.println("cart"+cart);
		
		
		
		return "product/Cartadd";
		
		
	}
//-----------------輸出圖
	@GetMapping(value = "/getproductimage/{productId}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer productId)  {
		String filePath = "/images/NoImage.jpg";
		
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String logoname = "";
		
		int len = 0;
		Product pb = pService.getProduct(productId);
		System.out.println(pb.getPicName());
		if (pb != null) {
			
			Blob logoblob = pb.getProductPic();
			
			logoname = pb.getPicName();
			
			if (logoblob != null) {
				System.out.println("HI");
				try {
					len = (int) logoblob.length();
//					System.out.println(len);
					media = logoblob.getBytes(1, len);
//					System.out.println(media);
				} catch (SQLException e) {
					throw new RuntimeException(e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				logoname = filePath;
			}
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
