package com.proj.main.result.web;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import com.proj.main.result.dto.UserBuildingDTO;

@Controller
public class resultController {
	
	
	@RequestMapping("/inputView")
	public String inputView(UserBuildingDTO ubd) {
		
		return "result/inputView";
	}
	
	@RequestMapping("/submitBuildingInfo")
	public String submitBuildingInfo(UserBuildingDTO ubd) {
		
		 
		
		String result2 = sendUserBuildingData(ubd);

	    System.out.println(result2);
		
		return "result/inputView";
	}
	
	
	
	public String sendUserBuildingData(UserBuildingDTO userBuildingDTO) {
	    RestTemplate restTemplate = new RestTemplate();
	    String url = "http://localhost:5000/receive";  // Python 서버 주소

	    // HTTP 헤더 설정
	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);

	    // DTO를 JSON 형식으로 전송하기 위해 HttpEntity로 감싸기
	    HttpEntity<UserBuildingDTO> requestEntity = new HttpEntity<>(userBuildingDTO, headers);

	    // POST 요청 보내기
	    ResponseEntity<String> response = restTemplate.exchange(
	        url, HttpMethod.POST, requestEntity, String.class
	    );

	    // 응답 확인
	    System.out.println("Response: " + response.getBody());
	    
	    return response.getBody();
	}
	
}
