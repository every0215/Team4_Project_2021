<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
  <c:import url="/layout/head" />
  <style>
  	
button {
  cursor: pointer;
}



.pdfobject-container {
  height: 30rem;
  border: 1rem solid rgba(0, 0, 0, 0.1);
}

 .trigger { 
   text-decoration: underline;
   color: #0037ff;
}

/* .trigger i { */
/*   margin-right: 0.3125rem; */
/* } */
/* .trigger:hover { */
/*   box-shadow: 0 0.875rem 1.75rem rgba(0, 0, 0, 0.25), 0 0.625rem 0.625rem rgba(0, 0, 0, 0.22); */
/* } */

.ll-modal {
  position: fixed;
  top: 0;
  left: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  height: 0vh;
  background-color: transparent;
  overflow: hidden;
  transition: background-color 0.25s ease;
  z-index: 9999;
}
.ll-modal.open {
  position: fixed;
  width: 100%;
  height: 100vh;
  background-color: rgba(0, 0, 0, 0.5);
  transition: background-color 0.25s;
}
.ll-modal.open > .content-wrapper {
  transform: scale(1);
}
.ll-modal .content-wrapper {
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
  width: 50%;
  margin: 0;
  padding: 2.5rem;
  background-color: white;
  border-radius: 0.3125rem;
  box-shadow: 0 0 2.5rem rgba(0, 0, 0, 0.5);
  transform: scale(0);
  transition: transform 0.25s;
  transition-delay: 0.15s;
}
.ll-modal .content-wrapper .close {
  position: absolute;
  top: 0.5rem;
  right: 0.5rem;
  display: flex;
  align-items: center;
  justify-content: center;
  width: 2.5rem;
  height: 2.5rem;
  border: none;
  background-color: transparent;
  font-size: 1.5rem;
  transition: 0.25s linear;
}
.ll-modal .content-wrapper .close:before, .ll-modal .content-wrapper .close:after {
  position: absolute;
  content: "";
  width: 1.25rem;
  height: 0.125rem;
  background-color: black;
}
.ll-modal .content-wrapper .close:before {
  transform: rotate(-45deg);
}
.ll-modal .content-wrapper .close:after {
  transform: rotate(45deg);
}
.ll-modal .content-wrapper .close:hover {
  transform: rotate(360deg);
}
.ll-modal .content-wrapper .close:hover:before, .modal .content-wrapper .close:hover:after {
  background-color: tomato;
}
.ll-modal .content-wrapper .ll-modal-header {
  position: relative;
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
  width: 100%;
  margin: 0;
  padding: 0 0 1.25rem;
}
.ll-modal .content-wrapper .ll-modal-header h2 {
  font-size: 1.5rem;
  font-weight: bold;
}
.ll-modal .content-wrapper .content {
  position: relative;
  display: flex;
}
.ll-modal .content-wrapper .content p {
  font-size: 0.875rem;
  line-height: 1.75;
}
.ll-modal .content-wrapper .ll-modal-footer {
  position: relative;
  display: flex;
  align-items: center;
  justify-content: flex-end;
  width: 100%;
  margin: 0;
  padding: 1.875rem 0 0;
}
.ll-modal .content-wrapper .ll-modal-footer .action {
  position: relative;
  margin-left: 0.625rem;
  padding: 0.625rem 1.25rem;
  border: none;
  background-color: slategray;
  border-radius: 0.25rem;
  color: white;
  font-size: 0.87rem;
  font-weight: 300;
  overflow: hidden;
  z-index: 1;
}
.ll-modal .content-wrapper .ll-modal-footer .action:before {
  position: absolute;
  content: "";
  top: 0;
  left: 0;
  width: 0%;
  height: 100%;
  background-color: rgba(255, 255, 255, 0.2);
  transition: width 0.25s;
  z-index: 0;
}
.ll-modal .content-wrapper .ll-modal-footer .action:first-child {
  background-color: #2ecc71;
}
.ll-modal .content-wrapper .ll-modal-footer .action:last-child {
  background-color: #e74c3c;
}
.ll-modal .content-wrapper .ll-modal-footer .action:hover:before {
  width: 100%;
}
  </style>
  <body> 
   <!-- wpf loader Two -->
    <div id="wpf-loader-two">          
      <div class="wpf-loader-two-inner">
        <span>Loading</span>
      </div>
    </div> 
    <!-- / wpf loader Two -->       
  <!-- SCROLL TOP BUTTON -->
    <a class="scrollToTop" href="#"><i class="fa fa-chevron-up"></i></a>
  <!-- END SCROLL TOP BUTTON -->

	<c:import url="/layout/header" />

  <!-- catg header banner section -->
  <section id="aa-catg-head-banner">
    <img src="<c:url value='/img/fashion/fashion-header-bg-8.jpg' />" alt="fashion img">
    <div class="aa-catg-head-banner-area">
     <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>Account Page</h2>
        <ol class="breadcrumb">
          <li><a href="index.html">Home</a></li>                   
          <li class="active">Account</li>
        </ol>
      </div>
     </div>
   </div>
  </section>
  <!-- / catg header banner section -->

 <!-- Cart view section -->
 <section id="aa-myaccount">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
       <div class="aa-myaccount-area">         
           <div class="row">
             <div class="col-md-12">
               <div class="aa-myaccount-register">                 
                <h4>會員註冊</h4>
                <form:form id="RegisterForm" method="POST" class="aa-login-form" action="${pageContext.request.contextPath}/account/register" modelAttribute="member" enctype='multipart/form-data'>
                	<div class="form-group">
						<label for="fullname">姓名:<span>*</span></label> 
						<input type="text" class="form-control" id="fullname" name="fullname" placeholder="請輸入全名" required>
						<img id="fullnameErrorImg" class="CheckStatus" src="<c:url value='/img/Warning_icon.png' />" style="width: 15px;">
						<small id="fullnameErrorMsg" class="form-text ll-err-msg CheckStatus">(至少2個字以上且必須全部為中文字)</small>
						<img id="fullnameCheckImg" class="CheckStatus" src="<c:url value='/img/check.png' />" style="width: 25px;">
	
					</div>
					<div class="form-group">
						<label for="nickname">暱稱:<span>*</span></label> 
						<input type="text" class="form-control" id="nickname" name="nickname" placeholder="請輸入暱稱" required>
						<img id="nicknameErrorImg" class="CheckStatus" src="<c:url value='/img/Warning_icon.png' />" style="width: 15px;">
						<small id="nicknameErrorMsg" class="form-text ll-err-msg CheckStatus">(5個到30個字)</small>
						<img id="nicknameCheckImg" class="CheckStatus" src="<c:url value='/img/check.png' />" style="width: 25px;">
					</div>
					<div class="form-group">
						<label for="qid">身份證字號:<span>*</span></label> <input type="text"
							class="form-control" id="qid" name="qid" placeholder="請輸入身份證字號" required>
						<img id="qidErrorImg" class="CheckStatus" src="<c:url value='/img/Warning_icon.png' />" style="width: 15px;">
						<small id="qidErrorMsg" class="form-text ll-err-msg CheckStatus"></small>
						<img id="qidCheckImg" class="CheckStatus" src="<c:url value='/img/check.png' />" style="width: 25px;">
					</div>
					<div class="form-group">
						<label for="email">電子郵件:<span>*</span></label> <input type="email"
							class="form-control" id="email" name="email" placeholder="請輸入電子郵件" required>
						<img id="emailErrorImg" class="CheckStatus" src="<c:url value='/img/Warning_icon.png' />" style="width: 15px;">
						<small id="emailErrorMsg" class="form-text ll-err-msg CheckStatus"></small>
						<img id="emailCheckImg" class="CheckStatus" src="<c:url value='/img/check.png' />" style="width: 25px;">
					</div>
					<div class="form-group">
						<label for="password">密碼:<span>*</span></label> <input type="password"
							class="form-control" id="password" name="pwd" placeholder="請輸入密碼" required>
						<img id="passwordErrorImg" class="CheckStatus" src="<c:url value='/img/Warning_icon.png' />" style="width: 15px;">
						<small id="passwordErrorMsg" class="form-text ll-err-msg CheckStatus"></small>
						<img id="passwordCheckImg" class="CheckStatus" src="<c:url value='/img/check.png' />" style="width: 25px;">
					</div>
					<div class="form-group">
						<label for="password2">再次輸入密碼:<span>*</span></label> <input type="password"
							class="form-control" id="password2" name="pwd2" placeholder="請輸入密碼" required>
						<img id="password2ErrorImg" class="CheckStatus" src="<c:url value='/img/Warning_icon.png' />" style="width: 15px;">
						<small id="password2ErrorMsg" class="form-text ll-err-msg CheckStatus">(1.不可為空白)</small>
						<img id="password2CheckImg" class="CheckStatus" src="<c:url value='/img/check.png' />" style="width: 25px;">
					</div>
					<div class="form-group form-check">
						<label class="form-check-lab" style="margin-right:5px;"><input class="form-check-input" type="checkbox" id="acceptAgreement" name="acceptAgreement" required>
							
						</label>我已閱讀並同意<a class="trigger" data-modal-trigger="trigger-1">條件及條款</a>
					</div>
					<div class="form-group" >
	                   <div class="g-recaptcha" data-callback="captchaCallback" data-sitekey="6LdV6CYaAAAAAKhDJ6LusYaCpuu6EVvCnNMw2tDV" ></div>
                    </div>
					<hr style="border-bottom: 1px solid #ccc; height:3px;" />
					<div class="form-group">
						<button type="submit" id="RegisterSubmit" class="aa-browse-btn">送出</button>
						<button type="reset" id="reset" class="aa-browse-btn">清除</button><br/><br/>
                   	</div>  
                   	<div class="form-group">
	               		<div id="RegisterMsgDiv" class="alert alert-danger"><strong>註冊失敗</strong><br><span id="RegisterMsg"></span></div>
					</div>  
					
                 </form:form>
               </div>
             </div>
           </div>          
        </div>
      </div>
    </div>
  </div>
