package com.web.store.utils;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Base64;

public class Transcode {
	
	//傳入位元組陣列、檔案名稱，回傳base64編碼的data URI 
	public static String bytesToBase64URI(byte[] bytes,String fileName) throws IOException {
		StringBuffer responseMsg = new StringBuffer();
		String mimeType = Files.probeContentType(new File(fileName).toPath());
		String prefix = "data:" + mimeType + ";base64,";
		responseMsg.append(prefix);
		Base64.Encoder be = Base64.getEncoder();	
		responseMsg.append(new String(be.encode(bytes)));
		
		return responseMsg.toString();
	}
}
