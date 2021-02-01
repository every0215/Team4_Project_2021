package com.web.store.ticket.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Hashtable;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.web.store.account.javabean.MemberBean;
import com.web.store.ticket.model.Event;
import com.web.store.ticket.model.Exhibition;
import com.web.store.ticket.model.Price;
import com.web.store.ticket.model.Sport;
import com.web.store.ticket.model.TicketOnWay;
import com.web.store.ticket.model.TicketOrder;
import com.web.store.ticket.model.TicketOrderDetail;
import com.web.store.ticket.service.BackendService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import ecpay.payment.integration.domain.AioCheckOutATM;
import ecpay.payment.integration.domain.AioCheckOutBARCODE;
import ecpay.payment.integration.domain.AioCheckOutCVS;
import ecpay.payment.integration.domain.AioCheckOutDevide;
import ecpay.payment.integration.domain.AioCheckOutOneTime;
import ecpay.payment.integration.domain.AioCheckOutPeriod;
import ecpay.payment.integration.domain.AioCheckOutWebATM;
import ecpay.payment.integration.domain.CreateServerOrderObj;
import ecpay.payment.integration.domain.DoActionObj;
import ecpay.payment.integration.domain.FundingReconDetailObj;
import ecpay.payment.integration.domain.InvoiceObj;
import ecpay.payment.integration.domain.QueryCreditCardPeriodInfoObj;
import ecpay.payment.integration.domain.QueryTradeInfoObj;
import ecpay.payment.integration.domain.QueryTradeObj;
import ecpay.payment.integration.domain.TradeNoAioObj;

