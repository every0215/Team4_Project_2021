package com.web.store.account.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.net.URL;
import java.net.http.HttpRequest;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Properties;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;
import com.web.store.account.common.PayPalOrderDetail;
import com.web.store.account.common.PayPalPaymentServices;
import com.web.store.account.common.SendInBlueMail;
import com.web.store.account.common.Utility;
import com.web.store.account.common.VerifyReCAPTCHA;
import com.web.store.account.javabean.MCoin;
import com.web.store.account.javabean.MCoinTopUpDetail;
import com.web.store.account.javabean.MemberBean;
import com.web.store.account.javabean.MemberCreditCard;
import com.web.store.account.javabean.MemberNotification;
import com.web.store.account.javabean.MemberSubscription;
import com.web.store.account.service.AccountService;
import com.web.store.account.service.impl.AccountServiceImpl;
import com.web.store.account.validator.MemberValidator;
import com.web.store.company.model.Company;
import com.web.store.company.service.CompanyService;

//import mvc.examples.model.Cat;

@Controller
@RequestMapping("/member/")
public class MemberController {
	@Autowired
	AccountService accountService;

	@Autowired
	CompanyService companyService;

	@Autowired
	ServletContext servletContext;

	@RequestMapping("/dashboard")
	public String dashboard() {
		return "account/dashboard";
	}

	@RequestMapping("/myWallet")
	public String myWallet(HttpSession session) {
		MemberBean currentUser = (MemberBean) session.getAttribute("currentUser");
		if(currentUser== null) {
			return "redirect:/";
			
		}
		
		return "account/myWallet";
	}

	@RequestMapping("/creditCard")
	public String creditCard() {
		return "account/creditCard";
	}

	@RequestMapping("/review")
	public String review() throws Exception {

		return "account/review";
	}

	@RequestMapping("/notification")
	public String notification() throws Exception {

		return "account/notification";
	}

	@RequestMapping("/forgotPassword")
	public String forgotPassword() throws Exception {

		return "account/forgotPassword";
	}

	@GetMapping("/list")
	public String memberList() {
		return "account/memberList";
	}

	@PostMapping("/delete")
	public @ResponseBody int delete(@RequestParam int memberId) throws Exception {
		int result = accountService.deleteById(memberId);
		return memberId;
	}

	// ==========================================================================
	// 會員個人資料更新
	// ==========================================================================
	@GetMapping("/myProfile")
	public String myProfile(HttpSession session) throws IOException {
		MemberBean currentUser = (MemberBean) session.getAttribute("currentUser");
		// model.addAttribute("user", member);

		// 讀取圖片檔
		byte[] imagebytes = null;
		if (currentUser.getProfileImage1() != null) {
			imagebytes = currentUser.getProfileImage1();
		} else {
			File aFile = new File(servletContext.getRealPath("/WEB-INF/views/img/profile-icon.png"));
			System.out.println("size:" + aFile.length());
			InputStream is = new FileInputStream(aFile);
			imagebytes = is.readAllBytes();
		}
		byte[] encodeBase64 = Base64.encodeBase64(imagebytes);
		String base64Encoded = new String(encodeBase64, "UTF-8");
		currentUser.setProfileImage1Base64(base64Encoded);

		return "account/myProfile";
	}

	@PostMapping("/myProfile")
	public String myProfile(@ModelAttribute("member") MemberBean member, Model model, HttpSession session)
			throws Exception {
		MemberBean currentUser = (MemberBean) session.getAttribute("currentUser");
		try {
			currentUser.setNickname(member.getNickname());
			accountService.updateNickname(currentUser);
			model.addAttribute("verified", true);
			model.addAttribute("msg", "個人資料更新成功");
			session.setAttribute("currentUser", currentUser);

		} catch (Exception ex) {
			model.addAttribute("verified", false);
			model.addAttribute("msg", "個人資料更新失敗");
		}
		return "account/myProfile";
	}

