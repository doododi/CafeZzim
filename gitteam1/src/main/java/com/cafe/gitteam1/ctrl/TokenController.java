package com.cafe.gitteam1.ctrl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@RestController
public class TokenController {
	
	IamportClient client;
	
	public void setup() {
		String test_api_key = "2010333902159859";
		String test_api_secret = "8e05f41c2d497265da32f8ad6b9a5a94f61eb12e1686ead3bf97a01d43e8b77c063452eaa35539b0";
		client = new IamportClient(test_api_key, test_api_secret);
	}
	
	@RequestMapping(value="testToken")
	public ModelAndView testToken() {
		ModelAndView mv = new ModelAndView();
		String token = "";
		
		
		setup();
		
		try {
			IamportResponse<AccessToken> auth_response = client.getAuth();
			
			token = auth_response.getResponse().getToken();
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 :
				//TODO
				break;
			case 500 :
				//TODO
				break;
			}
		} catch (IOException e) {
			//서버 연결 실패
			e.printStackTrace();
		}
		testCancelPaymentAlreadyCancelledMerchantUid();
		mv.addObject("token",token);
		mv.setViewName("test/testToken");
		return mv;
	}
	
	@RequestMapping(value="getIamToken")
	public String getToken() throws Exception{

		

		// requestURL 아임퐅크 고유키, 시크릿 키 정보를 포함하는 url 정보 

		String _token = "";
		String requestURL = "https://api.iamport.kr/users/getToken";
		String imp_key 		=	URLEncoder.encode("2010333902159859", "UTF-8");
		String imp_secret	=	URLEncoder.encode("8e05f41c2d497265da32f8ad6b9a5a94f61eb12e1686ead3bf97a01d43e8b77c063452eaa35539b0", "UTF-8");

		JSONObject json = new JSONObject();
		json.put("imp_key", imp_key);
		json.put("imp_secret", imp_secret);
		

		try{

			String requestString = "";

			URL url = new URL(requestURL);

			HttpURLConnection connection = (HttpURLConnection) url.openConnection();

			connection.setDoOutput(true); 				

			connection.setInstanceFollowRedirects(false);  

			connection.setRequestMethod("POST");

			connection.setRequestProperty("Content-Type", "application/json");

			OutputStream os= connection.getOutputStream();

			os.write(json.toString().getBytes());

			connection.connect();

			StringBuilder sb = new StringBuilder(); 

			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {

				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));

			

				String line = null;  

				while ((line = br.readLine()) != null) {  

					sb.append(line + "\n");  

				}

				br.close();

				requestString = sb.toString();

			

			}

			os.flush();

			connection.disconnect();

			

			JSONParser jsonParser = new JSONParser();

			JSONObject jsonObj = (JSONObject) jsonParser.parse(requestString);

			

			if((Long)jsonObj.get("code")  == 0){

				JSONObject getToken = (JSONObject) jsonObj.get("response");

				System.out.println("getToken==>>"+getToken.get("access_token") );

				_token = (String)getToken.get("access_token");

			}

			

		}catch(Exception e){

			e.printStackTrace();

			_token = "";

		}

		return _token;

	}
	
	public void testCancelPaymentAlreadyCancelledMerchantUid() {
		String test_already_cancelled_merchant_uid = "merchant_1642930350237";
		CancelData cancel_data = new CancelData(test_already_cancelled_merchant_uid, false); //merchant_uid를 통한 전액취소
		
		try {
			IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
			
			Payment resp = payment_response.getResponse(); // 이미 취소된 거래는 response가 null이다
			
			System.out.println(payment_response.getMessage());
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 :
				//TODO
				break;
			case 500 :
				//TODO
				break;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	
}