@Controller
public class ECpay {
	public static AllInOne all;
// @GetMapping(value="reportdow")
// public HttpEntity<byte[]> reportdow(HttpServletResponse response) {
//   String data = "[{\"Id\":15243,\"ShopId\":2,\"ShopName\":\"全聯線上購\",\"ShopCategoryId\":269,\"CategoryId\":269,\"CategoryName\":\"豬肉類\",\"CategoryLevelName\":{\"Level1_ShopCategory_Id\":241,\"Level1_ShopCategory_Name\":\"海鮮肉品\",\"Level2_ShopCategory_Id\":269,\"Level2_ShopCategory_Name\":\"豬肉類\",\"Level3_ShopCategory_Id\":null,\"Level3_ShopCategory_Name\":null,\"ShopCategory_ShowId\":269,\"ShopCategory_ShowName\":\"海鮮肉品 > 豬肉類\"},\"SubTitle\":\"\",\"Title\":\"【分批取貨】黑豬梅花火鍋片 (約200g/盒)\",\"ShortDescription\":\"<ul><li>●商品製造日期、有效期限、商品成份與相關注意事項皆標示於商品外包裝或商品上，相關說明皆以實際商品所示資訊為主</li><li>●商品因拍攝之圖檔顯示上可能略有差異，以實際商品為主</li><li>●商品文案若有變動以實際商品為準</li><li>使用台灣本地黑豬肉，肉質柔軟、鮮嫩多汁。</li></ul>\",\"SubDescript\":\"<ul><li>84020005</li></ul>\",\"SuggestPrice\":324,\"Price\":265,\"MinSuggestPrice\":324,\"MinPrice\":265,\"MaxSuggestPrice\":324,\"MaxPrice\":265,\"SellingStartDateTime\":\"2021-01-08T00:00:00\",\"ListingStartDateTime\":\"2021-01-08T00:00:00\",\"CreateDateTime\":\"2021-01-23T18:22:30.0427601\",\"ImageCount\":1,\"ImageList\":[{\"Index\":0,\"Type\":\"SalePage\",\"Id\":15243,\"Seq\":0,\"Url\":\"SalePage/15243/0\",\"PicUrl\":\"//img.cdn.px.91app.tw/webapi/imagesV3/Original/SalePage/15243/0/637456343643970000?v=1\",\"SKUPropertyNameSet\":null,\"UpdatedDateTime\":\"2021-01-07T16:39:24.397\"}],\"MainImageVideo\":null,\"HasSKU\":false,\"StatusDef\":\"Normal\",\"SaleProductSKUIdList\":[27208],\"SKUPropertySetList\":[{\"GoodsSKUId\":0,\"PropertySet\":\"-1:-1\",\"SaleProductSKUId\":27208,\"SellingQty\":0,\"OnceQty\":0,\"PropertyNameSet\":\"-1:-1:-1:-1\",\"IsShow\":true,\"Price\":265,\"SuggestPrice\":324,\"CartonQty\":3}],\"PointsPayPairsList\":[],\"IsLimit\":false,\"IsShareToBuy\":false,\"IsAPPOnly\":false,\"MajorList\":[{\"Title\":\"【分批取貨】黑豬梅花火鍋片 (約200g/盒)\",\"Price\":265,\"SKUList\":[{\"Title\":\"-1\",\"PropertyList\":[{\"Name\":\"-1\",\"PropertySet\":\"-1:-1\",\"PropertyNameSet\":\"-1:-1:-1:-1\"}],\"DisplayPropertyName\":\"-1\"}],\"ShippingTypeDef\":8,\"ShippingTypeDefDesc\":null,\"ShippingDate\":null,\"ShippingWaitingDays\":null,\"SaleProductId\":15243,\"ShippingEndDate\":null,\"TemperatureTypeDef\":\"Normal\",\"Length\":null,\"Width\":null,\"Height\":null,\"Weight\":null,\"OrderFrequencySelectionDesc\":\"\",\"PickupPeriodDays\":90}],\"SalePageGiftList\":[],\"UpdatedDateTime\":\"2021-01-07T16:39:24.397\",\"PayProfileTypeDefList\":[\"PXPay\",\"CathayPay\"],\"PayProfileTypeList\":[{\"PayProfileTypeDef\":\"PXPay\",\"DisplayString\":\"PX Pay\",\"LimitedBanks\":[]},{\"PayProfileTypeDef\":\"CathayPay\",\"DisplayString\":\"信用卡付款\",\"LimitedBanks\":[\"國泰世華商業銀行\",\"彰化商業銀行\",\"花旗銀行\",\"中國信託商業銀行\",\"玉山商業銀行\",\"第一商業銀行\",\"凱基商業銀行\",\"臺灣新光商業銀行\",\"永豐商業銀行\",\"台北富邦商業銀行\",\"台新國際商業銀行\",\"聯邦商業銀行\"]}],\"ShippingTypeList\":[{\"Id\":23,\"FeeTypeDef\":\"Free\",\"FeeTypeDefDesc\":\"免運費\",\"OverPrice\":0,\"TypeName\":\"付款後門市分批取貨\",\"Fee\":0,\"SupplierId\":2,\"ShopId\":2,\"IsEnabled\":true,\"IsDefault\":false,\"ShippingTypeDef\":\"PartialPickup\",\"TemperatureTypeDef\":\"Normal\",\"ShippingProfileTypeDef\":\"PartialPickup\",\"DisplayString\":\"付款後門市分批取貨，免運費\"}],\"InstallmentList\":[],\"SalePageShowShippingTypeLists\":{\"PartialPickup\":\"付款後門市分批取貨，免運費\"},\"IsShowSoldQty\":false,\"SoldQty\":83,\"IsShowStockQty\":false,\"StockQty\":0,\"IsShowTradesOrderList\":false,\"TradesOrderListUri\":{\"Domain\":\"tw.91app.com\",\"Path\":\"/SalePage/TradesOrderList/15243\"},\"IsExcludeECouponDiscount\":false,\"IsDisplayExcludeECouponDiscount\":false,\"Promotions\":[],\"ECoupons\":[{\"ShopId\":2,\"ShopName\":\"全聯線上購\",\"ECouponList\":[]}],\"Description\":null,\"FreeShippingTypeTag\":{\"HasFreeShippingTypeTag\":true,\"BestFreeShippingTypeTag\":\"分批取貨免運費\"},\"IsSalePageFeaturesCollapse\":false,\"PurchaseExtraAmountThreshold\":0,\"IsPurchaseExtra\":false,\"SalePageKindDef\":\"Normal\",\"CanOverseaShipping\":false,\"SalePageDisplayTagList\":null,\"IsAPPOnlyPromotion\":false,\"TagIds\":null,\"HiddenCodeOrSalePageId\":\"15243\",\"IsEnableBookingPickupDate\":false,\"PrepareDays\":0,\"AvailablePickupDays\":0,\"AvailablePickupStartDateTime\":null,\"AvailablePickupEndDateTime\":null,\"LocationId\":0}]";
//	 HttpHeaders headers = new HttpHeaders();
//     headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
//     response.setHeader("Content-Disposition", "attachment; filename=my-data.json");
//     return new HttpEntity<byte[]>(data.getBytes(), headers);
// }
	
	@Autowired
	BackendService backendService;

