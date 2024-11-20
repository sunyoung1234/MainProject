package com.proj.main.electricity.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.proj.main.electricity.dto.ElectricityDTO;
import com.proj.main.electricity.service.ElectricityService;
import com.proj.main.member.dto.MemberDTO;

@Controller
public class ElectricityController {

	@Autowired
	ElectricityService electricityService;
	
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
       

        // �α��� ������ ������ �α��� �������� ���𷺼�
        if (login == null) {
            return "redirect:/loginView";  // �α��� �������� ���𷺼�
        }

        model.addAttribute("member",login);
        
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
            
            System.out.println(sb.toString());  // ���� ���� ���

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
	
}
