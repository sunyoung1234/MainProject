package com.proj.main.electricity.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.proj.main.buildingElec.dto.BuildingDTO;
import com.proj.main.buildingElec.service.BuildingService;
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
	
	@Autowired
	BuildingService buildingService;
	
	@RequestMapping("/ocrView")
    public String ocrTest(HttpSession session, Model model, ElectricityDTO electricity) {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
	       

        // �α��� ������ ������ �α��� �������� ���𷺼�
        if (login == null) {
            return "redirect:/loginView";  // �α��� �������� ���𷺼�
        }
		
		
		String memId = login.getMemId();
		
		ElectricityDTO use = electricityService.getElectricitylastMonth(memId);
		
		model.addAttribute("electricityUse", use);
		
		String elecDate = electricityService.getDate(memId);
		
		System.out.println(use);
		
		System.out.println(electricity);
		String predictDate = null;
		predictDate = predDate();
		System.out.println("��¥�Գ�?" + predictDate);
		
		
		System.out.println(elecDate);
		model.addAttribute("predictDate",predictDate);
		model.addAttribute("elecDate",elecDate);
    	
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
		use.setPredUse(memId);
		System.out.println("electricityUse : " + electricityUse);
		System.out.println("use : " + use);
		
		String predData = null;
		
		BufferedReader rd = null;
        HttpURLConnection conn = null;
        StringBuilder sb = new StringBuilder();
        
        try {
            // URL ���� �� HttpURLConnection ����
            StringBuilder urlBuilder = new StringBuilder("http://192.168.0.51:5000/post");
            URL url = new URL(urlBuilder.toString());
            conn = (HttpURLConnection) url.openConnection();
            
            // ��û ����
            conn.setRequestMethod("GET");  // GET ������� ��û
            conn.setRequestProperty("Content-type", "application/json");
            
         

            
            // ���� �ڵ忡 ���� ��Ʈ�� ó��
            if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }
            
            // ���� ���� �б�
            String line;
            while ((line = rd.readLine()) != null) {
                sb.append(line);
            }
            System.out.println(sb);
            
            int responseCode = conn.getResponseCode();
            System.out.println(responseCode);
            if(responseCode != 500) {
            	JSONObject jsonResponse = new JSONObject(sb.toString());
            	
                JSONArray predUse = jsonResponse.getJSONArray("pred_use");
                
                JSONArray preduse = new JSONArray();

                // pred_use �迭�� �� ���� �迭�� 1���� �迭�� ��ħ
                for (int i = 0; i < predUse.length(); i++) {
                    JSONArray innerArray = predUse.getJSONArray(i);  // ���� �迭 ����
                    preduse.put(innerArray.getDouble(0));  // ���� �迭�� ù ��° ���� 1���� �迭�� �߰�
                }
                
                System.out.println("preduse" + preduse);
                System.out.println("preduse" + preduse.get(1));
                predData = preduse.get(1).toString();
                
            }
            
            
            
        } catch (Exception e) {
            // ���� �߻� �� ó��
            e.printStackTrace();  // ���� ���
        } finally {
            try {
                if (rd != null) {
                    rd.close();  // BufferedReader �ݱ�
                }
                if (conn != null) {
                    conn.disconnect();  // ���� ����
                }
            } catch (Exception e) {
                e.printStackTrace();  // ���� �߻� �� ó��
            }
        }
		
        use.setPredUse(predData);
        electricityService.insertGetElectricityThisMonth(use);
		
		return "member/ocrView";
	}
	
	@RequestMapping("/electricityUseView")
	public String electricityUseView(HttpSession session, Model model) {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
       

        // �α��� ������ ������ �α��� �������� ���𷺼�
        if (login == null) {
            return "redirect:/loginView";  // �α��� �������� ���𷺼�
        }

        model.addAttribute("member",login);
        
        String memId = login.getMemId();
        
        MemberDTO member1 = memberService.getMemAddress(memId);
        
        model.addAttribute("member1",member1);
        
        List<MemBuildingElecDTO> buildingList = memberService.getMemBuildingElec(memId);
        
        List<String> use = electricityService.getPredUse(memId);
		
		model.addAttribute("predUseData", use);
		
		System.out.println(buildingList);
		
		if(buildingList.size() == 0) {
			return "electricityuse/electricityUseInput";
		}
        
		
        
        List<String> electricityUses = new ArrayList<>();
        List<String> useDates = new ArrayList<>();
        List<String> predDates = new ArrayList<>();
        
        for(MemBuildingElecDTO item : buildingList) {
        	electricityUses.add(item.getElectricityUse());
        	useDates.add(item.getUseDate());
        	predDates.add(item.getUseDate());
        }
        
        Collections.sort(useDates);
        
        System.out.println(electricityUses);
        System.out.println(useDates);
        
        // ������ ��¥ ��������
        String lastDateStr = predDates.get(predDates.size() - 1); // ������ ��¥ (��: 2024-07)

        // DateTimeFormatter�� ����Ͽ� "yyyy-MM" �������� ��¥ ó��
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");

        // ������ ��¥�� YearMonth�� �Ľ� (day ���� ���� �⸸)
        YearMonth lastDate = YearMonth.parse(lastDateStr, formatter);

        // 3���� �� ��¥ ����
        List<String> nextThreeMonths = new ArrayList<>();
        for (int i = 1; i <= 3; i++) {
            YearMonth nextDate = lastDate.plusMonths(i);  // 3������ ����
            nextThreeMonths.add(nextDate.format(formatter));  // "yyyy-MM" �������� ��ȯ�Ͽ� ����Ʈ�� �߰�
        }
        
        predDates.addAll(nextThreeMonths);

        // ��� ���
        System.out.println("���� ��¥��: " + useDates);
        System.out.println("��� ��¥��: " + predDates);

         
        
        model.addAttribute("useDate",useDates);
        model.addAttribute("predDates",predDates);
        model.addAttribute("elecUse",electricityUses);
        model.addAttribute("nextThreeMonths",nextThreeMonths);
        
        BufferedReader rd = null;
        HttpURLConnection conn = null;
        StringBuilder sb = new StringBuilder();
        
        try {
            // URL ���� �� HttpURLConnection ����
            StringBuilder urlBuilder = new StringBuilder("http://192.168.0.51:5000/post");
            URL url = new URL(urlBuilder.toString());
            conn = (HttpURLConnection) url.openConnection();
            
            // ��û ����
            conn.setRequestMethod("GET");  // GET ������� ��û
            conn.setRequestProperty("Content-type", "application/json");
            
         

            
            // ���� �ڵ忡 ���� ��Ʈ�� ó��
            if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }
            
            // ���� ���� �б�
            String line;
            while ((line = rd.readLine()) != null) {
                sb.append(line);
            }
            System.out.println(sb);
            
            int responseCode = conn.getResponseCode();
            System.out.println(responseCode);
            if(responseCode != 500) {
            	JSONObject jsonResponse = new JSONObject(sb.toString());
                
                // JSON ���
                System.out.println(jsonResponse.toString(4));  // Pretty print
                System.out.println(jsonResponse.get("date_range"));
                System.out.println(jsonResponse.get("pred_use"));
                
                JSONArray predUse = jsonResponse.getJSONArray("pred_use");
                
                JSONArray preduse = new JSONArray();

                // pred_use �迭�� �� ���� �迭�� 1���� �迭�� ��ħ
                for (int i = 0; i < predUse.length(); i++) {
                    JSONArray innerArray = predUse.getJSONArray(i);  // ���� �迭 ����
                    preduse.put(innerArray.getDouble(0));  // ���� �迭�� ù ��° ���� 1���� �迭�� �߰�
                }
                
                
                System.out.println(sb.toString());  // ���� ���� ���
                model.addAttribute("predUse",preduse);
            }
            
            
            
        } catch (Exception e) {
            // ���� �߻� �� ó��
            e.printStackTrace();  // ���� ���
        } finally {
            try {
                if (rd != null) {
                    rd.close();  // BufferedReader �ݱ�
                }
                if (conn != null) {
                    conn.disconnect();  // ���� ����
                }
            } catch (Exception e) {
                e.printStackTrace();  // ���� �߻� �� ó��
            }
        }
		
		
		return "electricityuse/electricityUseView";
	}
	
	@RequestMapping("/electricityUseInput")
	public String electricityUseInput(){
		
		return "electricityuse/electricityUseInput";
	}
	
	@RequestMapping("/saveElec")
	public String saveElec(@RequestParam("electricityUse[]") List<String> electricityUse[], @RequestParam("months[]") List<String> months[], HttpSession session) {
		
		MemberDTO member = (MemberDTO)session.getAttribute("login");
		String memAddress = member.getJibunAddress();
		String memId = member.getMemId();
		
		BuildingDTO building = new BuildingDTO();
		
        
        for(int i = 0; i < electricityUse.length; i++) {
        	building.setBuildingAddress(memAddress);
        	building.setElectricityUse(electricityUse[i].get(0));
        	building.setUseDate(months[i].get(0));
        	System.out.println(building);
        	buildingService.newInsertInfo(building);
        }
        
        memberService.insertBuilding(memId);
        
		
		return "electricityuse/electricityUseInput";
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
		// ���� ���� �б�
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        
        System.out.println(sb.toString());  // ���� ���� ���
        System.out.println(sb);  // ���� ���� ���
        
        String text = sb.toString(); // �ؽ�Ʈ�� Unicode ����

        // ���� ǥ������ ����Ͽ� ���ڸ� ���� (��ħǥ ����)
        Pattern pattern = Pattern.compile("[0-9]+");  // ���ڸ� ����
        Matcher matcher = pattern.matcher(text);

        // ���ڵ��� �̾�ٿ� �ϳ��� ���ڿ��� ����
        StringBuilder result2 = new StringBuilder();
        while (matcher.find()) {
            result2.append(matcher.group());
        }

        // ��� ���
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
	
	@RequestMapping("/predData")
	public String predDate() {
		BufferedReader rd = null;
        HttpURLConnection conn = null;
        StringBuilder sb = new StringBuilder();
        
        String predData = null;
        
        try {
            // URL ���� �� HttpURLConnection ����
            StringBuilder urlBuilder = new StringBuilder("http://192.168.0.51:5000/post");
            URL url = new URL(urlBuilder.toString());
            conn = (HttpURLConnection) url.openConnection();
            
            // ��û ����
            conn.setRequestMethod("GET");  // GET ������� ��û
            conn.setRequestProperty("Content-type", "application/json");
            
         

            
            // ���� �ڵ忡 ���� ��Ʈ�� ó��
            if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }
            
            // ���� ���� �б�
            String line;
            while ((line = rd.readLine()) != null) {
                sb.append(line);
            }
            System.out.println(sb);
            
            int responseCode = conn.getResponseCode();
            System.out.println(responseCode);
            if(responseCode != 500) {
            	JSONObject jsonResponse = new JSONObject(sb.toString());
            	
                JSONArray predUse = jsonResponse.getJSONArray("pred_use");
                
                JSONArray preduse = new JSONArray();

                // pred_use �迭�� �� ���� �迭�� 1���� �迭�� ��ħ
                for (int i = 0; i < predUse.length(); i++) {
                    JSONArray innerArray = predUse.getJSONArray(i);  // ���� �迭 ����
                    preduse.put(innerArray.getDouble(0));  // ���� �迭�� ù ��° ���� 1���� �迭�� �߰�
                }
                
                System.out.println("preduse" + preduse);
                System.out.println("preduse" + preduse.get(1));
                predData = preduse.get(1).toString();
                
            }
            
            
            
        } catch (Exception e) {
            // ���� �߻� �� ó��
            e.printStackTrace();  // ���� ���
        } finally {
            try {
                if (rd != null) {
                    rd.close();  // BufferedReader �ݱ�
                }
                if (conn != null) {
                    conn.disconnect();  // ���� ����
                }
            } catch (Exception e) {
                e.printStackTrace();  // ���� �߻� �� ó��
            }
        }
		
		
		return predData;
	}
	
}
