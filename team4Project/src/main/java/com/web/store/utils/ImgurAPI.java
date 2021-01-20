package com.web.store.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import org.json.*;

import okhttp3.*;

public class ImgurAPI {

	final static String CLIENTID = "558424e6a6908f5";
	final static String SERVER = "https://api.imgur.com";

	//傳入byte陣列，回傳圖片網址
	public static String upload(byte[] fileBytes, String fileName) {
		
		OkHttpClient client = new OkHttpClient().newBuilder().build();
		RequestBody image = RequestBody.create(fileBytes, MediaType.parse("image/*"));
		
		RequestBody body = new MultipartBody.Builder().setType(MultipartBody.FORM)
				.addFormDataPart("image", fileName, image)
				.addFormDataPart("name",fileName)
				.build();

		Request request = new Request.Builder().url(SERVER + "/3/image").method("POST", body)
				.addHeader("Authorization", "Client-ID " + CLIENTID).build();

		Response response = null;

		try {
			response = client.newCall(request).execute();
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}

		if (!response.isSuccessful()) {
			System.out.println(response.message());			
			return null;
		}

		StringBuffer buffer = new StringBuffer();

		try (BufferedReader br = 
				new BufferedReader(new InputStreamReader(response.body().byteStream()))) {
			
			String singleLine = "";
			if ((singleLine = br.readLine()) != "") {
				System.out.println(singleLine);
				buffer.append(singleLine);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		
		String json = buffer.toString();
		JSONObject jobj = new JSONObject(json);
		String link = jobj.getJSONObject("data").getString("link");
		
		return link;
		
	}
}
