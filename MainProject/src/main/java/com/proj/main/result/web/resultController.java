package com.proj.main.result.web;

import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.proj.main.ReflectionMapper;
import com.proj.main.member.dto.MemberDTO;
import com.proj.main.result.dto.EnergyResultDTO;
import com.proj.main.result.dto.EnergyUsedDTO;
import com.proj.main.result.dto.UserBuildingDTO;
import com.proj.main.result.service.ResultService;

@Controller
public class resultController {
	
	@Autowired
	ResultService rs;
	
	
	@RequestMapping("/inputView")
	public String inputView() {
		
		return "result/inputView";
	}
	
	@RequestMapping("/resultView")
	public String resultView() {
		return "result/resultView";
	}
	
	@RequestMapping("/submitBuildingInfo")
	public String submitBuildingInfo(UserBuildingDTO ubd , HttpSession session , Model model) {
		
		String data = sendData(ubd);
		
        ObjectMapper objectMapper = new ObjectMapper();
        MemberDTO mem = (MemberDTO) session.getAttribute("login");
        String memId = mem.getMemId();
        String buildingName = ubd.getBuildingName();
        
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String b_id = buildingName + sdf.format(date);

        ubd.setMemId(memId);
        ubd.setBuildingId(b_id);
        
        rs.insertUserBuilding(ubd);
        
        try {
			EnergyResultDTO energyResult = ReflectionMapper.mapJsonToDto(data, EnergyResultDTO.class);
			energyResult.setMemId(memId);
			energyResult.setBuildingId(b_id);
			double pe = energyResult.getPrimaryEnergy();
			
			if(energyResult.getBuildingType().equals("주거")) {
				
				if(pe<60) {
					energyResult.setEnergyGrade("1+++등급");
				}else if(pe < 90) {
					energyResult.setEnergyGrade("1++등급");
				}else if(pe < 120) {
					energyResult.setEnergyGrade("1+등급");
				}else if(pe < 150) {
					energyResult.setEnergyGrade("1등급");
				}else if(pe < 190) {
					energyResult.setEnergyGrade("2등급");
				}else if(pe < 230) {
					energyResult.setEnergyGrade("3등급");
				}else if(pe < 270) {
					energyResult.setEnergyGrade("4등급");
				}else if(pe < 320) {
					energyResult.setEnergyGrade("5등급");
				}else if(pe < 370) {
					energyResult.setEnergyGrade("6등급");
				}else {
					energyResult.setEnergyGrade("7등급");
				}
				
			}else {
				
				if(pe<80) {
					energyResult.setEnergyGrade("1+++등급");
				}else if(pe < 140) {
					energyResult.setEnergyGrade("1++등급");
				}else if(pe < 200) {
					energyResult.setEnergyGrade("1+등급");
				}else if(pe < 260) {
					energyResult.setEnergyGrade("1등급");
				}else if(pe < 320) {
					energyResult.setEnergyGrade("2등급");
				}else if(pe < 380) {
					energyResult.setEnergyGrade("3등급");
				}else if(pe < 450) {
					energyResult.setEnergyGrade("4등급");
				}else if(pe < 520) {
					energyResult.setEnergyGrade("5등급");
				}else if(pe < 610) {
					energyResult.setEnergyGrade("6등급");
				}else {
					energyResult.setEnergyGrade("7등급");
				}
			}
			
			EnergyUsedDTO energyUsed = ReflectionMapper.mapJsonToDto(data, EnergyUsedDTO.class);
			energyUsed.setMemId(memId);
			energyUsed.setBuildingId(b_id);
			int w_energy = Integer.parseInt(energyUsed.getElecUse().replace(",",""));
			int s_energy = Integer.parseInt(energyUsed.getSolarEnergyProduction().replace(",",""));
		
			
			if(w_energy > s_energy) {
				energyUsed.setAnnualElecSave(energyUsed.getSolarEnergyProduction());
			}else {
				energyUsed.setAnnualElecSave("0");
			}
			
			rs.insertEnergyResult(energyResult);
			rs.insertEnergyUsed(energyUsed);
			
			
		} catch (Exception e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
        return "redirect:/resultView";
	}
	
	
	public String sendData(UserBuildingDTO userBuildingDTO) {
	    RestTemplate restTemplate = new RestTemplate();
	    restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(StandardCharsets.UTF_8));
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

	    return response.getBody();
	}
	
	
}