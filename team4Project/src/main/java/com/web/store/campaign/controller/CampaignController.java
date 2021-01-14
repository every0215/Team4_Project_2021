package com.web.store.campaign.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.store.campaign.model.Campaign;
import com.web.store.campaign.model.DiscountParams;
import com.web.store.campaign.service.CampaignService;



@Controller
@RequestMapping("/campaign/")
@SessionAttributes(names = {"company"}) ////存取session屬性
public class CampaignController {
	
	@Autowired
	CampaignService campService;
	@Autowired
	ServletContext context;
	
	@GetMapping("/show")
	public String showAllCamp(Model model) {
		List<Campaign> list = campService.getAllCampaign();
		model.addAttribute("camps", list);
		return "campaign/CampaignShow";
	}
	
	@GetMapping("/delete/{campId}")
	public String deleteCamp(@PathVariable int campId) {
		campService.deleteById(campId);
		return "redirect:/CampaignShow";
	}
	
	
	
	@PostMapping("/insert")
	public String insertCamp(@RequestParam String name,
			@RequestParam String startDate,
			@RequestParam String startTime,
			@RequestParam Integer type,
			@RequestParam(required = false) Double offParam,
			@RequestParam(required = false) Integer amountUpTo,
			@RequestParam(required = false) Integer amountOffParam,
			@RequestParam String endDate,
			@RequestParam String endTime,
			@RequestParam Boolean launchStatus,
			@RequestParam String description,
			@RequestParam String content,
			@RequestParam MultipartFile picture,
			Model model,
			RedirectAttributes redirectAttributes ) {
		
		Timestamp StartDateTimeStamp = Timestamp.valueOf(startDate+" "+startTime+":00");

		Timestamp endDateTimeStamp = Timestamp.valueOf(endDate+" "+endTime+":00");
		
		
		Date date = new Date();
//		後端驗證區塊↓		
		boolean isOk = true;
		
		
		if(StartDateTimeStamp.compareTo(date)<0) {
			model.addAttribute("startAfterCurrentErr","開始時間不得小於當前時間");
			isOk = false;
		}
		if(StartDateTimeStamp.compareTo(endDateTimeStamp)>0) {
			model.addAttribute("startAfterEndErr","結束時間必須大於開始時間");
			isOk = false;
		}
		
		
		
//		後端驗證區塊↑		
		
		
		Timestamp currentTime = new Timestamp(date.getTime());//獲取當前時間的TimeStamp物件
		
		String rootPath = context.getRealPath("/");//取得應用程式檔案系統目錄
		String uploadFileName = picture.getOriginalFilename();
		//活動名稱+亂數取得檔案名稱
		String storeFileName = name+"_"+(int)(2147483647*Math.random())+uploadFileName.substring(uploadFileName.lastIndexOf("."));
		String picDir = "campaign_Img"; //存放圖片的資料夾
		String picPath = rootPath + picDir + "/" + storeFileName;//圖片儲存路徑
		
		//如果為1，是折扣塞入折扣參數
		//為2是滿額塞入滿額參數
		DiscountParams discountParams = new DiscountParams();
		discountParams.setType(type);
		if(type==1) {
			discountParams.setOffParam(offParam);
		}else if(type==2) {		
			discountParams.setAmountUpTo(amountUpTo);
			discountParams.setAmountOffParam(amountOffParam);
		}
		
		//Company目前是null，之後會從session抓取塞入
		Campaign camp = new Campaign(name, picPath, description, content, StartDateTimeStamp, endDateTimeStamp, launchStatus, true, currentTime, currentTime, null, discountParams);		
		discountParams.setCampaign(camp);
		
		//寫入圖片檔案部分
		File dir = new File(rootPath+"/"+picDir);//存在應用程式跟目錄webapp底下
		if(!dir.exists()) {
			dir.mkdir();
		}
		File pic = new File(dir,storeFileName);
		try (OutputStream os = new FileOutputStream(pic); 
				InputStream is = picture.getInputStream()){
			byte[] buff = new byte[81920];
			int len = 0;
			while( (len = is.read(buff))!=-1) {
				os.write(buff, 0, len);
			}
			
			System.out.println("寫入成功");
			
		} catch (IOException e) {
			throw new RuntimeException("寫入Server失敗"+e.toString());
		}
		
		try {
			campService.insert(camp);
		}catch(Exception e){
			throw new RuntimeException("新增到資料庫失敗\n"+e.toString());
		}
		
		camp.convertTimestampToString();
		redirectAttributes.addFlashAttribute("camp", camp);
		
		if(!isOk) {
			return "redirect:/campaign/insertPage";
		}
		
		return "redirect:/campaign/campaignAddComfirm";
		
	}
	
	
	@PostMapping("/update/{campaignId}")
	public String UpdateCamp(@RequestParam String name,
			@RequestParam String startDate,
			@RequestParam String startTime,
			@RequestParam Integer type,
			@RequestParam(required = false) Double offParam,
			@RequestParam(required = false) Integer amountUpTo,
			@RequestParam(required = false) Integer amountOffParam,
			@RequestParam String endDate,
			@RequestParam String endTime,
			@RequestParam Boolean launchStatus,
			@RequestParam String description,
			@RequestParam String content,
			@RequestParam(required = false) MultipartFile picture,
			@PathVariable Integer campaignId,
			Model model,
			RedirectAttributes redirectAttributes ) {
		System.out.println(startTime);
		Timestamp StartDateTimeStamp = Timestamp.valueOf(startDate+" "+startTime+":00");
		System.out.println(endTime);
		Timestamp endDateTimeStamp = Timestamp.valueOf(endDate+" "+endTime+":00");
		
		Campaign campOrigin = campService.getCampaignById(campaignId);
		Date date = new Date();
//		後端驗證區塊↓		
//		boolean isOk = true;
//		
//		
//		if(StartDateTimeStamp.compareTo(date)<0) {
//			model.addAttribute("timeAfterCurrentErr","開始時間不得小於當前時間");
//			isOk = false;
//		}
//		if(StartDateTimeStamp.compareTo(endDateTimeStamp)>0) {
//			model.addAttribute("startAfterEndErr","結束時間必須大於開始時間");
//			isOk = false;
//		}
//		
//		if(!isOk) {
//			return "campaign/CampaignInsertPage";
//		}
		
//		後端驗證區塊↑	
		
		//如果為1，是折扣塞入折扣參數
				//為2是滿額塞入滿額參數
		
		campOrigin.setName(name);
		campOrigin.setStartDateTime(StartDateTimeStamp);
		campOrigin.setEndDateTime(endDateTimeStamp);
		campOrigin.setDescription(description);
		campOrigin.setLaunchStatus(launchStatus);
		campOrigin.setContent(content);
		campOrigin.setUpdateTime(new Timestamp(date.getTime()));
		
		DiscountParams discountParams = campOrigin.getDiscountParams();
		discountParams.setType(type);
		if (type == 1) {
			discountParams.setOffParam(offParam);
		} else if (type == 2) {
			discountParams.setAmountUpTo(amountUpTo);
			discountParams.setAmountOffParam(amountOffParam);
		}
		campOrigin.setDiscountParams(discountParams);
		

		if (!picture.isEmpty()) {
			String rootPath = context.getRealPath("/");// 取得應用程式檔案系統目錄
			String uploadFileName = picture.getOriginalFilename();
			// 活動名稱+亂數取得檔案名稱
			String storeFileName = name + "_" + (int) (2147483647 * Math.random())
					+ uploadFileName.substring(uploadFileName.lastIndexOf("."));
			String picDir = "campaign_Img"; // 存放圖片的資料夾
			String picPath = rootPath + picDir + "\\" + storeFileName;// 圖片儲存路徑

			
			campOrigin.setPicturePath(picPath);

			// 寫入圖片檔案部分
			File dir = new File(rootPath + "/" + picDir);// 存在應用程式跟目錄webapp底下
			if (!dir.exists()) {
				dir.mkdir();
			}
			File pic = new File(dir, storeFileName);
			try (OutputStream os = new FileOutputStream(pic); InputStream is = picture.getInputStream()) {
				byte[] buff = new byte[81920];
				int len = 0;
				while ((len = is.read(buff)) != -1) {
					os.write(buff, 0, len);
				}

				System.out.println("寫入成功");

			} catch (IOException e) {
				throw new RuntimeException("寫入Server失敗" + e.toString());
			}

		}
		
		
		try {
			campService.update(campOrigin);
		}catch(Exception e){
			throw new RuntimeException("更新到資料庫失敗\n"+e.toString());
		}
		
		redirectAttributes.addFlashAttribute("camp", campOrigin);
		redirectAttributes.addFlashAttribute("isUpdate", true);
		
		return "redirect:/campaign/campaignAddComfirm";
		
	}
	
