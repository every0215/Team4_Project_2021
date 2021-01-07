package com.web.store.campaign.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.web.store.campaign.model.Campaign;
import com.web.store.campaign.service.CampaignService;



@Controller
public class CampaignController {
	
	@Autowired
	CampaignService campService;
	@Autowired
	ServletContext context;
	
	@GetMapping("/CampaignShow")
	public String showAllCamp(Model model) {
		List<Campaign> list = campService.getAllCampaign();
		model.addAttribute("camps", list);
		return "CampaignShow";
	}
	
	@GetMapping("/CampaignDel/{campId}")
	public String deleteCamp(@PathVariable int campId) {
		campService.deleteById(campId);
		return "redirect:/CampaignShow";
	}
	
	@RequestMapping("/CampaignAdd/add")
	public String addCamp(@RequestParam String title,
			@RequestParam String startDate,
			@RequestParam String startTime,
			@RequestParam String endDate,
			@RequestParam String endTime,
			@RequestParam Boolean status,
			@RequestParam String description,
			@RequestParam MultipartFile picture,Model model) {
		
		Timestamp StartDateTimeStamp = Timestamp.valueOf(startDate+" "+startTime+":00");

		Timestamp endDateTimeStamp = Timestamp.valueOf(endDate+" "+endTime+":00");
		
		boolean isOk = true;//flag
		
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String dateStr = dateFormat.format(date);
		model.addAttribute("date",dateStr);//將當前日期傳給前端date表單
		
		
		if(StartDateTimeStamp.compareTo(date)<0) {
			model.addAttribute("timeAfterCurrentErr","開始時間不得小於當前時間");
			isOk = false;
		}
		if(StartDateTimeStamp.compareTo(endDateTimeStamp)>0) {
			model.addAttribute("startAfterEndErr","結束時間必須大於開始時間");
			isOk = false;
		}
		if(picture.isEmpty()) {
			model.addAttribute("noFileErr","沒有上傳檔案");
			isOk = false;
		}
		
		if(!isOk) {
			return "CampaignAdd";
		}
		
		Timestamp currentTime = new Timestamp(date.getTime());
		
		String rootPath = context.getRealPath("/");//取得應用程式檔案系統目錄
		String uploadFileName = picture.getOriginalFilename();
		//活動名稱+亂數取得檔案名稱
		String storeFileName = title+"_"+(int)(2147483647*Math.random())+uploadFileName.substring(uploadFileName.lastIndexOf("."));
		String picDir = "campaign_Img"; //存放圖片的資料夾
		String picPath = rootPath + "/" + picDir + "/" + storeFileName;//圖片儲存路徑
		Campaign camp = new Campaign();
		
		camp.setTitle(title);
		camp.setstartTime(StartDateTimeStamp);
		camp.setendTime(endDateTimeStamp);
		camp.setStatus(status);
		camp.setDescription(description);
		camp.setAddTime(currentTime);
		camp.setUpdateTime(currentTime);
		camp.setPicturePath(picPath);
		
		
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
			campService.add(camp);
		}catch(Exception e){
			throw new RuntimeException("新增到資料庫失敗\n"+e.toString());
		}
		
		
		return "redirect:/CampaignShow";
		
	}
	
	//取得單獨頁面資料
	@RequestMapping(value="/camaign/getPage", produces = {"application/json; charset=UTF-8"})
	public @ResponseBody Map<String,Object> getPageCampaign(@RequestParam(defaultValue="1") Integer page) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		int totalPage = campService.getTotalPage();
		List<Campaign> camps = campService.getPageCampaign(page);
		map.put("totalPage",totalPage);
		map.put("page", camps);
		return map;
		
	}
	
	//傳送圖片
	@RequestMapping("/camaign/pic/{id}")
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
	

}
