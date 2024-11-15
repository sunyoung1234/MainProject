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
	    String url = "http://localhost:5000/receive";  // Python ���� �ּ�

	    // HTTP ��� ����
	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);

	    // DTO�� JSON �������� �����ϱ� ���� HttpEntity�� ���α�
	    HttpEntity<UserBuildingDTO> requestEntity = new HttpEntity<>(userBuildingDTO, headers);

	    // POST ��û ������
	    ResponseEntity<String> response = restTemplate.exchange(
	        url, HttpMethod.POST, requestEntity, String.class
	    );

	    // ���� Ȯ��
	    System.out.println("Response: " + response.getBody());
	    
	    return response.getBody();
	}
	
}
