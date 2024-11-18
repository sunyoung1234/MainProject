package com.proj.main.member.web;

import java.io.BufferedReader;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.proj.main.member.service.MemberService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.proj.main.FileUpload;
import com.proj.main.attach.service.AttachService;
import com.proj.main.attach.dto.AttachDTO;
import com.proj.main.member.dto.MemberDTO;

@Controller
public class MemberController {
    
    @Autowired
    MemberService memberService;

    @Autowired
    AttachService attachService;

    @Autowired
    FileUpload fileUpload;
    
    // �α��� �������� �̵�
    @RequestMapping("/loginView")
    public String loginView() {
        return "member/loginView";
    }

    // ȸ������ �������� �̵�
    @RequestMapping("/registView")
    public String registView() {
    	
    	
        return "member/registView";
    }

    // �������� ���� �� ���� ���Ǽ� �������� �̵�
    @RequestMapping("/agreementView")
    public String agreementView() {
    	return "member/agreementView"; 
    }
    
    // �׽�Ʈ ������ �̵�
    @RequestMapping("/testView")
    public String testView() {
    	return "member/testView";
    }
    
    // ȸ������ ó��
    @RequestMapping("/registDo")
    public String registDo(HttpServletRequest req, MultipartFile img, HttpSession session) throws Exception {
        // �Է°� �ޱ�
        String memId = req.getParameter("memId"); // ���� ����
        String memPw = req.getParameter("memPw");
        String memEmail = req.getParameter("memEmail");
        String memPhone = req.getParameter("memPhone");
        String memName = req.getParameter("memName");
        String memAddress = req.getParameter("memAddress");
        String jibun_address = req.getParameter("jibunAddress");
        String postcode = req.getParameter("postcode");
        String extraAddress = req.getParameter("extraAddress");

        String imgPath;
        try {
            // �̹��� ���ε�
            if (img != null && !img.isEmpty()) {
                AttachDTO attach = fileUpload.getAttachByMultipart(img);
                imgPath = attach.getAtchPath().substring(11); 
                attachService.insertAttach(attach); 
            } else {
                imgPath = "resources/assets/default-prof.jpg"; 
            }

            int defaultMemLevel = 0;
            MemberDTO member = new MemberDTO(memId, memPw, memEmail, memPhone, memName, imgPath, memAddress, jibun_address, postcode, extraAddress, defaultMemLevel);
            memberService.registMember(member);
        } catch (IOException e) {
            e.printStackTrace();
            return "redirect:/registView";
        }
        
        
        memberService.insertBuilding(memId);
       
        
        
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
        
        
        return "redirect:/loginView"; 
    }


    // ȸ�� ���� ���� ó��
    @RequestMapping("/memberUpdate")
    public String memberUpdate(HttpServletRequest req, MultipartFile img, HttpSession session) {
        // ���ǿ��� ȸ�� ������ �����ɴϴ�.
        MemberDTO member = (MemberDTO) session.getAttribute("login");
        
        // ������ ���� ��������
        String id = member.getMemId(); // ID�� ������ �� ����
        String pw = req.getParameter("memPw");
        String email = req.getParameter("memEmail");
        String phone = req.getParameter("memPhone");
        String name = req.getParameter("memName");
        String address = req.getParameter("memAddress");
        String jibunAddress = req.getParameter("jibunAddress");
        String postcode = req.getParameter("postcode");
        String extraAddress = req.getParameter("extraAddress");
        
        String imgPath; // �̹��� ��� �ʱ�ȭ
        
        try {
            // �̹����� ���ε��ϰ� ��θ� ����ϴ�.
            if (img != null && !img.isEmpty()) {
                AttachDTO attach = fileUpload.getAttachByMultipart(img);
                imgPath = attach.getAtchPath().substring(11); // ���ε�� �̹��� ���
                attachService.insertAttach(attach); // �̹��� ���� DB�� ����
            } else {
                // ���� �̹����� �����ϰų� �⺻ ������ �̹��� ���
                imgPath = member.getMemProfile() != null ? member.getMemProfile() : "resources/assets/default-prof.jpg";
            }
            
            int defaultMemLevel = 0; // �⺻ ȸ�� ���� ����
            MemberDTO updateMem = new MemberDTO(id, pw, name, phone, email, address, jibunAddress, postcode, extraAddress, imgPath, defaultMemLevel);
            memberService.updateMember(updateMem);
            session.setAttribute("login", updateMem);
        } catch (IOException e) {
            e.printStackTrace();
            return "redirect:/memEditView"; // ���� �߻� �� ȸ�� ���� �������� ���ư���
        }
        
        
        
        

        return "redirect:/memEditView"; // ���� �Ϸ� �� ȸ������ ���� �������� �����̷�Ʈ
    }

