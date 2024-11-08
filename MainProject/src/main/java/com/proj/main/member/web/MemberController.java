package com.proj.main.member.web;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.proj.main.member.service.MemberService;
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

    // 회원가입 처리
    @RequestMapping("/registDo")
    public String registDo(HttpServletRequest req, MultipartFile img, HttpSession session) {
        // 입력값 받기
        String memId = req.getParameter("memId"); // 여기 수정
        String memPw = req.getParameter("memPw");
        String memEmail = req.getParameter("memEmail");
        String memPhone = req.getParameter("memPhone");
        String memName = req.getParameter("memName");
        String memAddress = req.getParameter("memAddress");
        String memDetailAddress = req.getParameter("memDetailAddress");
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
            MemberDTO member = new MemberDTO(memId, memPw, memEmail, memPhone, memName, imgPath, memAddress, memDetailAddress, postcode, extraAddress, defaultMemLevel);
            memberService.registMember(member);
        } catch (IOException e) {
            e.printStackTrace();
            return "redirect:/registView";
        }
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
        String detailAddress = req.getParameter("memDetailAddress");
        String postcode = req.getParameter("postcode");
        String extraAddress = req.getParameter("extraAddress");
        
        // 제대로 데이터가 불러와지는지 체크
        System.out.println("ID: " + id);
        System.out.println("Password: " + pw);
        System.out.println("Email: " + email);
        System.out.println("Phone: " + phone);
        System.out.println("Name: " + name);
        System.out.println("Address: " + address);
        System.out.println("DetailAddress: " + detailAddress);
        System.out.println("Postcode: " + postcode);
        System.out.println("ExtraAddress: " + extraAddress);

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
            MemberDTO updateMem = new MemberDTO(id, pw, name, phone, email, address, detailAddress, postcode, extraAddress, imgPath, defaultMemLevel);
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

            return "redirect:/"; // 홈으로 리다이렉트
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
    
    // 마이 페이지로 이동
    @RequestMapping("/mypage")
    public String mypage(HttpSession session, Model model) {
        
        MemberDTO login = (MemberDTO) session.getAttribute("login");
        String memId = login.getMemId();

         model.addAttribute("member",login);
        
        return "member/mypage";
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
}
