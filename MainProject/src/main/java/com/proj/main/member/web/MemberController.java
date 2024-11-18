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
    
    // 로그인 페이지로 이동
    @RequestMapping("/loginView")
    public String loginView() {
        return "member/loginView";
    }

    // 회원가입 페이지로 이동
    @RequestMapping("/registView")
    public String registView() {
    	
    	
        return "member/registView";
    }

    // 개인정보 수집 및 제공 동의서 페이지로 이동
    @RequestMapping("/agreementView")
    public String agreementView() {
    	return "member/agreementView"; 
    }
    
    // 테스트 페이지 이동
    @RequestMapping("/testView")
    public String testView() {
    	return "member/testView";
    }
    
    // 회원가입 처리
    @RequestMapping("/registDo")
    public String registDo(HttpServletRequest req, MultipartFile img, HttpSession session) throws Exception {
        // 입력값 받기
        String memId = req.getParameter("memId"); // 여기 수정
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
            // 이미지 업로드
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


    // 회원 정보 수정 처리
    @RequestMapping("/memberUpdate")
    public String memberUpdate(HttpServletRequest req, MultipartFile img, HttpSession session) {
        // 세션에서 회원 정보를 가져옵니다.
        MemberDTO member = (MemberDTO) session.getAttribute("login");
        
        // 수정된 정보 가져오기
        String id = member.getMemId(); // ID는 변경할 수 없음
        String pw = req.getParameter("memPw");
        String email = req.getParameter("memEmail");
        String phone = req.getParameter("memPhone");
        String name = req.getParameter("memName");
        String address = req.getParameter("memAddress");
        String jibunAddress = req.getParameter("jibunAddress");
        String postcode = req.getParameter("postcode");
        String extraAddress = req.getParameter("extraAddress");
        
        String imgPath; // 이미지 경로 초기화
        
        try {
            // 이미지를 업로드하고 경로를 얻습니다.
            if (img != null && !img.isEmpty()) {
                AttachDTO attach = fileUpload.getAttachByMultipart(img);
                imgPath = attach.getAtchPath().substring(11); // 업로드된 이미지 경로
                attachService.insertAttach(attach); // 이미지 정보 DB에 저장
            } else {
                // 기존 이미지를 유지하거나 기본 프로필 이미지 사용
                imgPath = member.getMemProfile() != null ? member.getMemProfile() : "resources/assets/default-prof.jpg";
            }
            
            int defaultMemLevel = 0; // 기본 회원 레벨 설정
            MemberDTO updateMem = new MemberDTO(id, pw, name, phone, email, address, jibunAddress, postcode, extraAddress, imgPath, defaultMemLevel);
            memberService.updateMember(updateMem);
            session.setAttribute("login", updateMem);
        } catch (IOException e) {
            e.printStackTrace();
            return "redirect:/memEditView"; // 에러 발생 시 회원 수정 페이지로 돌아가기
        }
        
        
        
        

        return "redirect:/memEditView"; // 수정 완료 후 회원정보 수정 페이지로 리다이렉트
    }

    // 로그인 처리
    @RequestMapping("/loginDo")
    public String loginDo(MemberDTO member, HttpSession session, boolean rememberId, Model model,
            HttpServletResponse response) {

        MemberDTO login = memberService.loginMember(member);
        
        if (login != null) {
            session.setAttribute("login", login); // 세션에 로그인 정보 저장
            String memId = login.getMemId();
            // 쿠키 처리
            if (rememberId) {
                // 쿠키 생성
                Cookie cookie = new Cookie("rememberId", member.getMemId());
                cookie.setMaxAge(7 * 24 * 60 * 60); // 7일 유효
                response.addCookie(cookie);
            } else {
                // 쿠키 삭제
                Cookie cookie = new Cookie("rememberId", "");
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
            
            StringBuilder urlBuilder = new StringBuilder("http://192.168.0.51:5000/login"); /*URL*/
            HttpURLConnection conn = null;
            BufferedReader rd = null;
            try {
                // URL 연결 및 설정
                URL url = new URL(urlBuilder.toString());
                conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("POST");
                conn.setDoOutput(true);
                conn.setRequestProperty("Content-type", "application/json");
                

                // JSON 데이터 생성
                String result = "{\"id\":\"" + memId + "\"}";
                System.out.println(memId);

                // 요청 본문에 데이터 전송
                try (OutputStream os = conn.getOutputStream()) {
                    byte[] input = result.getBytes("utf-8");
                    os.write(input, 0, input.length);
                }

                // 응답 처리
                if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                    rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
                } else {
                    rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
                }


            } catch (IOException e) {
                // HTTP 요청 관련 예외 처리
                e.printStackTrace();  // 로그에 예외 출력 (필요시 로깅 활용)
                model.addAttribute("msg", "서버와의 연결에 문제가 발생했습니다.");
                return "member/loginView"; // 로그인 실패 시 로그인 페이지로 돌아감
            } finally {
                // BufferedReader, HttpURLConnection 객체 정리
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

            // 홈으로 리다이렉트
            return "redirect:/";
        } else {
            model.addAttribute("msg", "아이디 혹은 비밀번호가 올바르지 않습니다.");
            return "member/loginView"; // 로그인 실패 시 로그인 페이지로
        }
    }
    
    // 로그아웃 처리
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 무효화
        return "redirect:/"; // 홈으로 리다이렉트
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
        // 세션에서 로그인 정보를 가져옴
        MemberDTO login = (MemberDTO) session.getAttribute("login");

        // 로그인 정보가 없으면 로그인 페이지로 리디렉션
        if (login == null) {
            return "redirect:/loginView";  // 로그인 페이지로 리디렉션
        }

        String memId = login.getMemId();
        model.addAttribute("member", login);

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

            System.out.println(sb.toString());  // 서버 응답 출력

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

        return "member/mypage";  // 페이지 리턴
    }
    // 회원 정보 수정 페이지로 이동
    @RequestMapping("/memEditView")
    public String memEditView(HttpSession session, Model model) {
        MemberDTO member = (MemberDTO) session.getAttribute("login");
        if (member != null) {
            model.addAttribute("member", member); // 세션에서 회원 정보를 모델에 추가
            return "member/memEditView"; // JSP 페이지로 이동
        } else {
            return "redirect:/loginView"; // 로그인하지 않은 경우 로그인 페이지로 리다이렉트
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