    // �α��� ó��
    @RequestMapping("/loginDo")
    public String loginDo(MemberDTO member, HttpSession session, boolean rememberId, Model model,
            HttpServletResponse response) {

        MemberDTO login = memberService.loginMember(member);
        
        if (login != null) {
            session.setAttribute("login", login); // ���ǿ� �α��� ���� ����
            String memId = login.getMemId();
            // ��Ű ó��
            if (rememberId) {
                // ��Ű ����
                Cookie cookie = new Cookie("rememberId", member.getMemId());
                cookie.setMaxAge(7 * 24 * 60 * 60); // 7�� ��ȿ
                response.addCookie(cookie);
            } else {
                // ��Ű ����
                Cookie cookie = new Cookie("rememberId", "");
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
            
            StringBuilder urlBuilder = new StringBuilder("http://192.168.0.51:5000/login"); /*URL*/
            HttpURLConnection conn = null;
            BufferedReader rd = null;
            try {
                // URL ���� �� ����
                URL url = new URL(urlBuilder.toString());
                conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("POST");
                conn.setDoOutput(true);
                conn.setRequestProperty("Content-type", "application/json");
                

                // JSON ������ ����
                String result = "{\"id\":\"" + memId + "\"}";
                System.out.println(memId);

                // ��û ������ ������ ����
                try (OutputStream os = conn.getOutputStream()) {
                    byte[] input = result.getBytes("utf-8");
                    os.write(input, 0, input.length);
                }

                // ���� ó��
                if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                    rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
                } else {
                    rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
                }


            } catch (IOException e) {
                // HTTP ��û ���� ���� ó��
                e.printStackTrace();  // �α׿� ���� ��� (�ʿ�� �α� Ȱ��)
                model.addAttribute("msg", "�������� ���ῡ ������ �߻��߽��ϴ�.");
                return "member/loginView"; // �α��� ���� �� �α��� �������� ���ư�
            } finally {
                // BufferedReader, HttpURLConnection ��ü ����
                if (rd != null) {
                    try {
                        rd.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
                if (conn != null) {
                    conn.disconnect();
                }
            }

            // Ȩ���� �����̷�Ʈ
            return "redirect:/";
        } else {
            model.addAttribute("msg", "���̵� Ȥ�� ��й�ȣ�� �ùٸ��� �ʽ��ϴ�.");
            return "member/loginView"; // �α��� ���� �� �α��� ��������
        }
    }
    
    // �α׾ƿ� ó��
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // ���� ��ȿȭ
        return "redirect:/"; // Ȩ���� �����̷�Ʈ
    }
    
    @ResponseBody
    @RequestMapping("/idCheck")
    public int idCheck(@RequestBody Map<String, String> data) {
        
        String id = data.get("id");
        int check = memberService.checkId(id);
        
        return check;
    }
    
    @RequestMapping("/mypage")
    public String mypage(HttpSession session, Model model){
        // ���ǿ��� �α��� ������ ������
        MemberDTO login = (MemberDTO) session.getAttribute("login");

        // �α��� ������ ������ �α��� �������� ���𷺼�
        if (login == null) {
            return "redirect:/loginView";  // �α��� �������� ���𷺼�
        }

        String memId = login.getMemId();
        model.addAttribute("member", login);

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

        return "member/mypage";  // ������ ����
    }
    // ȸ�� ���� ���� �������� �̵�
    @RequestMapping("/memEditView")
    public String memEditView(HttpSession session, Model model) {
        MemberDTO member = (MemberDTO) session.getAttribute("login");
        if (member != null) {
            model.addAttribute("member", member); // ���ǿ��� ȸ�� ������ �𵨿� �߰�
            return "member/memEditView"; // JSP �������� �̵�
        } else {
            return "redirect:/loginView"; // �α������� ���� ��� �α��� �������� �����̷�Ʈ
        }
    }
    
    @RequestMapping("/ocrView")
    public String ocrView() {
    	
    	
    	return "member/ocrView";
    }
    
    @RequestMapping("/productView")
    public String productView() {
    	
    	return "member/productView";
    }
    
    
   


}
