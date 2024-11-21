package com.proj.main.electricity.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.proj.main.electricity.dto.ElectricityDTO;
import com.proj.main.electricity.service.ElectricityService;
import com.proj.main.member.dto.MemBuildingElecDTO;
import com.proj.main.member.dto.MemberDTO;
import com.proj.main.member.service.MemberService;


@Controller
public class ElectricityController {

	@Autowired
	ElectricityService electricityService;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/ocrView")
    public String ocrTest(HttpSession session, Model model, ElectricityDTO electricity) {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
	       

        // 로그인 정보가 없으면 로그인 페이지로 리디렉션
        if (login == null) {
            return "redirect:/loginView";  // 로그인 페이지로 리디렉션
        }
		
		
		String memId = login.getMemId();
		
		ElectricityDTO use = electricityService.getElectricitylastMonth(memId);
		
		model.addAttribute("electricityUse", use);
		
		
		System.out.println(use);
		
		System.out.println(electricity);
    	
    	return "member/ocrView";
    }
	
	@ResponseBody
	@RequestMapping("ocrInsert")
	public String ocrInsert(@RequestBody String electricityUse, HttpSession session) {
		
		System.out.println(electricityUse.substring(15));
		MemberDTO member = (MemberDTO)session.getAttribute("login");
		String memId = member.getMemId();
		
		ElectricityDTO use = electricityService.getElectricitylastMonth(memId);
		use.setElectricityUse(electricityUse.substring(15));
		System.out.println("electricityUse : " + electricityUse);
		System.out.println("use : " + use);
		electricityService.insertGetElectricityThisMonth(use);
		
		
		
		return "member/ocrView";
	}
	
	@RequestMapping("/electricityUseView")
	public String electricityUseView(HttpSession session, Model model) {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
       

        // 로그인 정보가 없으면 로그인 페이지로 리디렉션
        if (login == null) {
            return "redirect:/loginView";  // 로그인 페이지로 리디렉션
        }

        model.addAttribute("member",login);
        
        String memId = login.getMemId();
        
        List<MemBuildingElecDTO> buildingList = memberService.getMemBuildingElec(memId);
        
        List<String> electricityUses = new ArrayList<>();
        List<String> useDates = new ArrayList<>();
        
        for(MemBuildingElecDTO item : buildingList) {
        	electricityUses.add(item.getElectricityUse());
        	useDates.add(item.getUseDate());
        }
        
        Collections.sort(useDates);
        
        System.out.println(electricityUses);
        System.out.println(useDates);
        

        
        
        model.addAttribute("useDate",useDates);
        model.addAttribute("elecUse",electricityUses);
        
        BufferedReader rd = null;
        HttpURLConnection conn = null;
        StringBuilder sb = new StringBuilder();
        
        try {
            // URL 생성 및 HttpURLConnection 열기
            StringBuilder urlBuilder = new StringBuilder("http://192.168.0.51:5000/post");
            URL url = new URL(urlBuilder.toString());
            conn = (HttpURLConnection) url.openConnection();
            
            // 요청 설정
            conn.setRequestMethod("GET");  // GET 방식으로 요청
            conn.setRequestProperty("Content-type", "application/json");
            
         

            
            // 응답 코드에 따른 스트림 처리
            if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }
            
            // 응답 내용 읽기
            String line;
            while ((line = rd.readLine()) != null) {
                sb.append(line);
            }
            
            JSONObject jsonResponse = new JSONObject(sb.toString());
            
            // JSON 출력
            System.out.println(jsonResponse.toString(4));  // Pretty print
            System.out.println(jsonResponse.get("date_range"));
            System.out.println(jsonResponse.get("pred_use"));
            
            JSONArray predUse = jsonResponse.getJSONArray("pred_use");
            
            JSONArray preduse = new JSONArray();

            // pred_use 배열의 각 내부 배열을 1차원 배열로 펼침
            for (int i = 0; i < predUse.length(); i++) {
                JSONArray innerArray = predUse.getJSONArray(i);  // 내부 배열 추출
                preduse.put(innerArray.getDouble(0));  // 내부 배열의 첫 번째 값을 1차원 배열에 추가
            }
            
            System.out.println(preduse);
            
            
            System.out.println(sb.toString());  // 서버 응답 출력
            model.addAttribute("predUse",preduse);
            
        } catch (Exception e) {
            // 예외 발생 시 처리
            e.printStackTrace();  // 예외 출력
        } finally {
            try {
                if (rd != null) {
                    rd.close();  // BufferedReader 닫기
                }
                if (conn != null) {
                    conn.disconnect();  // 연결 종료
                }
            } catch (Exception e) {
                e.printStackTrace();  // 예외 발생 시 처리
            }
        }
		
		
		return "electricityuse/electricityUseView";
	}
	
	@ResponseBody
    @RequestMapping("/uploadImage")
    public String uploadImage(@RequestBody String image, Model model) throws Exception {
    	
    	String uploadImage = image;
    	
    	StringBuilder urlBuilder = new StringBuilder("http://192.168.0.51:5000/ocr");
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
		conn.setDoOutput(true);
		conn.setRequestProperty("Content-type", "application/json");
		
		System.out.println(uploadImage.substring(6));
		
		
		String result = "{\"uploadImage\":\"" + uploadImage.substring(6) + "\"}";
		
		try(OutputStream os = conn.getOutputStream()){
			byte[] input = result.getBytes("utf-8");
			os.write(input,0,input.length);
		}
		
		BufferedReader rd;

		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
		}
		
		StringBuilder sb = new StringBuilder();
		// 응답 내용 읽기
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        
        System.out.println(sb.toString());  // 서버 응답 출력
        System.out.println(sb);  // 서버 응답 출력
        
        String text = sb.toString(); // 텍스트에 Unicode 포함

        // 정규 표현식을 사용하여 숫자만 추출 (마침표 제외)
        Pattern pattern = Pattern.compile("[0-9]+");  // 숫자만 추출
        Matcher matcher = pattern.matcher(text);

        // 숫자들을 이어붙여 하나의 문자열로 생성
        StringBuilder result2 = new StringBuilder();
        while (matcher.find()) {
            result2.append(matcher.group());
        }

        // 결과 출력
        System.out.println(result2.toString());
        String result3 = result2.toString();
        
        model.addAttribute("monthUse",result3);
        
    
		rd.close();
		conn.disconnect();
    	
    	return result3;
    }
	
	
	@RequestMapping("/updateModel")
	public String updateModel(HttpSession session) throws Exception {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		String memId = login.getMemId();
		
		StringBuilder urlBuilder = new StringBuilder("http://192.168.0.51:5000/regist"); /*URL*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setRequestProperty("Content-type", "application/json");
       
        BufferedReader rd;
        String result = "{\"id\":\"" + memId + "\"}";
       
        try(OutputStream os = conn.getOutputStream()){
            byte[] input = result.getBytes("utf-8");
            os.write(input,0,input.length);
        }
        
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
        }
        
        
        
        rd.close();
        conn.disconnect();
		
		return "redirect:/electricityUseView";
	}
	
}