</section>

 <!-- Agreement section -->


<button class="trigger" data-modal-trigger="trigger-2"><i class="fa fa-fire" aria-hidden="true"></i>	Modal 2</button>
<button class="trigger" data-modal-trigger="trigger-3"><i class="fa fa-fire" aria-hidden="true"></i>	Modal 3</button>
<div class="ll-modal" data-modal="trigger-1">
  <article class="content-wrapper">
    <button class="close"></button>
    <header class="ll-modal-header">
      <h2>This is a modal 1</h2>
    </header>
    <div class="content">
      <article style="overflow: auto;">
		    <h2 class="title">「Pi 拍錢包」金流代收轉付服務使用者服務條款<span>（以下稱「本服務條款」）</span></h2>
		    <p class="indent">為順應新型態電子商務之發展，促進消費之便利及安全性，拍付國際資訊股份有限公司（以下稱「本公司」）特建置「Pi
		        拍錢包」代收轉付服務（以下稱「本服務」），提供網路交易代收轉付服務及環繞行動商務而生之各項衍生服務。</p>
		    <p class="indent">
		        申請及使用本服務前應詳閱本服務條款，除與本公司另有書面約定外，使用者完成註冊程序或開始使用本服務之一部或全部功能，即代表使用者已詳閱、了解、並完全同意本服務條款及本服務之相關使用規範，包含但不限於本公司公布於本服務網站或本服務App之相關使用規範及限制，若使用者對本服務、本服務條款及相關使用規範之任一部分有疑義或反對時，應立即停止使用本服務。
		    </p>
		    <ol class="cjk-decimal">
		        <li>名詞定義
		            <ol>
		                <li>使用者：下載、安裝本服務App之人，以及申請使用本服務之人，不論使用本服務之一部或全部功能，均為本服務條款所稱之使用者，依其實際情況，使用者可能為付款方、亦可能為收款方。</li>
		                <li>付款方：係指商品或服務之買方，利用本服務付款予交易相對人者。</li>
		                <li>收款方：係指商品或服務之賣方，利用本服務收受交易相對人所支付之款項者。</li>
		                <li>本服務App：指本服務所提供，供使用者下載並安裝於行動裝置，以利進行本服務之申請、查詢、提出交易指示等操作之軟體，包含但不限於本公司自行開發並提供下載之App以及由本公司開發之網頁、App或SDK並授權提供予其他公司使用於該公司開發之App內，可藉此使用本公司所提供代收轉付等服務之軟體。
		                </li>
		                <li>本服務網站：指本公司為本服務所建置之網站（piapp.com.tw），包括該主網域下之相關網頁。</li>
		                <li>本服務發出之各種通知：指本服務以書面、電子郵件、行動電話簡訊、行動裝置訊息推播或其他形式所公告或傳遞予使用者之文字、圖形、聲音或影像訊息及其內容。</li>
		                <li>綁定行動裝置：指使用者於特定行動裝置上安裝本服務App，並經註冊、登入或其他驗證程序，使該特定行動裝置具備經由本服務App發出交易指示功能者，稱該特定行動裝置為「綁定行動裝置」。</li>
		                <li>「Pi
		                    行動商店」App：為本服務App所提供服務功能之一，係提供收款方得透過此服務功能刊載其所銷售商品或服務之說明內容、價格、圖片、及相關訊息，且接受付款方得透過本服務App向其訂購商品或服務。此服務功能目前僅提供「商業會員」登入使用。
		                </li>
		                <li>點餐功能：指「一般會員」得透過本服務App向收款方發出訂購商品或服務之要約，收款方得藉由操作「Pi 行動商店」App來表示是否同意接受訂購並於同意後經由「Pi 行動商店」App回覆處理交易內容之服務。
		                </li>
		                <li>資訊系統服務功能：指本公司單純提供資訊串接服務予對接方(指接收資訊串接之一方)，對接方可透過此功能接收使用者同意提供留存於本服務App之各項資料(含信用卡資料)，藉以進行保險費用續保、交易款項支付等各項經由資訊串接所提供之服務，進而使對接方可直接與銀行端進行交易與請款作業。
		                </li>
		                <li>圖書館借閱證功能：指使用者可透過此功能產生行動借閱證之條碼供使用者於圖書館使用。</li>
		                <li>拍享券功能：指使用者可透過本服務App之支付功能向票券提供方購買各類電子票券商品。</li>
		                <li>電子發票載具功能：指使用者可透過本服務App之「發票載具」，由本公司代為向財政部電子發票整合服務平台申請手機條碼等電子發票載具服務，使用者於消費時出示載具條碼或使用本服務App進行交易時，本公司將把發票載具資訊提供給合作通路，則通路系統可將使用者消費之電子發票上傳儲存於發票載具內。
		                </li>
		            </ol>
		        </li>
		        <br>
		        <li>使用者申請及使用帳號
		            <ol>
		                <li>使用者應為中華民國民法所規定具備完全行為能力之自然人，並應依本服務App及本服務網站之要求填入本人之正確資訊，不得有偽冒他人身分或登載虛偽資料之情事。</li>
		                <li>使用者申請使用本服務時，得視需求選擇使用「一般會員」或「商業會員」身分，各該會員身分之可用功能及使用限制，以本服務條款、本服務App及本服務網站所載之說明為準。</li>
		                <li>使用者申請使用本服務時，本服務將依使用者輸入之信用卡資料與收單機構進行授權驗證作業，並於驗證完成後7個營業日內完成取消授權作業，使用者不會因本授權驗證服務而負擔或支出任何費用。</li>
		                <li>使用者應妥善保管用於登入本服務之帳號、密碼、及為進行交易指示與加強身分驗證之支付密碼，不得以任何方式讓與、轉借或授權他人使用本人之登入身份、帳號、密碼、或支付密碼，亦不得以任何方式授權或同意他人使用本服務之帳號或其任何功能。以相應之帳號、密碼、即支付密碼登入本服務後所為之行為及交易指示，視為使用者本人之行為；因使用者之行為（包括作為及不作為）致第三人取得其帳號、密碼或支付密碼者，應由使用者自行負擔其責任及因此所生之損害。
		                </li>
		                <li>使用者發現第三人冒用、盜用或意圖非法取得使用者用於本服務之帳號、密碼或支付密碼等情形時，應立即變更密碼、支付密碼或通知本公司。經使用者通知、或本公司合理懷疑有前述異常狀況時，本公司得立即停止該帳號使用本服務，直至該異常狀況解除時止，本公司不負任何因停止帳號使用所造成之損害賠償責任。本公司並得要求使用者出具相關文件（包含但不限於：警政機關報案證明、切結書、身分證明文件等），以恢復該帳號於本服務之使用。使用者辦理帳號密碼被冒用手續前因下述情形所發生之損失，使用者需自行負擔：
		                    <ul class="upper-number">
		                        <li>(1) 消費者未妥善保管帳號密碼。</li>
		                        <li>(2) 消費者自行將帳號密碼提供與他人。</li>
		                        <li>(3) 消費者未使用第三方支付業者所提供的帳號安全機制。</li>
		                        <li>(4) 其他因消費者之故意或重大過失所致之事由。</li>
		                    </ul>
		                    使用者辦理帳號密碼被冒用手續完成後所發生之損失，由本公司負擔。
		                </li>
		                <li>調查使用者帳號密碼被盜用所生之費用，由本公司負擔。</li>
		                <li>本公司於發現第三人冒用或盜用使用者持有之本服務帳號、密碼或支付密碼等資料，或其他任何未經合法授權之情形時，應立即以雙方約定之方式通知使用者停止本服務並採取防範措施。</li>
		                <li>使用者發現綁定行動裝置遺失時，應立即使用本服務網站提供之掛失功能進行掛失操作，本公司將在現行技術可及之範圍內，停止該綁定行動裝置之使用者帳號操作權限，以維護使用者權益。</li>
		                <li>使用者應於資料異動時，即時更新留存於本服務之使用者資料，包含但不限於行動電話號碼、電子郵件、信用卡資訊、銀行帳戶資訊及聯絡方式等。</li>
		            </ol>
		        </li>
		        <br>
		        <li>服務內容
		            <ol>
		                <li>本服務僅係接受委託代為收取及代為支付交易款項、並依相關約定撥付代收款項予使用者，本公司並非銀行或金融機構，本服務亦非金融業務，無法直接對使用者提供金融轉帳服務，本服務所代收之款項亦非存款，本公司不支付任何利息或孳息。
		                </li>
		                <li>本服務所代收之款項，以新台幣為限，不接受新台幣以外之其他貨幣；本服務所代收款項之結算及支付亦以新台幣為之，使用者要求撥付代收款項時，所指定用以匯入款項之銀行存款帳戶(以下稱使用者指定帳戶)，以使用者在中華民國境內金融機構所開立之存款帳戶為限。
		                </li>
		                <li>本公司經由本服務所代收代付之交易款項，已委由中國信託銀行依照其與本公司所簽定的合約提供足額履約保證；履約保證方式如有變更，將隨時公佈於本服務App或本服務網站。本服務代使用者收受之款項，將儲存於本公司獨立帳戶，並獨立於本公司營運資金以外，除用以結算支付使用者使用本服務所代收之款項、依使用者要求代為支付其與第三人間之交易所應支付之款項、本服務之服務費用、使用者應付之其他費用及應償還之金額或賠償外，本公司不會使用於其他用途。
		                </li>
		                <li>本服務提供「一般會員」及「商業會員」收款功能，並提供「一般會員」以綁定行動裝置操作付款功能。</li>
		                <li>使用者委託本公司所代收之款項餘額，得委託本公司用以支付使用者與第三人間因交易所應支付之款項。</li>
		                <li>使用者委託本公司以其代收款項餘額轉付予與其交易之第三人時，以使用委託本公司代收之款項餘額為上限，若該筆支付交易之金額高於委託本公司代收之款項餘額時，得以信用卡支付不足之金額。</li>
		                <li>收款方使用本服務委託本公司代收交易款項者，應就其與交易相對人間之交易，依民法、消費者保護法等相關法令及其與交易相對人間之約定，負履行交易之義務，包括但不限於瑕疵擔保責任、保固及售後服務等。</li>
		                <li>致生交易款項之原因事實及其交易關係，僅存在於付款方與收款方之間，本服務僅依付款方與收款方之委託，代為處理交易款項之代收轉付事宜。</li>
		                <li>本公司不參與、介入、居間或媒合使用者間之交易或其商業經營。使用者與其交易相對人間所涉及之商品或服務之銷售、交易方式及條件、以及交易之履行或不履行（包括但不限於拒絕履行、遲延、未交付、瑕疵、錯誤、退換貨及退款）等，其權利義務關係僅存在於使用者與其交易相對人之間，並由使用者依相關法令及其與交易相對人間之約定互負權利、義務或責任。本服務受託代收或代付交易款項，不代表本公司對於各該交易之履行有任何明示或默示之保證或承諾。
		                </li>
		                <li>付款方應自行確認收款方是否依約履行商品或服務之交付，並應於必要時，利用本服務當時所提供之方式，通知本公司暫停撥付款項。</li>
		                <li>使用者間如因發生消費糾紛或爭議，應利用本服務當時所提供之方式通知本公司暫停撥付款項，並相互協商解決爭議、或向消保機關或法院等機構進行調解、和解或訴訟，再檢具相互協議證明、或司法機關或消保機關等有權機關之判決、調解、和解結果等，向本公司提出返還交易款項或支付交易款項之申請。本公司於接獲申請後，得要求提出相關證明文件，並得通知其交易相對人，如其交易相對人未於十個營業日內向本公司提出異議者，本公司得依其申請，返還或支付所扣留之交易款項，未於十個營業日內向本公司提出異議之交易相對人，事後不得再主張異議。
		                </li>
		                <li>使用者應由其本人利用本服務App或本服務網站進行本服務相關功能之操作。所有使用者於本服務App或本服務網站上執行之操作均由系統即時接收，並依相關服務指令即時或批次進行處理，除本服務App或本服務網站明確提供撤回、取消或修改該交易指示之功能外，使用者一經確認交易，即不得撤回、取消或修改已完成發送至本服務系統之服務指令或交易指示。
		                </li>
		                <li>本服務僅依其當時所建置之功能、使用方式、限制及條件，提供相關服務，本公司並得隨時新增、移除、或修改本服務之功能、使用方式、限制及條件之全部或一部。</li>
		                <li>關於「Pi 行動商店」功能
		                    <p>14.1 「Pi
		                        行動商店」功能係提供收款方得透過此功能刊載其所銷售商品或服務之說明內容、價格、圖片、及相關訊息，且接受付款方得透過本服務App向其訂購商品或服務，不代表本公司對於各該交易之履行有任何明示或默示之保證或承諾。相關交易內容是否確實履行，仍應由買賣雙方自行協調處理，概與本公司無涉。
		                    </p>
		                    <p>14.2 收款方藉由本服務於「Pi
		                        行動商店」所刊載之商品、說明內容、價格、圖片、及相關訊息，均係由使用者自行提供、上載、及發布，並由本服務系統顯示於本服務App或本服務網站，本公司並未事先過濾或審查其內容，對於其內容之真實性、合法性、即時性等，不負任何明示或默示之承諾或擔保。
		                    </p>
		                    <p>14.3 收款方應擔保對於商品經由「Pi
		                        行動商店」進行線上銷售，以及收款方所提供之所有商品及與商品有關之簡介、說明、資料、交易條件、價格、標示、圖片、名稱、商標及相關訊息等，收款方應擔保絕無違反相關法令規定之虞、亦無侵害第三人權益之虞之情形。商品本身、商品之線上銷售、商品之文案或廣告，依法令規定應申請許可或符合法定要件或應於網頁上揭露或載明相關資訊時，收款方應擔保於商品資訊刊載以前已取得許可或已符合法定要件或已揭露或載明相關資訊。如收款方違反本款之約定，對於因此所致本公司之損害應負損害賠償之責。
		                    </p>
		                    <p>14.4
		                        使用者所刊載之商品、說明內容、價格、圖片、及相關訊息等，如有違反法令、違背公序良俗、侵害第三人權益、交易不履行（包括但不限於拒絕履行、遲延、未交付、瑕疵、錯誤、退換貨及退款）或違反本服務條款之虞之情形，本公司得不經事先通知，直接加以移除、使之無法被存取、或採取其他限制性措施。
		                    </p>
		                    <p>14.5
		                        使用者同意並瞭解其透過本服務之點餐功能向交易相對方發出訂購商品之需求時，就表示使用者向交易相對方提出要約、願意依照本約定條款及相關頁面上所載明的約定內容、交易條件或限制，訂購該商品或服務，但不代表交易相對方必然同意該次交易內容。需待接到該需求之交易相對方以「Pi
		                        行動商店」App回覆接受訂單後，始確認交易內容。交易相對方應確實操作「Pi 行動商店」App，並善盡交付商品或服務之義務。</p>
		                </li>
		                <li>關於「資訊系統服務」功能
		                    <p>15.1「資訊系統服務」功能係由本公司提供資訊流之串接，藉由資訊串接之對接方可透過本服務取得使用者所同意提供留存於本服務App之會員各項資料，使用者可自行利用對接方所提供之服務進行交易與請款作業(如保險費用續保功能等陸續開發之各項資訊串接服務)。
		                    </p>
		                    <p>15.2
		                        此功能內本公司並未提供代收轉付之服務，對接方所提供之服務內如有涉及交易款項收付事宜，均係由與對接方與其合作之銀行所合作提供之服務，如使用者就該等服務內收付款所衍生之交易爭議，請逕洽對接方或提供收付款服務之服務方。
		                    </p>
		                    <p>15.3 使用者透過本功能所進行之交易如屬於代收服務，本公司將於每筆交易之註解處載明實際提供代收款項之服務方名稱。</p>
		                </li>
		                <li>關於「圖書館借閱證」功能
		                    <p>16.1 指本公司與各縣市立、私立圖書館合作之行動借閱證功能，使用者應已向前開合作之圖書館申辦借閱證且同意圖書館之個人資料維護聲明暨申請須知等同意事項方得使用此功能。</p>
		                </li>
		                <li>關於「拍享券」功能
		                    <p>17.1「拍享券」功能指使用者可透過本服務App之支付功能向票券提供方購買各類電子票券商品，並依電子票券內所載之內容向商品或服務之實際提供者或兌換商品或服務。</p>
		                    <p>17.2「拍享券」之電子票券提供方藉由本功能於「拍享券」所刊載之商品、說明內容、價格、圖片、及相關訊息，均係由「拍享券」之電子票券提供方自行提供、上載、發布，並由本服務系統顯示於本服務App或本服務網站，故本公司對於其內容之真實性、合法性、即時性等，不負任何明示或默示之承諾或擔保。
		                    </p>
		                    <p>17.3
		                        使用者同意並瞭解，使用者透過本服務App向「拍享券」電子票券票券提供方其進行購買電子票券或使用所購買之電子票券向商品或服務之實際提供者兌換商品等服務，不代表本公司對於各該交易之履行有任何明示或默示之保證或承諾。相關交易內容是否確實履行，仍應由使用者與「拍享券」之電子票券提供方或商品或服務之實際提供者自行協調處理，概與本公司無涉。
		                    </p>
		                </li>
		                <li>關於「電子發票載具功能」功能
		                    <p>18.1「電子發票載具功能」功能指使用者同意委由本公司代為向財政部電子發票整合服務平台申請手機條碼等電子發票載具服務，使用者於消費時出示載具條碼或使用本服務App進行交易時，本公司將提供載具資訊予給合作通路，供合作則通路上傳電子發票後儲存於發票載具內。
		                    </p>
		                    <p>18.2
		                        依照財政部手機條碼發票載具之通知規定，就留存於手機條碼發票載具內之電子發票，如與財政部所開立之統一發票中獎號碼有中獎之情形，將由財政部逕行中獎通知，本公司之「電子發票載具功能」未提供任何中獎通知之服務。
		                    </p>
		                </li>
		                <li>錯誤之處理及核對確認機制
		                    <p>19.1
		                        使用者透過本服務進行之交易，皆透過本服務電腦系統自動記錄的所有交易資料，並依交易紀錄明細為準，使用者得登入其帳號查看交易等紀錄，如遇爭議時，使用者同意應以本平台電子交易資料為認定標準。若使用者發現交易資料有誤，應立即通知本平台。因可歸責於使用者之事由而發生支付錯誤時，例如使用者輸入錯誤之金額或輸入錯誤之收款方，經使用者通知後，本公司將立即協助通知收款方，由使用者及收款方協商處理。
		                    </p>
		                    <p>19.2 使用者於支付交易款項前，本公司將提供使用者再確認機制，要求使用者透過該再確認機制驗證交易款項等支付指示是否正確。</p>
		                    <p>19.3 因可歸責於本公司之事由而發生支付錯誤時，本公司將於知悉時立即更正，並同時以本服務App之方式通知使用者。</p>
		                    <p>19.4 因不可歸責於使用者之事由而發生支付錯誤時，本公司將協助使用者更正，並提供其他必要之協助。</p>
		                </li>
		            </ol>
		        </li>
		        <br>
		        <li>信用卡收款約定事項
		            <ol>
		                <li>信用卡收款方式為本公司接受付款方以信用卡支付其委託本公司付款予收款方之交易款項。</li>
		                <li>付款方以信用卡支付交易款項時，付款方信用卡授權成功不代表已成功取得交易款項，信用卡交易及其款項請領、以及收款方得申請撥付款項之時間及方式等，應分別適用信用卡組織及收單機構之相關規範、以及本服務App或本服務網站當時所制定或修改之相關使用規範。
		                </li>
		                <li>收款方須秉持公平原則，不得對使用信用卡之付款方與使用現金或其他付款方式之付款方有差別待遇，除本服務所限制之收款額度外，亦不得因刷卡金額之大小而拒絕持卡人刷卡消費，且不得自行限制每筆簽帳交易最高及最低金額。
		                </li>
		                <li>根據信用卡組織規定，付款方因對交易商品或勞務之內容有疑義而透過收單機構、發卡機構、或國內外任一清算機構主張返還款項時，本公司得不另經收款方同意逕行退款，並自收款方暫留於本服務之款項中扣除，若收款方暫無留存於本服務之款項，則計入收款方之欠款，自動以未來所收之款項抵付，本公司並得要求收款方即時返還，且收款方不得針對該筆款項對本公司提出異議或主張任何權利。
		                </li>
		                <li>付款方經本服務以信用卡成功付款後，若有收款方同意付款方辦理退貨、取消交易、終止服務、變更貨品及其價格等相關情形時，於付款日後60日內，收款方應依照本服務當時所定之方式，以信用卡退刷形式辦理應退之款項，除經本公司以書面同意外，於付款日後60日內，收款方不得利用現金或其他方式直接退款予付款方。
		                </li>
		                <li>因非可歸責於本公司之事由（包括但不限於付款方否認交易等）所生之款項返還或款項無法收取情形，經本公司或發卡機構出具信用卡組織、銀行或付款方所出具之可資證明文件者，其損失由使用者負擔。</li>
		                <li>因付款方信用卡遭盜刷、冒刷所生之款項返還或款項無法收取情形，收款方應於收到本服務發出之各種通知時立即中止出貨。收款人不得因未及時查閱本服務發出之相關通知而主張其未受告知，亦不得因非本公司所得控制之事由（如：網際網路服務中斷、電信營運商服務異常等）而主張本公司之通知未送達。
		                </li>
		                <li>使用者若經司法機關、主管機關、國際組織、發卡機構或收單機構等單位通報為質疑或風險商店，或經本公司認定使用者為質疑或風險商店者，本公司得不經事先通知，凍結使用者於本服務之代收款項餘額，並暫時停止使用者使用本服務之一部或全部，如通報單位或有權機關調查確認使用者無質疑或風險之虞，本公司於知悉後將解除代收款項餘額之凍結，並恢復使用者使用本服務之權利，惟使用者不得請求凍結期間相關款項之利息或其他賠償。
		                </li>
		            </ol>
		        </li>
		        <br>
		        <li>線上合約
		            <ol>
		                <li>使用者同意以電子文件或訊息作為表示方法，以電子文件形式登載於本服務App或本服務網站之文件及內容，以及經由本服務發出之各種通知，其效力與書面文件相同。</li>
		                <li>使用者同意，使用者經由本服務App或本服務網站所為之相關操作及指示，均為對使用者有拘束力之意思表示或意思通知，且使用者為使用本服務之全部或一部時，應依照本服務App或本服務網站當時所制定或修改之方式、條件及限制為之，包括但不限於意思表示或意思通知之方式。
		                </li>
		            </ol>
		        </li>
		        <br>
		        <li>個人資料之保護
		            <ol>
		                <li>對於使用者之個人資料，本公司將依個人資料保護法等相關法令之規定，保護個人資料安全，除依法令規定或主管機關之要求、或為履行契約義務、或使用者可能涉及違反法令或侵害第三人權益、違反本服務條款或其他約定事項、或經使用者本人同意以外，本公司不會將使用者之個人資料及其交易訊息揭露或提供予第三人。關於個人資料保護及隱私權政策，請參閱本公司的隱私權聲明。
		                </li>
		                <li>為適切提供本服務，本公司將與相關交易網站及金融機構等第三人(以下稱協力廠商)合作或使用協力廠商所提供之服務，包括但不限於透過相關交易網站完成使用者註冊、以及透過金融機構完成使用者所委託之交易款項收付事宜，為核對或確認使用者身份、履行合約、完成或提供相關交易或服務之目的，您同意協力廠商得將所需之個人資料揭露或提供予本公司、本公司亦得將個人資料揭露或提供予協力廠商。
		                </li>
		                <li>使用者同意本公司基於與合作廠商共同開發新服務予使用者，得將因本服務所蒐集之使用者個人資料，提供予合作廠商於開發新服務時進行處理或利用</li>
		                <li>若使用者使用本服務，即表示同意並授權本公司得在必要範圍內，將使用者的部分個人資料揭露予與其交易相對人。</li>
		                <li>在下列情況下，本公司將查看使用者之個人資料，包含但不限於交易記錄及電信紀錄等，提供予相關政府機關、或主張其權益受侵害並提出合理事證之第三人，必要時並得暫停該使用者之帳號、存取權限、及對該使用者暫停提供本服務之全部或一部：
		                    <ul class="upper-number">
		                        <li>(1) 依法令規定、或依司法機關或其他相關政府機關之命令或要求；</li>
		                        <li>(2) 為執行本服務條款、或使用者有違反本服務條款或其他約定事項或侵害第三人權益之虞；</li>
		                        <li>(3) 為維護本服務系統之安全或經營者之合法權益；</li>
		                        <li>(4) 為保護其他使用者或其他第三人的合法權益；</li>
		                        <li>(5) 為維護本服務系統的正常運作。</li>
		                    </ul>
		                </li>
		            </ol>
		        </li>
		        <br>
		        <li>交易金額及次數限制
		            <ol>
		                <li>為維護交易安全，確保使用者權益，本服務得視需要對使用者訂定每筆、每日或每月收款或付款金額上限。</li>
		                <li>本服務得依使用者於本服務之使用情況，即時調整使用者於一定期間內之交易金額及次數限制。</li>
		                <li>若收款方交易金額及次數受到限制，因而無法接受交易相對人支付款項時，對於因此所生之交易不便利、或交易無法完成、或交易糾紛，不得以任何理由向本公司請求賠償其損害或補償其損失。</li>
		                <li>若付款方交易金額及次數受到限制，因而無法支付款項予其交易相對人時，對於因此所生之交易不便利、或交易無法完成、或交易糾紛，不得以任何理由向本公司請求賠償其損害或補償其損失。</li>
		            </ol>
		        </li>
		        <br>
		        <li>服務費用
		            <ol>
		                <li>使用者使用本服務時，本公司得依照使用者所使用之服務種類，向使用者收取相關服務費，各項服務費之項目、計算方式及金額，以本服務App及本服務網站相關網頁上所公佈及刊載者為準。對於使用者因使用本服務所生之服務費及其他應付費用或款項，使用者同意本公司得直接以使用者之信用卡進行簽帳付款，或自代收款項中扣除。
		                </li>
		                <li>關於本公司所收取之服務費，本公司將開立電子發票並儲存於該使用者之帳號內，使用者得於登入其帳號後，查詢及存取其電子發票。</li>
		                <li>使用者不得將其因使用本服務所生之手續費、服務費或其他費用轉嫁予其交易相對人，亦不得以任何理由或名目附加價款予其交易相對人；若有前述轉嫁或附加價款之行為時，使用者須立即將轉嫁或附加款退還予其交易相對人。
		                </li>
		                <li>本公司得隨時調整本服務之各項服務費，調整後之服務費將公告及刊載於本服務 App、本服務網站，且經由本服務 App
		                    通知使用者，並自其所定之生效日期生效。若使用者不同意調整後之服務費，應即停止使用本服務，如使用者繼續使用本服務，即視為已同意調整後之服務費。</li>
		            </ol>
		        </li>
		        <br>
		        <li>帳務結算及代收之款項餘額管理
		            <ol>
		                <li>代收款項之結算及撥款周期均依本公司就各該收款方式當時所定之時程處理。</li>
		                <li>本服務App及本服務網站提供交易資料查詢之期間為六個月，逾六個月之交易資料等訊息，應依本服務所定之方式，另行申請查閱，並負擔相關費用。</li>
		                <li>如法院、政府主管機關、或使用者之交易相對人或相關權利人，依本服務之相關約定或爭議處理流程，向本公司要求暫停撥付相關款項予使用者，或使用者之交易相對人或信用卡之持卡人透過發卡機構或收單機構主張拒付交易款項，使用者同意本公司得直接自使用者於本服務之款項餘額內保留相關款項，至該等爭議解決時止。如該等爭議款項已匯入使用者指定帳戶，使用者同意於接獲本公司通知後立即返還該等款項，本公司並得自使用者於本服務之款項餘額內扣還相當於該等交易金額之款項。
		                </li>
		                <li>依前項約定保留之款項，於其爭議解決且有適當證明時，由本公司依其爭議解決之結果，將相關款項返還或交付予使用者、使用者之交易相對人、或相關權利人。本公司返還或支付相關款項時，將優先以原支付方式返還該使用者、使用者之交易相對人、或相關權利人，其次為返還至該使用者、使用者之交易相對人、或相關權利人於本服務之帳戶內。若使用者、使用者之交易相對人、或相關權利人非本服務之使用者，本公司將以匯款方式處理，匯款手續費將依銀行之規定由銀行收取並由匯款金額中直接扣除。
		                </li>
		                <li>使用者要求撥付代收款項時，應先指定一個與使用者姓名(或名稱)及相關資料相符的使用者指定帳戶，且使用者指定帳戶之名稱及相關資料，必須與使用者留存於本服務的姓名(或名稱)及相關資料一致，為確保交易安全，本公司並得就使用者所提供之資料進行認證；若使用者尚未設定有效的使用者指定帳戶並留存相關資料、或所提供的使用者指定帳戶名稱及相關資料與使用者所留存的資料不一致、或無法就使用者所提供之資料完成認證，本公司得拒絕撥付款項予使用者、並暫時保留所代收之款項，至使用者提出與其所留存之資料相一致之使用者指定帳戶予本公司、或完成資料認證時止，必要時，本公司並得對該使用者拒絕或暫停提供本服務之全部或一部。
		                </li>
		                <li>使用者委託本公司代收之款項，得依本服務條款及本服務相關處理流程之約定，經由本服務要求本公司將代收款項撥付至使用者指定帳戶。撥付款項時，應先扣除匯款手續費、服務費及其他應付費用或款項、以及依法令或相關約定保留之金額。
		                </li>
		                <li>使用者要求撥付代收款項時，本公司得就其每次所得要求撥付之代收款項設定金額上限，相關金額上限依本公司當時公告於本服務App或本服務網站者為準，若使用者所要求撥付之金額超過限額，本服務將無法完成撥付程序。
		                </li>
		                <li>使用者要求撥付代收款項時，若本服務已依照使用者要求，以相關金融機構所定之方式完成應撥付款項之匯款程序、並經本公司所配合之金融機構回覆交易成功者，即視為本公司已履行支付之義務，該等應撥付款項入帳時間及得以動用之時間，依使用者帳戶所在之銀行或相關金融機構之規定。
		                </li>
		                <li>除本服務條款及本服務相關處理流程所定之方式外，本服務不對使用者提供其他結算、支付或撥付代收款項的方式。</li>
		            </ol>
		        </li>
		        <br>
		        <li>不當及違法行為之禁止
		            <ol>
		                <li>使用者須保證，利用本服務進行之收付款均係基於商品或服務之實質交易。</li>
		                <li>使用者不得利用本服務從事下列行為：
		                    <ol class="upper-alpha">
		                        <li>銷售法令或信用卡國際組織禁止或限制之物品或服務、或從事其他不法交易，包含但不限於下列項目：
		                            <ol class="lower-roman">
		                                <li>贓物或僅有使用權之商品。</li>
		                                <li>涉及色情、妨害風化或賭博性交易之商品或預儲金。</li>
		                                <li>遞延性商品，包含但不限於商品禮券、服務禮券、餐券、具遞延使用效果之會籍、套裝課程等商品或服務。</li>
		                                <li>非實際消費之簽帳融資墊付現款（俗稱刷卡換現金）或其他變相之融資。</li>
		                                <li>現金、股票、債券等有價證券，前述票券之直接發行者且經主管機關核准發行或銷售者不在此限；外幣(流通貨幣)之買賣、兌換及其他交易。</li>
		                                <li>其他法令禁止販售或違反社會善良風俗之商品。</li>
		                            </ol>
		                        </li>
		                        <li>從事任何詐欺、洗錢、色情、其他犯罪或非法行為。</li>
		                        <li>其所進行之交易、或其所交易之商品或服務、或其所使用之資料或文件等，涉及侵害本公司或第三人之合法權益，包括且不限於侵害商標權、著作權、專利權、營業秘密、或其他智慧財產權。</li>
		                        <li>從事於非經合法登記之營業項目。</li>
		                        <li>進行虛偽買賣或交易。</li>
		                        <li>冒用或不當使用第三人之銀行帳號或個人資料。</li>
		                        <li>儲存、散播病毒或其他足以破壞或干擾電腦系統或資料的程式，或從事破壞或干擾本服務系統正常運作之行為。</li>
		                        <li>從事於非本服務所預設目的之使用。</li>
		                        <li>其他本公司有正當理由認為不適當之行為。</li>
		                    </ol>
		                </li>
		                <li>使用者不得將P幣(PChome Point)以任何未經本公司事先同意之方式進行處置、移轉、交換或兌換為現金。</li>
		            </ol>
		        </li>
		        <br>
		        <li>消費者保護政策
		            <ol>
		                <li>付款方應自行確認交易商品是否已交付或服務是否已履行。若對交易有任何疑義，付款方應及時利用本服務系統與收款方聯繫，並於必要時向本公司提出對交易相對方之申訴，以維護自身權益。</li>
		                <li>收款方應詳實告知交易相對人商品及服務之明確說明、退貨處理政策等事項，以保障消費者權益。如因違反本項約定，而本公司遭受損害或損失時，應負賠償之責。</li>
		                <li>收款方應盡力解決其與交易相對人間之交易糾紛、爭議、索賠及申訴（包括以信用卡為付款方式時，付款方透過信用卡業務機構對交易商品或服務之內容有爭議或否認交易之情形），並應在知悉該等糾紛、爭議、索賠及申訴後一個月內解決爭議。
		                </li>
		                <li>使用者如因其與交易相對人之交易糾紛或爭議而對本公司主張權利受損，本公司得暫緩、中止相關爭議款項之撥付或返還，直至雙方之爭議獲得解決，本公司再行依照雙方協商結果、或法院或調解機構之終局判決或調解結果，撥付或返還相關爭議款項。使用者不得因該筆款項之暫緩、中止撥付而對本公司主張任何孳息或損害賠償。
		                </li>
		                <li>使用者對本服務若有任何服務需求，均得透過「客服」功能與本公司服務人員聯繫。</li>
		                <li>本公司資訊系統之保護措施或資訊系統之漏洞所生爭議，由本公司就該事實不存在負舉證責任。</li>
		                <li>因可歸責於本公司之事由導致第三人入侵本公司之資訊系統，而因此對使用者所造成之損害，由本公司負擔。</li>
		            </ol>
		        </li>
		        <br>
		        <li>附加服務約定
		            <ol>
		                <li>為便利使用者進行交易之資訊溝通，本服務另提供行動裝置訊息傳遞服務（以下稱「訊息服務」）。</li>
		                <li>本訊息服務無法做為緊急時向任一其他人、警政機關、消防機關或救難單位發出通報的功能，使用者應以行動電話撥出緊急報案電話、簡碼（如110、119）等方式進行必要之緊急通報動作。</li>
		                <li>本訊息服務並無法擔保所傳遞內容之即時性、可靠度。</li>
		                <li>使用者不得利用本訊息服務傳遞法令所禁止或限制之內容。</li>
		                <li>為確保使用者權益及符合法令規範，如經相關有權機關提出要求，本訊息服務將依法令規定，配合提供使用者資料及訊息內容予相關單位。</li>
		            </ol>
		        </li>
		        <br>
		        <li>服務障礙及異常
		            <ol>
		                <li>本公司於下列情形得暫停或中斷本服務之全部或一部，使用者不得因此請求賠償或補償：
		                    <ol class="upper-alpha">
		                        <li>對本服務相關軟硬體設備進行搬遷、更換、升級、保養或維修時；</li>
		                        <li>使用者有任何違反法令、本約定條款或本服務相關約定之情形；</li>
		                        <li>因第三人之行為、非本公司所得以控制之事項、或其他不可歸責於本公司之事由所致之服務暫停、中斷或無法正常運作；</li>
		                        <li>天災或其他不可抗力所致之服務暫停、中斷或無法正常運作。</li>
		                    </ol>
		                </li>
		                <li>本服務如因本公司軟硬體設備障礙、阻斷、或不正常運作，以致發生錯誤、遲滯、中斷或不能傳遞時，本公司應儘速排除相關障礙並恢復系統正常運作，但除本公司有故意或重大過失者外，本公司不負損害賠償責任。</li>
		                <li>若因使用者端伺服器、電腦、行動裝置等設備異常，而經本公司偵測認定有影響本服務對他人服務順暢之虞者，本公司得不經通知逕行中斷使用者與本服務間之網路連結，使用者不得向本公司主張任何異議或主張因此致生之損害賠償責任。
		                </li>
		                <li>本服務僅依系統當時之功能及現況提供服務，對於使用者之特定要求或需求，包括但不限於速度、安全性、可靠性、完整性、正確性及不會斷線或出錯等，本公司不作任何明示或默示之擔保或保證。</li>
		                <li>使用者同意並認知，網際網路服務系統穩定度涉及諸多因素，本公司將盡力維護本服務之妥善性，本公司不保證郵件、檔案或本服務發出之各種通知之傳送及儲存均係可靠且正確無誤，亦不保證所儲存或所傳送之郵件、檔案或本服務發出之各種通知之安全性、可靠性、完整性、正確性及不會斷線和出錯等，因郵件、檔案或本服務發出之各種通知傳送或儲存失敗、遺失或錯誤等所致之損害，除因本公司之故意或重大過失所致者外，本公司不負賠償責任。
		                </li>
		                <li>本服務系統會定期備份資料，但除因故意或重大過失所致者外，對於任何資料的失誤刪除、或備份錯誤或失敗等，本公司不負賠償責任。</li>
		                <li>使用者因使用本服務所受之直接或間接損害，如該等損害之發生係可歸責於本公司、且依契約約定或依相關法令規定應由本公司負賠償責任，本公司對於任一使用者之賠償責任，以本公司對該使用者就該項交易或服務原所得收取之服務費為上限。
		                </li>
		            </ol>
		        </li>
		        <br>
		        <li>合約變更及終止
		            <ol>
		                <li>本公司得修改或增刪本服務條款，且公布於本服務 App、本服務網站，並經由本服務 App
		                    通知使用者，使用者若拒絕接受該等修改或增刪，應立即停止使用本服務，如使用者繼續使用本服務，即視為使用者已同意修改或增刪後之約定內容。如本公司未於本服務App、本服務網站公告並通知消費者變更契約時，其變更無效。
		                </li>
		                <li>使用者有違反本服務條款之情事時，本公司得不經事先預告或通知，暫停、拒絕或終止使用者使用本服務。</li>
		                <li>有相當事證足認使用者涉及違反法令之行為、或使用者之收付款項經法院裁定或檢察官命令扣押、或使用者提交虛偽之身分認證資料經查證屬實者，本公司得暫停對使用者提供本服務之全部或一部、並得隨時終止契約。
		                </li>
		                <li>使用者得隨時通知本公司終止契約並停止使用本服務，但使用者欲終止契約並停止使用本服務時，應與本公司客服聯絡，並填寫相關切結書。本公司將在確認使用者無任何進行中或申訴中之收付款項、並與使用者結算完畢、且由使用者依結算結果結清提領餘額至使用者指定帳戶或由使用者依結算結果支付其所應支付與本公司之款項後，完成帳戶註銷程序。但本公司得為確保交易相對人之權益或為遵守相關法令之規定，在必要範圍內留存使用者之個人資料及交易資料。
		                </li>
		                <li>使用者依前項約定通知本公司終止契約並停止使用本服務後，若需再度使用本服務，需依本公司規定重新提出申請，本公司保留是否同意使用者再度使用本服務之權利。</li>
		                <li>因本服務條款任一約定停止使用本服務，就停止前之交易，仍需依本服務條款之規範履行全部權利義務，使用者依據本服務條款而負擔之權利義務，不因本服務之停止而消滅。</li>
		            </ol>
		        </li>
		        <br>
		        <li>其他約定事項
		            <ol>
		                <li>本服務條款如有疑義時，應為有利於消費者之解釋。本服務條款未約定之事項，依本服務App、本服務網站或本服務發出之各種通知上所刊載之相關處理流程、相關說明及使用規範等定之；本服務App、本服務網站或本服務發出之各種通知上所刊載之相關處理流程、說明、約定、使用辦法、注意事項及限制等，均視為本服務條款之一部分。
		                </li>
		                <li>使用者不因使用本服務而取得本公司任何智慧財產權之明示或默示之授權，且非事先經本公司書面同意，使用者不得使用、重製、或散布本服務App及本服務網站上任何形式的資料、商標、或標識。</li>
		                <li>使用者對本服務所提供之交易資訊、收付款額度及次數限制、非公開於本服務App及本服務網站之服務費用等資訊均負有保密義務，不得公開傳播或為任何形式之揭露。若因使用者違反此保密義務而致本公司受有損害，使用者應負賠償之義務。
		                </li>
		                <li>如本公司將本服務、及與本服務相關之權利義務關係及交易等合約移轉予第三人，則本服務之權利義務關係、相關交易、以及相關資料等，包括且不限於相關之權利義務關係等，亦得一併移轉予該第三人承受、並由該第三人繼續提供服務。
		                </li>
		                <li>本公司因主動發現、或接獲第三人之檢舉或通知，發現使用者有使用本服務之行為致侵害第三人之權益、或違反本服務條款或其相關規範、或違反相關法令之虞者，為維護本公司及使用者之權益、或為避免損害或爭議擴大，本公司得不經事先通知，暫停該使用者使用本服務之全部或一部，且得取消其使用資格。其涉及違反法令者，並得主動將使用者資料及相關交易資料或資訊，移送相關司法機關調查，或依法配合相關司法機關調查。
		                </li>
		                <li>使用者非事先經本公司書面同意，不得將因本合約所生之權利或義務之一部或全部轉讓予第三人，亦不得委由第三人代為履行。</li>
		                <li>本公司將採取適當措施以確保本服務資訊系統之資訊安全，並防止第三人非法入侵、取得、竄改、或損害其營業記錄或個人資訊。</li>
		            </ol>
		        </li>
		        <br>
		        <li>管轄法院及準據法
		            <ol>
		                <li>本服務條款以中華民國法令為準據法。</li>
		                <li>使用者與本公司間因本服務、或本服務條款所生之爭議，如因此而涉訟，除法令另有強制規定者應依其規定者外，以台灣台北地方法院為第一審管轄法院。</li>
		            </ol>
		        </li>
		    </ol>
		</article>                       
    </div>
    <footer class="ll-modal-footer">
      <button class="action">Accept</button>
      <button class="action">Decline</button>
    </footer>
  </article>