	@GetMapping(value = "ecpayTest")
	public String ecpayTest(HttpServletResponse response) {
		
		initial();
		System.out.println("compare CheckMacValue method testing result: " + cmprChkMacValue());
		System.out.println("apple pay create order: " + postCreateServerOrder());
		System.out.println("doAction: " + postDoAction());
		System.out.println("queryTradeInfo: " + postQueryTradeInfo());
		System.out.println("queryCreditCardPeriodInfo: " + postQueryCreditCardPeriodInfo());
		System.out.println("queryTrade: " + postQueryTrade());
		System.out.println("tradeNoAio: " + postTradeNoAio());
		System.out.println("fundingReconDetail: " + postFundingReconDetail());
		System.out.println("aioCheckOutALL: " + genAioCheckOutALL());
		System.out.println("aioCheckOutATM: " + genAioCheckOutATM());
		System.out.println("aioCheckOutCVS: " + genAioCheckOutCVS());
		System.out.println("aioCheckOutBARCODE: " + genAioCheckOutBARCODE());
		System.out.println("aioCheckOutDevide: " + genAioCheckOutDevide());
		System.out.println("aioCheckOutOneTime: " + genAioCheckOutOneTime());
		System.out.println("aioCheckOutPeriod: " + genAioCheckOutPeriod());
		System.out.println("aioCheckOutWebATM: " + genAioCheckOutWebATM());
		return "123";
	}
	private static void initial(){
		all = new AllInOne("");
	}

	public static boolean cmprChkMacValue() {
		Hashtable<String, String> dict = new Hashtable<String, String>();
		dict.put("MerchantID", "2000132");
		dict.put("CheckMacValue", "50BE3989953C1734E32DD18EB23698241E035F9CBCAC74371CCCF09E0E15BD61");
		return all.compareCheckMacValue(dict);
	}

