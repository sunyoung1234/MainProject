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
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.proj.main.ReflectionMapper;
import com.proj.main.map.dto.ZeroDTO;
import com.proj.main.map.service.MapService;
import com.proj.main.member.dto.MemberDTO;
import com.proj.main.member.dto.MyBuildingDTO;
import com.proj.main.member.service.MemberService;
import com.proj.main.result.dto.ApplyResultDTO;
import com.proj.main.result.dto.EnergyResultDTO;
import com.proj.main.result.dto.EnergyUsedDTO;
import com.proj.main.result.dto.TestResultDTO;
import com.proj.main.result.dto.UserBuildingDTO;
import com.proj.main.result.service.ResultService;

@Controller
public class resultController {
	
	@Autowired
	ResultService rs;
	@Autowired
	MemberService ms;
	@Autowired
	MapService mapService;
	
	
	@RequestMapping("/inputView")
	public String inputView() {
		
		return "result/inputView";
	}
	
	@RequestMapping("/applyView")
	public String applyView() {
		return "result/applyView";
	}
	
	@RequestMapping("/resultView")
    public String resultView(HttpSession session,Model model) {
        MemberDTO mem = (MemberDTO) session.getAttribute("login");
        String b_id = (String) session.getAttribute("bId");
        String memId = mem.getMemId();
        String addr = mem.getMemAddress() + mem.getExtraAddress();
       
        UserBuildingDTO userB = rs.getUserBuilding(b_id);
        EnergyResultDTO e_result = rs.getEnergyResult(b_id);
        EnergyUsedDTO e_used = rs.getEnergyUsed(b_id);
       
       
        model.addAttribute("address", addr);
        model.addAttribute("userB", userB);
        model.addAttribute("e_result", e_result);
        model.addAttribute("e_used", e_used);
       
       
       
       
        return "result/resultView";
    }
	
	@RequestMapping("/submitBuildingInfo")
	public String submitBuildingInfo(UserBuildingDTO ubd , HttpSession session , Model model) {
		
		String data = sendData(ubd);
		System.out.println(data);
		
        ObjectMapper objectMapper = new ObjectMapper();
        MemberDTO mem = (MemberDTO) session.getAttribute("login");
        String memId = mem.getMemId();
        String buildingName = ubd.getBuildingName();
        
        String b_id = ubd.getBuildingId();

        ubd.setMemId(memId);
        ubd.setBuildingId(b_id);
        
        session.setAttribute("bId", b_id);
        
        rs.insertUserBuilding(ubd);
        
        TestResultDTO tr = new TestResultDTO();
        tr.setMemId(memId);
        tr.setBuildingId(b_id);
        
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        
        tr.setTestDate(sdf.format(date));
        
        try {
			EnergyResultDTO energyResult = ReflectionMapper.mapJsonToDto(data, EnergyResultDTO.class);
			energyResult.setMemId(memId);
			energyResult.setBuildingId(b_id);
			double pe = energyResult.getPrimaryEnergy();
			
			if(energyResult.getBuildingType().equals("�ְ�")) {
				
				if(pe<60) {
					energyResult.setEnergyGrade("1+++���");
				}else if(pe < 90) {
					energyResult.setEnergyGrade("1++���");
				}else if(pe < 120) {
					energyResult.setEnergyGrade("1+���");
				}else if(pe < 150) {
					energyResult.setEnergyGrade("1���");
				}else if(pe < 190) {
					energyResult.setEnergyGrade("2���");
				}else if(pe < 230) {
					energyResult.setEnergyGrade("3���");
				}else if(pe < 270) {
					energyResult.setEnergyGrade("4���");
				}else if(pe < 320) {
					energyResult.setEnergyGrade("5���");
				}else if(pe < 370) {
					energyResult.setEnergyGrade("6���");
				}else {
					energyResult.setEnergyGrade("7���");
				}
				
			}else {
				
				if(pe<80) {
					energyResult.setEnergyGrade("1+++���");
				}else if(pe < 140) {
					energyResult.setEnergyGrade("1++���");
				}else if(pe < 200) {
					energyResult.setEnergyGrade("1+���");
				}else if(pe < 260) {
					energyResult.setEnergyGrade("1���");
				}else if(pe < 320) {
					energyResult.setEnergyGrade("2���");
				}else if(pe < 380) {
					energyResult.setEnergyGrade("3���");
				}else if(pe < 450) {
					energyResult.setEnergyGrade("4���");
				}else if(pe < 520) {
					energyResult.setEnergyGrade("5���");
				}else if(pe < 610) {
					energyResult.setEnergyGrade("6���");
				}else {
					energyResult.setEnergyGrade("7���");
				}
			}
			tr.setEnergyGrade(energyResult.getEnergyGrade());
			
			EnergyUsedDTO energyUsed = ReflectionMapper.mapJsonToDto(data, EnergyUsedDTO.class);
			energyUsed.setMemId(memId);
			energyUsed.setBuildingId(b_id);
			int w_energy = Integer.parseInt(energyUsed.getElecUse().replace(",",""));
			int g_energy = Integer.parseInt(energyUsed.getGasUse().replace(",",""));
			int s_energy = Integer.parseInt(energyUsed.getSolarEnergyProduction().replace(",",""));
			
			int total_energy = w_energy + g_energy;
			double ratio = (double) s_energy / total_energy * 100;
			
			tr.setEnergyIndependenceRate((int) Math.round(ratio) + "");
			
			if(tr.getEnergyGrade().equals("1+++���") || tr.getEnergyGrade().equals("1++���")) {
				if(ratio>=0 && ratio<20) {
					tr.setZebGrade(6);
				}else if(ratio < 40) {
					tr.setZebGrade(5);
				}else if(ratio < 60) {
					tr.setZebGrade(4);
				}else if(ratio < 80) {
					tr.setZebGrade(3);
				}else if(ratio < 100) {
					tr.setZebGrade(2);
				}else {
					tr.setZebGrade(1);
				}
			}else {
				tr.setZebGrade(6);
			}
			
			System.out.println(tr);
			
			MyBuildingDTO mybuilding = new MyBuildingDTO();
			mybuilding.setBuildingId(tr.getBuildingId());
			mybuilding.setZebLevel(tr.getZebGrade());
			
			ms.updateZebLev(mybuilding);
			
			if(w_energy > s_energy) {
				energyUsed.setAnnualElecSave(energyUsed.getSolarEnergyProduction());
			}else {
				energyUsed.setAnnualElecSave("0");
			}
			System.out.println(energyUsed);
			rs.insertEnergyResult(energyResult);
			rs.insertEnergyUsed(energyUsed);
			rs.insertTestResult(tr);
	        
			
		} catch (Exception e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
        return "redirect:/resultView";  
	}
	
	
	public String sendData(UserBuildingDTO userBuildingDTO) {
	    RestTemplate restTemplate = new RestTemplate();
	    restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(StandardCharsets.UTF_8));
	    String url = "http://192.168.0.51:5000/receive";  // Python ���� �ּ�
	    // HTTP ��� ����
	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);