</div>
<div class="ll-modal" data-modal="trigger-2">
  <article class="content-wrapper">
    <button class="close"></button>
    <header class="ll-modal-header">
      <h2>This is a modal 2</h2>
    </header>
    <div class="content">
      <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui.</p>
    </div>
    <footer class="ll-modal-footer">
      <button class="action">Accept</button>
      <button class="action">Decline</button>
    </footer>
  </article>
</div>
<div class="ll-modal" data-modal="trigger-3">
  <article class="content-wrapper">
    <button class="close"></button>
    <header class="ll-modal-header">
      <h2>This is a modal 3</h2>
    </header>
    <div class="content">
      <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui.</p>
    </div>
    <footer class="ll-modal-footer">
      <button class="action">Accept</button>
      <button class="action">Decline</button>
    </footer>
  </article>
</div>

  <!-- footer -->  
  <footer id="aa-footer">
    <!-- footer bottom -->
    <div class="aa-footer-top">
     <div class="container">
        <div class="row">
        <div class="col-md-12">
          <div class="aa-footer-top-area">
            <div class="row">
              <div class="col-md-3 col-sm-6">
                <div class="aa-footer-widget">
                  <h3>Main Menu</h3>
                  <ul class="aa-footer-nav">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Our Services</a></li>
                    <li><a href="#">Our Products</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Contact Us</a></li>
                  </ul>
                </div>
              </div>
              <div class="col-md-3 col-sm-6">
                <div class="aa-footer-widget">
                  <div class="aa-footer-widget">
                    <h3>Knowledge Base</h3>
                    <ul class="aa-footer-nav">
                      <li><a href="#">Delivery</a></li>
                      <li><a href="#">Returns</a></li>
                      <li><a href="#">Services</a></li>
                      <li><a href="#">Discount</a></li>
                      <li><a href="#">Special Offer</a></li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="col-md-3 col-sm-6">
                <div class="aa-footer-widget">
                  <div class="aa-footer-widget">
                    <h3>Useful Links</h3>
                    <ul class="aa-footer-nav">
                      <li><a href="#">Site Map</a></li>
                      <li><a href="#">Search</a></li>
                      <li><a href="#">Advanced Search</a></li>
                      <li><a href="#">Suppliers</a></li>
                      <li><a href="#">FAQ</a></li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="col-md-3 col-sm-6">
                <div class="aa-footer-widget">
                  <div class="aa-footer-widget">
                    <h3>Contact Us</h3>
                    <address>
                      <p> 25 Astor Pl, NY 10003, USA</p>
                      <p><span class="fa fa-phone"></span>+1 212-982-4589</p>
                      <p><span class="fa fa-envelope"></span>dailyshop@gmail.com</p>
                    </address>
                    <div class="aa-footer-social">
                      <a href="#"><span class="fa fa-facebook"></span></a>
                      <a href="#"><span class="fa fa-twitter"></span></a>
                      <a href="#"><span class="fa fa-google-plus"></span></a>
                      <a href="#"><span class="fa fa-youtube"></span></a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
     </div>
    </div>
    <!-- footer-bottom -->
    <div class="aa-footer-bottom">
      <div class="container">
        <div class="row">
        <div class="col-md-12">
          <div class="aa-footer-bottom-area">
            <p>Designed by <a href="http://www.markups.io/">MarkUps.io</a></p>
            <div class="aa-footer-payment">
              <span class="fa fa-cc-mastercard"></span>
              <span class="fa fa-cc-visa"></span>
              <span class="fa fa-paypal"></span>
              <span class="fa fa-cc-discover"></span>
            </div>
          </div>
        </div>
      </div>
      </div>
    </div>
  </footer>
  <!-- / footer -->
  

  

  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="<c:url value='/js/bootstrap.js' />"></script>  
  <!-- SmartMenus jQuery plugin -->
  <script type="text/javascript" src="<c:url value='/js/jquery.smartmenus.js' />"></script>
  <!-- SmartMenus jQuery Bootstrap Addon -->
  <script type="text/javascript" src="<c:url value='/js/jquery.smartmenus.bootstrap.js' />"></script>  
  <!-- To Slider JS -->
  <script src="<c:url value='/js/sequence.js' />"></script>
  <script src="<c:url value='/js/sequence-theme.modern-slide-in.js' />"></script>  
  <!-- Product view slider -->
  <script type="text/javascript" src="<c:url value='/js/jquery.simpleGallery.js' />"></script>
  <script type="text/javascript" src="<c:url value='/js/jquery.simpleLens.js' />"></script>
  <!-- slick slider -->
  <script type="text/javascript" src="<c:url value='/js/slick.js' />"></script>
  <!-- Price picker slider -->
  <script type="text/javascript" src="<c:url value='/js/nouislider.js' />"></script>
  <!-- Custom js -->
  <script src="<c:url value='/js/custom.js' />"></script> 
	  
  <script src="<c:url value='/js/luke_js.js' />"></script> 
  
  <script>
	 var gReCAPTCHAchecked = false;
	 function captchaCallback(response) {
		 gReCAPTCHAchecked = true;
	 }
	 
	$(document).ready(function(){
		var checkFullnameFlag;
		var checkNicknameFlag;
		var checkQidFlag;
		var checkEmailFlag;
		var checkPwdFlag;
		oneClickSetValues();
		
	    $(".CheckStatus").hide();
	    $("#RegisterSubmit").attr("disabled", false);
	    let registerMsgDiv = $("#RegisterMsgDiv");
	    let registerMsg = $("#RegisterMsg");
	    registerMsgDiv.hide();
	    
	    checkName();
	    checkNickname();
	    checkQid();
	    checkEmail();
	    checkPassword();

	    
	    $("#fullname").change(checkName);
	    $("#nickname").change(checkNickname);
	    $("#qid").change(checkQid);
	    $("#email").change(checkEmail);
	    $("#password").change(checkPassword);
	    $("#password2").change(checkPassword);
	    //document.querySelector('#pwd').oninput = checkPwd;
	    //document.querySelector('#date1').oninput = checkDate1;
	    //document.querySelector('#name').onchange = submitCheck;
	    //document.querySelector('#pwd').onchange = submitCheck;
	    //document.querySelector('#date1').onchange = submitCheck;
	
	
	
	
	    //=============================================================================
	    //================================  FUNCTIONS  ================================
	    //=============================================================================
	    function oneClickSetValues(){
	    	$("#fullname").val("林林林");
	    	$("#nickname").val("Nickname 1");
	    	$("#qid").val("A111122222");
	    	$("#email").val("test@gmail.com");
	    	$("#password").val("123456!q");
	    	$("#password2").val("123456!q");
	    	checkFullnameFlag=true;
			checkNicknameFlag=true;
			checkQidFlag=true;
			checkEmailFlag=true;
			checkPwdFlag=true;
	    }
	    	
	
	    //1. 檢查姓名
	    function checkName() {
	        let nameVal = $("#fullname").val();
	        let nameErrorMsg = $("#fullnameErrorMsg");
			console.log("nameVal: "+nameVal);
	        let msg = "";
	        let check = true;
	        if (nameVal == "") {
	            msg = "不可為空白"; check = false;
	        }
	        else if (nameVal.length < 2) {
	            msg = "至少2個字以上"; check = false;
	        }
	        else {
	            
	            let matched1 = nameVal.match(/[,./;\[\]\\\|{}`~!@#$%^&*()\'+= ]+/g);
	            //if(!hasChinese()){
	            if (matched1) {
	                msg = "不可有特殊字元";
	                check = false;
	                console.log("check nickname: "+check);
	            }
// 	            for (i = 0; i < nameVal.length; i++) {
// 	                let charUnicode = nameVal.charCodeAt(i);
// 	                //if(!hasChinese()){
// 	                if (charUnicode < 0x4e00 || charUnicode > 0x9fff) {
// 	                    msg = "必須為中文字";
// 	                    check = false;
// 	                }
// 	            }
	        }
	
	        hideFullnameImgMsg();
	        console.log("check fullname: "+check);
	        if (!check) {
	            nameErrorMsg.html(msg);
	            $("#fullnameErrorImg").show();
	            $("#fullnameErrorMsg").show();
	        }
	        else {
	        	 $("#fullnameCheckImg").show();
	        }
	        checkFullnameFlag = check;
	    }
	
	    function hideFullnameImgMsg() {
	    	$("#fullnameCheckImg").hide();
	    	$("#fullnameErrorImg").hide();
	        $("#fullnameErrorMsg").hide();
	
	    }
	    
	  	//2. 檢查暱稱
	    function checkNickname() {
	        let nickVal = $("#nickname").val();
	        let nickCheckImg = $("#nicknameCheckImg");
	        let nickErrorMsg = $("#nicknameErrorMsg");
	        let nickErrorImg = $("#nicknameErrorImg");
	        let msg = "";
	        let check = true;
	        if (nickVal == "") {
	            msg = "不可為空白"; check = false;
	        }
	        else if ((nickVal.length < 5)||(nickVal.length > 30)) {
	            msg = "5個到30個字"; check = false;
	        }
	        else {
	            let matched1 = nickVal.match(/[,./;\[\]\\\|{}`~!@#$%^&*()\'+=]+/g);
	            //if(!hasChinese()){
	            if (matched1) {
	                msg = "不可有特殊字元";
	                check = false;
	                console.log("check nickname: "+check);
	            }
	        }
	
	        hideNicknameImgMsg();
	
	        if (!check) {
	        	nickErrorMsg.html(msg);
	            nickErrorMsg.show();
	            nickErrorImg.show();
	        }
	        else {
	        	nickCheckImg.show();
	        }
	        checkNicknameFlag = check;
	    }
	
	    function hideNicknameImgMsg() {
	    	 $("#nicknameCheckImg").hide();
	         $("#nicknameErrorMsg").hide();
	         $("#nicknameErrorImg").hide();
	
	    }
	
	  	//3. 檢查身份證字號
	    function checkQid() {
	        let qidVal = $("#qid").val();
	        let qidCheckImg = $("#qidCheckImg");
	        let qidErrorMsg = $("#qidErrorMsg");
	        let qidErrorImg = $("#qidErrorImg");
	        let msg = "";
	        let check = true;
	        if (qidVal == "") {
	            msg = "不可為空白"; check = false;
	        }
	        else if ((qidVal.length!=10)) {
	            msg = "身份證字號長度錯誤"; check = false;
	        }
	        else {
	        	
	        	 let matched1 = qidVal.match(/^[A-Z][1-2]\d{8}$/g);
	             if (!matched1) {
	                 msg = "身份證格式錯誤";
	                 check = false;
	                 console.log("check qid: "+check);
	             }
	        	
	        }
	
	        hideQidValImgMsg();
	
	        if (!check) {
	        	qidErrorMsg.html(msg);
	            qidErrorMsg.show();
	            qidErrorImg.show();
	        }
	        else {
	        	qidCheckImg.show();
	        }
	        checkQidFlag = check;
	    }
	
	    function hideQidValImgMsg() {
	    	 $("#qidCheckImg").hide();
	         $("#qidErrorMsg").hide();
	         $("#qidErrorImg").hide();
	
	    }
	
	  	//4. 檢查電子郵件
	    function checkEmail() {
	        let emailVal = $("#email").val();
	        let emailCheckImg = $("#emailCheckImg");
	        let emailErrorMsg = $("#emailErrorMsg");
	        let emailErrorImg = $("#emailErrorImg");
	        let msg = "";
	        let check = true;
	        if (emailVal == "") {
	            msg = "不可為空白"; check = false;
	        }
	        else {
	        	
	        	 let matched1 = emailVal.match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/g);
	             if (!matched1) {
	                 msg = "電子郵件格式錯誤";
	                 check = false;
	                 console.log("check email: "+check);
	             }
	        	
	        }
	
	        hideEmailValImgMsg();
	
	        if (!check) {
	        	emailErrorMsg.html(msg);
	        	emailErrorMsg.show();
	        	emailErrorImg.show();
	        }
	        else {
	        	emailCheckImg.show();
	        }
	        checkEmailFlag = check;
	    }
	
	    function hideEmailValImgMsg() {
	    	 $("#emailCheckImg").hide();
	         $("#emailErrorMsg").hide();
	         $("#emailErrorImg").hide();
	
	    }
	
	 	 //5. 檢查密碼
	    function checkPassword() {
	        let pwdVal = $("#password").val();
	        let pwdVal2 = $("#password2").val();
	        let pwdCheckImg = $("#passwordCheckImg");
	        let pwdErrorMsg = $("#passwordErrorMsg");
	        let pwdErrorImg = $("#passwordErrorImg");
	        let pwd2CheckImg = $("#password2CheckImg");
	        let pwd2ErrorMsg = $("#password2ErrorMsg");
	        let pwd2ErrorImg = $("#password2ErrorImg");
	        console.log("passwordVal: "+pwdVal);
	        console.log("passwordCheckImg: "+ pwdCheckImg.attr("id"));
	        console.log("password2Val: "+pwdVal);
	        console.log("password2CheckImg: "+ pwdCheckImg.attr("id"));
	        let msg = "";
	        let msg2 = "";
	        let check = true;
	        let check2 = true;
	      	
	        //password1的check
	        if (pwdVal == "") {
	            msg = "不可為空白"; check = false;
	        }
	        else if (pwdVal.length < 8) {
	            msg = "至少需要8個字"; check = false;
	        }
	        else if (pwdVal.length > 20) {
	            msg = "不可超過20個字"; check = false;
	        }
	        else {
	            //必須包含英文字母、數字、特殊字元[!@#$%^&*]
	            let pwdValLower = pwdVal.toLowerCase();
	            let matched1 = pwdValLower.match(/(.*[a-z].*)/g);
	            let matched2 = pwdValLower.match(/(.*[0-9].*)/g);
	            let matched3 = pwdValLower.match(/(.*[~!@#\$%\^\&*].*)/g);
	            if ((matched1 == null) || (matched2 == null) || (matched3 == null)) {
	                msg = "必須包含英文字母、數字、特殊字元[~!@#$%^&*]"; check = false;
	            }
	            console.log(matched1+":"+matched2+":"+matched2);
	        }
	        
	      	//password2的check
	        if (pwdVal2 == "") {
  	            msg2 = "不可為空白"; check2 = false;
  	        }
  	      	else if( pwdVal != pwdVal2 ){
  	        	msg2 = "密碼不一致"; check2 = false;
  	        }
	
	        hidePwdImgMsg();
	
	      	//password1的check結果動作
	        if (!check) {
	        	pwdErrorMsg.html(msg);
	        	pwdErrorMsg.show();
	        	pwdErrorImg.show();
	        }
	        else {
	        	pwdCheckImg.show();
	        }
	        checkPwdFlag = check;
	
	        //password2的check結果動作
	        if (!check2) {
	        	pwd2ErrorMsg.html(msg2);
	        	pwd2ErrorMsg.show();
	        	pwd2ErrorImg.show();
	        }
	        else {
	        	pwd2CheckImg.show();
	        }
	        checkPwd2Flag = check2;
	    }
	
	    function hidePwdImgMsg() {
	    	 $("#passwordCheckImg").hide();
	         $("#passwordErrorMsg").hide();
	         $("#passwordErrorImg").hide();
	         $("#password2CheckImg").hide();
	         $("#password2ErrorMsg").hide();
	         $("#password2ErrorImg").hide();
	    }
	
	   

	    $("#RegisterSubmit").click(function(e){
		    e.preventDefault();
		    let AgreementChecked = $("#acceptAgreement").is(":checked");
		    console.log("checkFullnameFlag: "+checkFullnameFlag +" checkNicknameFlag:" + checkNicknameFlag+" checkQidFlag:"  + checkQidFlag+" checkEmailFlag:"  + checkEmailFlag + " checkPwdFlag:" + checkPwdFlag + "checkPwd2Flag:" + checkPwd2Flag );
		    console.log($("#acceptAgreement").is(":checked"));
		    checkName();
		    checkNickname();
		    checkQid();
		    checkEmail();
		    checkPassword();
		    
		    let errorMSG = "<ul class='ll-err-list-msg' >";
		    
		    if(!checkFullnameFlag || !checkNicknameFlag || !checkQidFlag || !checkEmailFlag || !checkPwdFlag || !checkPwd2Flag )
		    {
		    	errorMSG += "<li>表單填寫有誤</li>";
		    }
		    else{
		    	registerMsgDiv.hide();
		    }
		    
		 	//check使用者服務條款
		    let acceptAgreementFlag = $("#acceptAgreement").is(":checked");
		    if(!acceptAgreementFlag){
		    	errorMSG += "<li>請同意以上條件及條款</li>";
		    	registerMsgDiv.show();
		    }
		    else{
		    	registerMsgDiv.hide();
		    }
		    //check Google ReCAPTCHA Code
		    console.log("gReCAPTCHAchecked:" + gReCAPTCHAchecked);

		    if (!gReCAPTCHAchecked){
		    	errorMSG += "<li>Google驗證碼驗證錯誤</li>";
		    	registerMsgDiv.show();
		    }
		    else{
		    	registerMsgDiv.hide();
		    }
		    errorMSG += "</ul>";
		    registerMsg.html(errorMSG);
		    
		    if (checkFullnameFlag && checkNicknameFlag && checkQidFlag && checkEmailFlag && checkPwdFlag && checkPwd2Flag && AgreementChecked && acceptAgreementFlag && gReCAPTCHAchecked) {
		        $("#RegisterForm").submit();
		    }
		    else {
		    	registerMsgDiv.show();
		    }
		       
		});
	    
	    
	    
	    //
	    // 使用者說明同意書
	    //
	    
	    const buttons = document.querySelectorAll('.trigger[data-modal-trigger]');

		for (let button of buttons) {
		  modalEvent(button);
		}
		
		function modalEvent(button) {
		  button.addEventListener('click', () => {
		    const trigger = button.getAttribute('data-modal-trigger');
		    const modal = document.querySelector('[data-modal='+trigger+']');
		    const contentWrapper = modal.querySelector('.content-wrapper');
		    const close = modal.querySelector('.close');
		
		    close.addEventListener('click', () => modal.classList.remove('open'));
		    modal.addEventListener('click', () => modal.classList.remove('open'));
		    contentWrapper.addEventListener('click', e => e.stopPropagation());
		
		    modal.classList.toggle('open');
		  });
		}
	    
	});
	
	
    </script>
  </body>
</html>