	public static String postCreateServerOrder() {
		CreateServerOrderObj obj = new CreateServerOrderObj();
		obj.setMerchantTradeNo("sdfkjh2kli3hlih");
		obj.setMerchantTradeDate("2017/05/12 10:23:46");
		obj.setTotalAmount("1000");
		obj.setCurrencyCode("TWD");
		try {
			obj.setItemName(new String("哈".getBytes("BIG5"), "UTF-8"));
			obj.setTradeDesc(new String("哈".getBytes("BIG5"), "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		obj.setTradeType("2");
		obj.setPaymentToken(
				"{	\"token\":	{		\"paymentData\":		{			\"data\":\"rLQsaJzRWR4MGdZWvWY9dvfmKRYKY8jcOP3YDBH+QpB5tklltZErejVyHARz6+pJdBAnjjECuoqH8aDerZHraBz2pb14uBuiawhqeT0UrAsp/vHTM05BZdpcGT7JQAJzx0gcxRWZ7b7EpBt8xiSaPISHZA9TlVwNbfyM3IB1p5e3V3OEWwENAyhaXdBZNovZdjfQ8Z8AhCypjCeiLvprlfXHpzYadZwHlX40lbZRkxWYPEbP3XEaa1FsPVxYNkSJKcE6t4mEW1cSGZJnEbxFOw6npITnm+Pr2lg8mQJwMeRxs90xpmc0m0BVBAnT7CnqYSzEBkmIBUX5EQvgAC3t4XHUAghwx9nkPbgzXtBA5OLkaDq5Cqo5qrgGty37eDot+zkUQfpugj2Axkrc5Mey1J0+PWpG1cOLeAq/UGSv2tbZ\",			\"signature\":\"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\",			\"header\":			{				\"publicKeyHash\":\"xLBxijBsfyoaFVUlEEUEQptPsmD4WIt491ovV5DKNAg=\",				\"ephemeralPublicKey\":\"MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE/WwswbNtdjBmX94iGQh5Z4Cyt7v7rMNAMO2Hgi93HUpSSJ5pI+5TYM4UtdIWfDbBzXQiwCAKT3jreo1cLPAdzg==\",				\"transactionId\":\"85a158652b0d98379cb817dd53e97dfd8131dde2f578128482b6dee4c9e98eb9\"			},			\"version\":\"EC_v1\"		},		\"transactionIdentifier\":\"85A158652B0D98379CB817DD53E97DFD8131DDE2F578128482B6DEE4C9E98EB9\",		\"paymentMethod\":		{			\"network\":\"Visa\",			\"type\":\"debit\",			\"displayName\":\"Visa 0492\"		}	}}");
		return all.createServerOrder(obj);
	}

	public static String postDoAction() {
		DoActionObj obj = new DoActionObj();
		obj.setMerchantTradeNo("b0fac40057364c0894b");
		obj.setTotalAmount("100");
		obj.setTradeNo("16054565489");
		obj.setAction("C");
		return all.doAction(obj);
	}

	public static String postFundingReconDetail() {
		FundingReconDetailObj obj = new FundingReconDetailObj();
		obj.setPayDateType("close");
		obj.setStartDate("2017-03-03");
		obj.setEndDate("2017-03-03");
		return all.fundingReconDetail(obj);
	}

	public static String postQueryTrade() {
		QueryTradeObj obj = new QueryTradeObj();
		obj.setCreditRefundId("10123456");
		obj.setCreditAmount("100");
		obj.setCreditCheckCode("59997889");
		return all.queryTrade(obj);
	}

	public static String postQueryTradeInfo() {
		QueryTradeInfoObj obj = new QueryTradeInfoObj();
		obj.setMerchantTradeNo("0c3075e7499743e58ef");
		return all.queryTradeInfo(obj);
	}

	public static String postTradeNoAio() {
		TradeNoAioObj obj = new TradeNoAioObj();
		obj.setDateType("6");
		obj.setBeginDate("2017-03-03");
		obj.setEndDate("2017-03-03");
		obj.setMediaFormated("1");
		return all.tradeNoAio(obj);
	}

	public static String postQueryCreditCardPeriodInfo() {
		QueryCreditCardPeriodInfoObj obj = new QueryCreditCardPeriodInfoObj();
		obj.setMerchantTradeNo("74823H75879R166472");
		return all.queryCreditCardPeriodInfo(obj);
	}

	public static String genAioCheckOutWebATM() {
		AioCheckOutWebATM obj = new AioCheckOutWebATM();
		obj.setMerchantTradeNo("testCompany000444");
		obj.setMerchantTradeDate("2017/01/01 08:05:08");
		obj.setTotalAmount("100");
		obj.setTradeDesc("test Description");
		obj.setItemName("Test Item");
		obj.setReturnURL("http://211.23.128.214:5000");
		obj.setNeedExtraPaidInfo("N");
		String form = all.aioCheckOut(obj, null);
		return form;
	}

	public static String genAioCheckOutALL() {
		AioCheckOutALL obj = new AioCheckOutALL();
		obj.setMerchantTradeNo("testCompany0004");
		obj.setMerchantTradeDate("2017/01/01 08:05:23");
		obj.setTotalAmount("50");
		obj.setTradeDesc("test Description");
		obj.setItemName("TestItem");
		obj.setReturnURL("http://211.23.128.214:5000");
		obj.setNeedExtraPaidInfo("N");
		String form = all.aioCheckOut(obj, null);
		return form;
	}

	public static String genAioCheckOutATM() {
		AioCheckOutATM obj = new AioCheckOutATM();
		obj.setMerchantTradeNo("testCompany0005");
		obj.setMerchantTradeDate("2017/01/01 08:05:23");
		obj.setTotalAmount("50");
		obj.setTradeDesc("test Description");
		obj.setItemName("TestItem");
		obj.setReturnURL("http://211.23.128.214:5000");
		obj.setNeedExtraPaidInfo("N");
		obj.setExpireDate("6");
		String form = all.aioCheckOut(obj, null);
		return form;
	}

	public static String genAioCheckOutBARCODE() {
		AioCheckOutBARCODE obj = new AioCheckOutBARCODE();
		obj.setMerchantTradeNo("testCompany0007");
		obj.setMerchantTradeDate("2017/01/01 08:05:23");
		obj.setTotalAmount("50");
		obj.setTradeDesc("test Description");
		obj.setItemName("TestItem");
		obj.setReturnURL("http://211.23.128.214:5000");
		obj.setNeedExtraPaidInfo("N");
		obj.setStoreExpireDate("3");
		String form = all.aioCheckOut(obj, null);
		return form;
	}

	public static String genAioCheckOutCVS() {
		AioCheckOutCVS obj = new AioCheckOutCVS();
		InvoiceObj invoice = new InvoiceObj();
		UUID uid = UUID.randomUUID();
		obj.setMerchantTradeNo(uid.toString().replaceAll("-", "").substring(0, 20));
		obj.setMerchantTradeDate("2017/01/01 08:05:23");
		obj.setTotalAmount("50");
		obj.setTradeDesc("test Description");
		obj.setItemName("TestItem");
		obj.setReturnURL("http://211.23.128.214:5000");
		obj.setNeedExtraPaidInfo("N");
		obj.setStoreExpireDate("3");
		obj.setInvoiceMark("Y");
		invoice.setRelateNumber("test202017test");
		invoice.setCustomerID("123456");
		invoice.setCarruerType("1");
		invoice.setTaxType("1");
		invoice.setCarruerNum("");
		invoice.setDonation("0");
		invoice.setLoveCode("X123456");
		invoice.setPrint("0");
		invoice.setCustomerName("Mark");
		invoice.setCustomerAddr("台北市南港區三重路");
		invoice.setCustomerPhone("0911429215");
		invoice.setDelayDay("1");
		invoice.setInvType("07");
		invoice.setInvoiceItemName("測試");
		invoice.setInvoiceItemCount("1");
		invoice.setInvoiceItemWord("個");
		invoice.setInvoiceItemPrice("50");
		invoice.setInvoiceItemTaxType("1");
		String form = all.aioCheckOut(obj, invoice);
		return form;
	}

	public static String genAioCheckOutDevide() {
		AioCheckOutDevide obj = new AioCheckOutDevide();
		obj.setMerchantTradeNo("testCompany0007");
		obj.setMerchantTradeDate("2017/01/01 08:05:23");
		obj.setTotalAmount("50");
		obj.setTradeDesc("test Description");
		obj.setItemName("TestItem");
		obj.setReturnURL("http://211.23.128.214:5000");
		obj.setNeedExtraPaidInfo("N");
		obj.setCreditInstallment("3,6");
		obj.setInstallmentAmount("10");
		String form = all.aioCheckOut(obj, null);
		return form;
	}

	public static String genAioCheckOutOneTime() {
		AioCheckOutOneTime obj = new AioCheckOutOneTime();
		obj.setMerchantTradeNo("testCompany0008");
		obj.setMerchantTradeDate("2017/01/01 08:05:23");
		obj.setTotalAmount("50");
		obj.setTradeDesc("test Description");
		obj.setItemName("TestItem");
		obj.setReturnURL("http://211.23.128.214:5000");
		obj.setNeedExtraPaidInfo("N");
		obj.setRedeem("Y");
		String form = all.aioCheckOut(obj, null);
		return form;
	}

	public static String genAioCheckOutPeriod() {
		AioCheckOutPeriod obj = new AioCheckOutPeriod();
		obj.setMerchantTradeNo("testCompany0009");
		obj.setMerchantTradeDate("2017/01/01 08:05:23");
		obj.setTotalAmount("50");
		obj.setTradeDesc("test Description");
		obj.setItemName("TestItem");
		obj.setReturnURL("http://211.23.128.214:5000");
		obj.setNeedExtraPaidInfo("N");
		obj.setPeriodAmount("50");
		obj.setPeriodType("D");
		obj.setFrequency("1");
		obj.setExecTimes("12");
		String form = all.aioCheckOut(obj, null);
		return form;
	}
	

	@PostMapping(value="/ecpay/response")
	public String ecPay(
		Model model, HttpSession session,
		@RequestParam(value="CustomField1",required=false) String customField1,
		@RequestParam(value="CustomField2",required=false) String customField2,
		@RequestParam(value="CustomField3",required=false) String customField3,
		@RequestParam(value="CustomField4",required=false) String customField4,
		@RequestParam(value="MerchantID",required=false) String merchantID,
		@RequestParam(value="MerchantTradeNo",required=false) String merchantTradeNo,
		@RequestParam(value="PaymentDate",required=false) String paymentDate,
		@RequestParam(value="PaymentType",required=false) String paymentType,
		@RequestParam(value="PaymentTypeChargeFee",required=false) String paymentTypeChargeFee,
		@RequestParam(value="RtnCode",required=false) String rtnCode,
		@RequestParam(value="RtnMsg",required=false) String rtnMsg,
		@RequestParam(value="SimulatePaid",required=false) String simulatePaid,
		@RequestParam(value="StoreID",required=false) String storeID,
		@RequestParam(value="TradeAmt",required=false) String tradeAmt,
		@RequestParam(value="TradeDate",required=false) String tradeDate,
		@RequestParam(value="TradeNo",required=false) String tradeNo
	) throws IOException {
		
		System.out.println("支付成功 merchantTradeNo: "+merchantTradeNo);
		System.out.println(customField1+customField2+customField3+customField4+merchantID+merchantTradeNo+paymentDate+paymentType+paymentTypeChargeFee+rtnCode+rtnMsg+simulatePaid+storeID+tradeAmt+tradeDate+tradeNo);
		//開始調整資料
		Double discountRatio;
		ArrayList<Double> dPriceList = new ArrayList<>();
		//搜尋ORDERID對應的訂單
		String shortId = merchantTradeNo.substring(0, 8)+"-"+merchantTradeNo.substring(8, 12)+"-"+merchantTradeNo.substring(12, 16)+"-"+merchantTradeNo.substring(16, 19);
		System.out.println(shortId);
		TicketOrder ticketOrder = backendService.queryTicketOnWayByTicketOrder(shortId);
		System.out.println("====================================="+ticketOrder.getId());
		Timestamp validTime = getValidTime();
		System.out.println("====================================="+ticketOrder.getId());
		ticketOrder.setValidTime(validTime);
		System.out.println("====================================="+ticketOrder.getId());
		ticketOrder.setStatus(1);
		System.out.println("====================================="+ticketOrder.getId());
		backendService.updateTicketOrder(ticketOrder);
		System.out.println("====================================="+ticketOrder.getId());
		//把onWay刪掉
		TicketOrder ticketOrderN = backendService.queryTicketOnWayByTicketOrder(ticketOrder);
		Set<TicketOnWay> ticketOnWays = ticketOrderN.getTicketOnWays();
		for(TicketOnWay ticketOnWay: ticketOnWays) {
			Integer id = ticketOnWay.getId();
			backendService.deleteTicketOnWay(id);
		}
		//尋找ORDER DETAIL
		TicketOrder ticketOrderF = backendService.queryTicketOrderDetailByTicketOrder(ticketOrder);
		Set<TicketOrderDetail> ticketOrderDetails = ticketOrderF.getTicketOrderDetails();
		
		List<TicketOrderDetail> list = new ArrayList<TicketOrderDetail>(ticketOrderDetails);
		Event event = backendService.queryOneEvent(list.get(0).getEventId());
		List<Price> priceList = backendService.selectPriceList(event.getId());
		
		Integer discount = list.get(0).getDiscount();
		if(discount==1) {
			List<Price> oPriceList = backendService.selectPriceList(event.getId());
			if(event.getTypeId()==1) {
				Exhibition exhibition = backendService.selectExhibitionByEvent(event.getId());
				discountRatio = exhibition.getDiscountRatio();
				
				}else {
				Sport sport = backendService.selectSportByEvent(event.getId());
				discountRatio = sport.getDiscountRatio();
			}
			for(Price price:oPriceList) {
				Double dCost = price.getCost().doubleValue();
				double nCost = discountRatio*dCost;
				dPriceList.add(nCost);
			}
			
		}else {
			priceList = backendService.selectPriceList(event.getId());
		}
		
		
		model.addAttribute("ticketOrder", ticketOrderF);
		model.addAttribute("event", event);
		model.addAttribute("TicketOrderDetails", list);
		model.addAttribute("priceList", priceList);
		
		model.addAttribute("dPriceList", dPriceList);
		model.addAttribute("discount", discount);
		
		return "account/ticketOrderDetail";
	}
	
	@PostMapping(value="/ecpay", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String ecPay(
		@RequestParam(value="order") String merchantTradeNo, 
		@RequestParam(value="orderName") String itemName, 
		@RequestParam(value="orderCost") String amount, 
		@RequestParam(value="tradeDesc") String tradeDesc
	) throws IOException {
		AllInOne all = new AllInOne("");
		AioCheckOutALL obj = new AioCheckOutALL();
		
		System.out.println(merchantTradeNo.replaceAll("-", "").substring(0, 19));
		obj.setMerchantTradeNo(merchantTradeNo.replaceAll("-", "").substring(0, 19));
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date current = new Date(System.currentTimeMillis());
		
		System.out.println(sdFormat.format(current));
		obj.setMerchantTradeDate(sdFormat.format(current));
		obj.setTotalAmount(amount);
		obj.setTradeDesc(java.net.URLEncoder.encode(tradeDesc, "UTF-8"));
		obj.setItemName(itemName);
		//ngrok連線需要定時更新
		obj.setReturnURL("https://0328698066a9.ngrok.io/proj/ecpay/response");
		obj.setNeedExtraPaidInfo("Y");
		String form = all.aioCheckOut(obj, null);
		return form;
	}

	public Timestamp getValidTime() {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		Timestamp validTime = new Timestamp(now.getTime());
		return validTime;
	}
	
	
	
	
	
	
}