package com.web.store.account.controller;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;

import com.sun.net.httpserver.HttpContext;

//import com.web.store.account.dao.impl.MemberDaoImpl;
//import com.web.store.account.dao.impl.MemberLoginHistoryDaoImpl;
import com.web.store.account.javabean.MemberBean;
import com.web.store.account.service.impl.AccountServiceImpl;

@MultipartConfig(location="")
@WebServlet("/jsp/team4/account/AccountUploadServlet.do")
public class AccountUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Autowired
	AccountServiceImpl accountService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("image/jpeg");
		
		
		try {
				//accountService = new AccountServiceImpl(new MemberDaoImpl(), new MemberLoginHistoryDaoImpl());
			
				if (request.getParameter("MemberEdit_MemberId")!= null) {
				String id = (String)request.getParameter("MemberEdit_MemberId");
				MemberBean member = accountService.selectById(id);
				byte[] imageBytes = member.getProfileImage1();
						//member.getProfileImage1().readAllBytes();
				response.setContentType("image/jpeg");
				response.setContentLength(imageBytes.length);
				response.getOutputStream().write(imageBytes); 
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		try {
			
				processMemberUploadAction(request, response);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void processMemberUploadAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//AccountServiceImpl accountService = new AccountServiceImpl(new MemberDaoImpl(), new MemberLoginHistoryDaoImpl());
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("MemberEdit_MemberId");
		MemberBean member = new MemberBean();
		member.setId(Integer.parseInt(id));
		
		Part part = request.getPart("profileImage1");
		member.setProfileImage1(part.getInputStream().readAllBytes());
        
		
		int result = accountService.updateProfileImages(member);
		request.setAttribute("Uploaded", (result==1)? true:false);

		
		String destinationFile = "c:\\temp\\testimage1.jpg";
		byte[] imageBytes =member.getProfileImage1();
		InputStream inputStream = new ByteArrayInputStream(member.getProfileImage1());
		saveImage(inputStream, destinationFile);
		inputStream.close();
		
		member = accountService.selectById(id);
		request.setAttribute("member", member);
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/team4/account/MemberEdit.jsp");
		rd.forward(request, response);
	}
	
	public static void saveImage(InputStream is, String destinationFile) throws IOException {
		OutputStream os = new FileOutputStream(destinationFile);

		byte[] b = new byte[4096];
		int bytesRead = -1;

		while ((bytesRead  = is.read(b)) != -1) {
			os.write(b, 0, bytesRead );
		}

		is.close();
		os.close();
	}



}
