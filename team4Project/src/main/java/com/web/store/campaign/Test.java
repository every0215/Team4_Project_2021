package com.web.store.campaign;

import java.io.IOException;

import okhttp3.MediaType;
import okhttp3.MultipartBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class Test {

	public static void main(String[] args) throws IOException {
		OkHttpClient client = new OkHttpClient().newBuilder()
				  .build();
				MediaType mediaType = MediaType.parse("text/plain");
				RequestBody body = new MultipartBody.Builder().setType(MultipartBody.FORM)
				  .addFormDataPart("refresh_token", "{{refreshToken}}")
				  .addFormDataPart("client_id", "dedb17a7e8efe37")
				  .addFormDataPart("client_secret", "2a05dc6009cac1b0eaffd4eff7c99e10c0ee8216")
				  .addFormDataPart("grant_type", "refresh_token")
				  .build();
				Request request = new Request.Builder()
				  .url("https://api.imgur.com/oauth2/token")
				  .method("POST", body)
				  .build();
				Response response = client.newCall(request).execute();

	}

}