	//取得公司活動單獨頁面資料
	@GetMapping(value="/getPageByCompany/{companyId}/{page}", produces = {"application/json; charset=UTF-8"})
	public @ResponseBody Map<String,Object> getPageByCompany(@PathVariable int page,
																	@PathVariable int companyId) {		
		Map<String,Object> map = new HashMap<String,Object>();
		int totalPage = campService.getTotalPageByCompanyId(companyId);
		List<Campaign> camps = campService.getSinglePageResultByCompayId(page, companyId);
		map.put("totalPage",totalPage);
		map.put("page", camps);
		return map;
		
	}
	
	//傳送圖片
	@GetMapping(value="/pic/{id}")
	public ResponseEntity<byte[]> getPic(@PathVariable int id){
		ResponseEntity<byte[]> re = null;
		Campaign camp = campService.getCampaignById(id);
		String filePath = camp.getPicturePath();
		File Picfile = new File(filePath);
		
		if(!Picfile.exists()) {
			filePath = context.getRealPath("/campaign_Img/NoImage.jpg");
		}
		
		String mimeType = context.getMimeType(filePath);

		
		MediaType mediaType = MediaType.valueOf(mimeType);
		
		byte[] fileBytes = null;
		
		try(InputStream fileInp = new FileInputStream(Picfile);
			ByteArrayOutputStream bao = new ByteArrayOutputStream();) {
			
			int len = 0;
			byte[] buffer = new byte[81920];
			while((len = fileInp.read(buffer))!=-1) {
				bao.write(buffer,0,len);
			}
			
			fileBytes = bao.toByteArray();
			
		} catch (IOException e) {
			System.out.println("檔案讀取失敗");
			e.printStackTrace();
		}
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(mediaType);
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		re = new ResponseEntity<byte[]>(fileBytes,headers,HttpStatus.OK);
		return re;
	}
	
