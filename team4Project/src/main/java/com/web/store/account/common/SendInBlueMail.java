package com.web.store.account.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import sendinblue.ApiClient;
import sendinblue.ApiException;
import sendinblue.Configuration;
import sendinblue.auth.ApiKeyAuth;
import sibApi.AccountApi;
import sibApi.TransactionalEmailsApi;
import sibModel.CreateSmtpEmail;
import sibModel.GetAccount;
import sibModel.SendSmtpEmail;
import sibModel.SendSmtpEmailSender;
import sibModel.SendSmtpEmailTo;

public class SendInBlueMail {
	private String emailTo;
	private String subject;
	private Properties properties;
	private String HtmlContent;
	
	public void SendEmail() {
		ApiClient defaultClient = Configuration.getDefaultApiClient();

		// Configure API key authorization: api-key
		ApiKeyAuth apiKey = (ApiKeyAuth) defaultClient.getAuthentication("api-key");
		apiKey.setApiKey("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");
		// Uncomment the following line to set a prefix for the API key, e.g. "Token"
		// (defaults to null)
		// apiKey.setApiKeyPrefix("Token");

		// Configure API key authorization: partnerKey
		ApiKeyAuth partnerKey = (ApiKeyAuth) defaultClient.getAuthentication("partner-key");
		partnerKey
				.setApiKey("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");
		// Uncomment the following line to set a prefix for the API key, e.g. "Token"
		// (defaults to null)
		// partnerKey.setApiKeyPrefix("Token");

		AccountApi apiInstance = new AccountApi();
		try {
			GetAccount result = apiInstance.getAccount();
			System.out.println(result);
		} catch (ApiException e) {
			System.err.println("Exception when calling AccountApi#getAccount");
			e.printStackTrace();
		}

		try {
			// AllRouteExamples obj = new AllRouteExamples();
			TransactionalEmailsApi api = new TransactionalEmailsApi();
			SendSmtpEmailSender sender = new SendSmtpEmailSender();
			sender.setEmail("Java20201019@gmail.com");
			sender.setName("滿滿大平台註冊認證碼");
			List<SendSmtpEmailTo> toList = new ArrayList<SendSmtpEmailTo>();
			SendSmtpEmailTo to = new SendSmtpEmailTo();
			to.setEmail(this.getEmailTo());
			to.setName("滿滿大平台");
			toList.add(to);
//            List<SendSmtpEmailCc> ccList = new ArrayList<SendSmtpEmailCc>();
//            SendSmtpEmailCc cc = new SendSmtpEmailCc();
//            cc.setEmail("example1@example.com");
//            cc.setName("Janice Doe");
//            ccList.add(cc);
//            List<SendSmtpEmailBcc> bccList = new ArrayList<SendSmtpEmailBcc>();
//            SendSmtpEmailBcc bcc = new SendSmtpEmailBcc();
//            bcc.setEmail("example2@example.com");
//            bcc.setName("John Doe");
//            bccList.add(bcc);
//            SendSmtpEmailReplyTo replyTo = new SendSmtpEmailReplyTo();
//            replyTo.setEmail("Java20201019@gmail.com");
//            replyTo.setName("John Doe");
//            SendSmtpEmailAttachment attachment = new SendSmtpEmailAttachment();
//            attachment.setName("test.jpg");
//            byte[] encode = Files.readAllBytes(Paths.get("local_filepath\\test.jpg"));
//            attachment.setContent(encode);
//            List<SendSmtpEmailAttachment> attachmentList = new ArrayList<SendSmtpEmailAttachment>();
//            attachmentList.add(attachment);
//			Properties headers = new Properties();
//			headers.setProperty("Some-Custom-Name", "unique-id-1234");
			Properties params = this.getProperties();
			SendSmtpEmail sendSmtpEmail = new SendSmtpEmail();
			sendSmtpEmail.setSender(sender);
			sendSmtpEmail.setTo(toList);
			// sendSmtpEmail.setCc(ccList);
			// sendSmtpEmail.setBcc(bccList);
			sendSmtpEmail.setHtmlContent(this.getHtmlContent());
			sendSmtpEmail.setSubject(this.getSubject());
			// sendSmtpEmail.setReplyTo(replyTo);
			// sendSmtpEmail.setAttachment(attachmentList);
			//sendSmtpEmail.setHeaders(headers);
			sendSmtpEmail.setParams(params);
			CreateSmtpEmail response = api.sendTransacEmail(sendSmtpEmail);
			System.out.println(response.toString());
		} catch (Exception e) {
			System.out.println("Exception occurred:- " + e.getMessage());
		}

	}

	public String getEmailTo() {
		return emailTo;
	}

	public void setEmailTo(String emailTo) {
		this.emailTo = emailTo;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Properties getProperties() {
		return properties;
	}

	public void setProperties(Properties properties) {
		this.properties = properties;
	}

	public String getHtmlContent() {
		return HtmlContent;
	}

	public void setHtmlContent(String htmlContent) {
		HtmlContent = htmlContent;
	}
}