	@PostMapping("/myProfileImageUpdate")
	public String myProfileImageUpdate(@RequestParam("profileImage1Path") MultipartFile image1, Model model,
			HttpSession session) throws Exception {

		MemberBean currentUser = (MemberBean) session.getAttribute("currentUser");
		try {
			if (image1 != null) {// Determine whether the uploaded file is empty
				String path = null;// File path
				String type = null;// File type
				String fileName = image1.getOriginalFilename(); // original file name
				System.out.println("Original name of uploaded file:" + fileName);
				// determine file type
				type = fileName.indexOf(".") != -1
						? fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length())
						: null;
				currentUser.setProfileImage1(image1.getBytes());
				accountService.updateProfileImages(currentUser);
				session.setAttribute("currentUser", currentUser);
			}
			model.addAttribute("verified", true);
			model.addAttribute("msg", "個人圖像更新成功");
			session.setAttribute("currentUser", currentUser);

		} catch (Exception ex) {
			model.addAttribute("verified", false);
			model.addAttribute("msg", "個人圖像更新成功");
		}
		return "account/myProfile";
	}

	// ==========================================================================
	// 我的錢包
	// ==========================================================================
	@GetMapping("/getMCoinTopUpDetailList")
	public @ResponseBody List<MCoinTopUpDetail> getMCoinTopUpDetailList(HttpSession session) throws Exception {
		MemberBean currentUser = (MemberBean) session.getAttribute("currentUser");
		//Set<MCoinTopUpDetail> memberCreditCardList = currentUser.getmCoinTopupDetailList();
		
		ArrayList<MCoinTopUpDetail> sortedlist = null;
		if ( currentUser != null) {
			sortedlist = new ArrayList<MCoinTopUpDetail>(currentUser.getmCoinTopupDetailList());
			Collections.sort(sortedlist, Comparator.comparing(MCoinTopUpDetail::getId));
		}
		
		
		return sortedlist;
	}

	// 會員儲值M幣點數
	@PostMapping("/myWalletTopUp")
	public String myWalletTopUp(@ModelAttribute("mCoinTopUpDetail") MCoinTopUpDetail mCoinTopUpDetail, Model model,
			HttpSession session) throws Exception {
		MemberBean currentUser = (MemberBean) session.getAttribute("currentUser");

		// =========================
		session.setAttribute("mCoinTopUpDetail", mCoinTopUpDetail);
		try {
			// 信用卡支付
			if (mCoinTopUpDetail.getPaymentMethod() == 1) {
				return "redirect:/member/review";
			}
			// Paypal支付
			else {
				PayPalOrderDetail orderDetail = new PayPalOrderDetail("購買滿滿大平台M幣",
						String.valueOf(mCoinTopUpDetail.getTopUpAmount()), "0", "0",
						String.valueOf(mCoinTopUpDetail.getTopUpAmount()));
				PayPalPaymentServices paymentServices = new PayPalPaymentServices();
				String baseUrl = ServletUriComponentsBuilder.fromCurrentContextPath().build().toUriString();
				String approvalLink = paymentServices.authorizePayment(orderDetail, baseUrl);

				return "redirect:" + approvalLink;
			}

		} catch (PayPalRESTException ex) {
			model.addAttribute("verified", false);
			model.addAttribute("msg", "儲值失敗");
			ex.printStackTrace();
			return "account/myWallet";
		}

//
//		
//
//		
//		try {
//			accountService.update(currentUser);
//			model.addAttribute("verified", true);
//			model.addAttribute("msg", "儲值成功");
//
//		} catch (Exception ex) {
//			model.addAttribute("verified", false);
//			model.addAttribute("msg", "儲值失敗");
//		}
//
//		return "account/myWallet";
	}

	// 會員儲值M幣點數
	@GetMapping("/executePayment")
	public String executePayment(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId,
			Model model, HttpSession session) throws Exception {
		MemberBean currentUser = (MemberBean) session.getAttribute("currentUser");
		MCoinTopUpDetail mCoinTopUpDetail = (MCoinTopUpDetail) session.getAttribute("mCoinTopUpDetail");
		String paymentMethodStr = "信用卡";
		try {
			mCoinTopUpDetail.setMember(currentUser);
			mCoinTopUpDetail.setPaymentMethod(mCoinTopUpDetail.getPaymentMethod());
			mCoinTopUpDetail.setPaymentAmount(mCoinTopUpDetail.getTopUpAmount());
			mCoinTopUpDetail.setTopupDate(new Timestamp(System.currentTimeMillis()));
			mCoinTopUpDetail.setCreatedDate(new Timestamp(System.currentTimeMillis()));

			if (mCoinTopUpDetail.getPaymentMethod() == 2) {
				PayPalPaymentServices paymentServices = new PayPalPaymentServices();
				Payment payment = paymentServices.executePayment(paymentId, payerId);
//				PayerInfo payerInfo = payment.getPayer().getPayerInfo();
//				Transaction transaction = payment.getTransactions().get(0);
				if (payment.getState().equals("approved")) {
					paymentMethodStr = "PayPal";
				}

			}
			accountService.mCoinTopUp(currentUser, mCoinTopUpDetail);
			if(currentUser.getmCoinTopupDetailList() == null) {
				Set<MCoinTopUpDetail> mCoinTopupDetailList = new HashSet<MCoinTopUpDetail>();
				currentUser.setmCoinTopupDetailList(mCoinTopupDetailList);
			}
			currentUser.getmCoinTopupDetailList().add(mCoinTopUpDetail);
			accountService.update(currentUser);
			session.setAttribute("currentUser", currentUser);
			model.addAttribute("verified", true);
			model.addAttribute("msg", paymentMethodStr + "儲值成功");

		} catch (Exception ex) {
			model.addAttribute("verified", false);
			model.addAttribute("msg", paymentMethodStr + "儲值失敗");
		}

		return "account/myWallet";
	}

	// ==========================================================================
	// 會員信用卡一覽
	// ==========================================================================
	@GetMapping("/getMemberCreditCards")
	public @ResponseBody List<MemberCreditCard> getMemberCreditCards(HttpSession session) throws Exception {
		MemberBean currentUser = (MemberBean) session.getAttribute("currentUser");
		Hibernate.initialize(currentUser.getMemberCreditCardList());
		Set<MemberCreditCard> memberCreditCardList = currentUser.getMemberCreditCardList();

		ArrayList<MemberCreditCard> sortedlist = new ArrayList<MemberCreditCard>(memberCreditCardList);
		Collections.sort(sortedlist, Comparator.comparing(MemberCreditCard::getId));
		
		return sortedlist;
	}

	// 會員信用卡新增
	@PostMapping("/insertCreditCard")
	public String insertCreditCard(@ModelAttribute("memberCreditCard") MemberCreditCard memberCreditCard, Model model,
			HttpSession session) throws Exception {
		MemberBean currentUser = (MemberBean) session.getAttribute("currentUser");
		memberCreditCard.setMember(currentUser);
		if(currentUser.getMemberCreditCardList() == null) {
			Set<MemberCreditCard> getMemberCreditCardList = new HashSet<MemberCreditCard>();
			currentUser.setMemberCreditCardList(getMemberCreditCardList);
		}
		memberCreditCard.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		currentUser.getMemberCreditCardList().add(memberCreditCard);

		try {
			//accountService.insert(memberCreditCard);
			accountService.update(currentUser);
			session.setAttribute("currentUser", currentUser);
			model.addAttribute("verified", true);
			model.addAttribute("msg", "信用卡新增成功");

		} catch (Exception ex) {
			model.addAttribute("verified", false);
			model.addAttribute("msg", "信用卡新增失敗");
		}

		return "account/creditCard";
	}

	// 會員信用卡刪除
	@PostMapping("/deleteCreditCard")
	public @ResponseBody int deleteCreditCard(@RequestParam int cardId, HttpSession session) throws Exception {
		MemberBean currentUser = (MemberBean) session.getAttribute("currentUser");
		currentUser.getMemberCreditCardList().removeIf(obj -> obj.getId() == cardId);
		accountService.update(currentUser);
		session.setAttribute("currentUser", currentUser);

		return cardId;
	}

	// ==========================================================================
	// 會員訂閱管理
	// ==========================================================================
	@RequestMapping("/subscription")
	public String subscription() {
		return "account/subscription";
	}

	@GetMapping("/getCompanyList")
	public @ResponseBody List<Company> getCompanyList(HttpSession session) throws Exception {
		List<Company> companyList = companyService.getAllCompany();

		return companyList;
	}
	
	//////////////////////////
	////// 會員訂閱資料取得
	//////////////////////////
	@GetMapping(value = "/getMemberSubscriptions", produces = "application/json")
	public @ResponseBody int[] getMemberSubscriptions(HttpSession session) throws Exception {

		MemberBean currentUser = (MemberBean) session.getAttribute("currentUser");
		Set<MemberSubscription> memberSubscriptionList = accountService.getMemberSubscriptionList(currentUser.getId());
		if (memberSubscriptionList == null) {
			currentUser.setMemberSubscriptionList(new LinkedHashSet<MemberSubscription>());
		}

		int[] subscribedCompanyIds = new int[memberSubscriptionList.size()];
		int i = 0;
		for (MemberSubscription memberSubscription : memberSubscriptionList) {
			subscribedCompanyIds[i] = memberSubscription.getCompany().getId();
			i++;
		}
		return subscribedCompanyIds;
	}

	// 會員訂閱更新
	@PostMapping("/updateMemberSubscriptions")
	public String updateMemberSubscriptions(@RequestParam("subscribeCompany") String subscribeCompany, Model model,
			HttpSession session) throws Exception {
		MemberBean currentUser = (MemberBean) session.getAttribute("currentUser");
		Set<MemberSubscription> memberSubscriptionList = accountService.getMemberSubscriptionList(currentUser.getId());
		
		String[] subscribeCompanyIds = subscribeCompany.split(",");
		for (Company company : companyService.getAllCompany()) {
			// 需要訂閱此公司
			if (Arrays.asList(subscribeCompanyIds).contains(String.valueOf(company.getId()))) {
				// 此公司尚未訂閱
				if (!memberSubscriptionList.stream()
						.anyMatch(obj -> obj.getCompany().getId() == company.getId())) {
					MemberSubscription memberSubscription = new MemberSubscription();
					memberSubscription.setMember(currentUser);
					memberSubscription.setCompany(company);
					memberSubscriptionList.add(memberSubscription);
				}

			}
			// 沒有要訂閱此公司
			else {
				if (memberSubscriptionList != null && memberSubscriptionList.size() > 0) {
					
					//找出是否已訂閱此公司(需要做移除)
					Optional<MemberSubscription> mSubscription = memberSubscriptionList.stream()
							.filter(obj -> obj.getCompany().getId() == company.getId()).findFirst();
					if (!mSubscription.isEmpty()) {
						memberSubscriptionList.remove(mSubscription.get());
						accountService.delete(mSubscription.get());

					}
				}
			}
		}
		currentUser.setMemberSubscriptionList(memberSubscriptionList);

		try {
			accountService.update(currentUser);
			session.setAttribute("currentUser", currentUser);
			model.addAttribute("verified", true);
			model.addAttribute("msg", "訂閱更新成功");

		} catch (Exception ex) {
			model.addAttribute("verified", false);
			model.addAttribute("msg", "訂閱更新失敗");
		}

		return "account/subscription";
	}

	// ==========================================================================
	// 會員密碼變更
	// ==========================================================================
	@GetMapping("/changePassword")
	public String changePassword() {
		return "account/changePassword";
	}

	@PostMapping("/changePassword")
	public String changePassword(@ModelAttribute("member") MemberBean member, Model model, HttpSession session)
			throws Exception {
		byte[] encryptedNewPwd = Utility.encryptUsingSHA512(member.getOrigpwd());

		MemberBean currentUser = (MemberBean) session.getAttribute("currentUser");
		if (Arrays.equals(currentUser.getPassword(), encryptedNewPwd)) {
			currentUser.setPassword(Utility.encryptUsingSHA512(member.getPwd()));
			accountService.updatePassword(currentUser);
			model.addAttribute("verified", true);
			model.addAttribute("msg", "密碼變更成功");
			session.setAttribute("currentUser", currentUser);

		} else {
			model.addAttribute("verified", false);
			model.addAttribute("msg", "會員密碼輸入錯誤");
		}
		return "account/changePassword";
	}

	// ==========================================================================
	// 會員通知
	// ==========================================================================
	@GetMapping("/getMemberNotifications")
	public @ResponseBody List<MemberNotification> getMemberNotifications(HttpSession session) throws Exception {
		MemberBean currentUser = (MemberBean) session.getAttribute("currentUser");
		ArrayList<MemberNotification> sortedlist = null;
		if ( currentUser != null) {
			sortedlist = new ArrayList<MemberNotification>(accountService.getMemberNotificationList(currentUser.getId()));
			Collections.sort(sortedlist, Comparator.comparing(MemberNotification::getId).reversed());
		}
		
		return sortedlist;
	}
	
	@PostMapping("/updateMemberNotificationIsRead")
	public @ResponseBody Boolean updateMemberNotificationIsRead( @RequestParam("mnId") int mnId, HttpSession session) throws Exception {
		accountService.updateMemberNotificationIsRead(mnId);
		return true;
	}

	// ==========================================================================
	// 會員忘記密碼
	// ==========================================================================
	@SuppressWarnings("unused")
	@PostMapping("/forgotPassword")
	public String forgotPassword(@RequestParam("qid") String qid, @RequestParam("email") String email, @RequestParam("pwd") String pwd, Model model,
			HttpSession session) throws Exception {

		// 先用qid,email去找會員
		MemberBean member = accountService.selectByQidEmail(qid, email);

		//
		//String code = "forgotPasswordCode";
		byte[] newpwd = Utility.encryptUsingSHA512(pwd);
		member.setPassword(newpwd);
		//

		// 發送Email信件

		//
		if (member != null) {
			accountService.updatePassword(member);
			model.addAttribute("verified", true);
			model.addAttribute("msg", "已成功變更密碼");

		} else {
			model.addAttribute("verified", false);
			model.addAttribute("msg", "資料輸入錯誤");
		}

		return "account/forgotPassword";
	}

}