	@GetMapping(value="/pic64/{id}",produces="text/plain")
	public @ResponseBody String getPictureBase64(@PathVariable int id) {
		
		Campaign camp = campService.getCampaignById(id);
		
		if(camp == null) {
			return null;
		}
		
		String filePath = camp.getPicturePath();
		
		StringBuffer responseMsg = new StringBuffer();
		
		String mimeType = context.getMimeType(filePath);
		try (
				InputStream is = new FileInputStream(filePath);
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
			){
				byte[] b = new byte[819200];
				int len = 0;
				while ((len= is.read(b)) != -1) {
					baos.write(b, 0, len);
				}
				byte[] bytes = baos.toByteArray();
				String prefix = "data:" + mimeType + ";base64,";
				// 由於java.io.OutputStream類別無法寫出字串，因此將字串轉為位元組陣列寫出
				responseMsg.append(prefix);
				Base64.Encoder be = Base64.getEncoder();	
				responseMsg.append(new String(be.encode(bytes)));
			} catch(Exception ex) {
				ex.printStackTrace();
			}
		return responseMsg.toString();
	}
	
	
	@GetMapping("/getFirstPageByCompany/{companyId}")
	public String getFirstPage(@PathVariable int companyId,Model model) {
		List<Campaign> camps= campService.getSinglePageResultByCompayId(1,companyId);
		
		model.addAttribute("camps", camps);
		return "campaign/CampaignShowPage";
	}
	
	@GetMapping("/ShowUpdatePage/{campaignId}")
	public String showUpdatePage(@PathVariable int campaignId,Model model) {
		Campaign camp= campService.getCampaignById(campaignId);
		camp.convertTimestampToString();
		model.addAttribute("camp", camp);
		return "campaign/CampaignUpdatePage";
	}
}