	    // DTO�� JSON �������� �����ϱ� ���� HttpEntity�� ���α�
	    HttpEntity<UserBuildingDTO> requestEntity = new HttpEntity<>(userBuildingDTO, headers);

	    // POST ��û ������
	    ResponseEntity<String> response = restTemplate.exchange(
	        url, HttpMethod.POST, requestEntity, String.class
	    );

	    return response.getBody();
	}
	
	@RequestMapping("/applyResult") 
	public String applyResult(ApplyResultDTO ar, ZeroDTO zero) {
	
		rs.applyResult(ar);
		MyBuildingDTO mb = new MyBuildingDTO();
		
		mb.setBuildingId(ar.getBuildingId());
		
		rs.updateApplyStatus(ar.getBuildingId());
		
		ms.updateZebTestYn(mb);
		
		
		if(ar.getApproveYn().equals("����")) {
			MyBuildingDTO myBuilding = ms.getMyBuildingsByBuildingId(ar.getBuildingId());
			
			zero.setMemId(myBuilding.getMemId());
			zero.setBuildingAddress(myBuilding.getRoadAddress());
			
			if(myBuilding.getResidentialType().equals("�ְ�")) {
				zero.setBuildingDivision("�ְſ�");
				zero.setBuildingUse("�ְſ�");
			}else {
				zero.setBuildingDivision("�ְſ� �̿�");
				zero.setBuildingUse("�繫��");
			}
			zero.setBuildingName(myBuilding.getBuildingName());
			
			zero.setRegion(myBuilding.getRoadAddress().substring(0, 2));
			zero.setApplicantOrganization("�׸��ַ��");
			zero.setTotalArea(myBuilding.getSquareMeterArea());
			zero.setZeroLevel("ZEB "+myBuilding.getZebLevel());
			zero.setMeasureMethod("���ڽ� ���ݰ�ħ�跮��");
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			zero.setCertificateDate(sdf.format(new Date()));
			
			System.out.println(zero);
			mapService.addZeroBuilding(zero);
		}
		
		return "redirect:/applyStatusView";
	}
	
}