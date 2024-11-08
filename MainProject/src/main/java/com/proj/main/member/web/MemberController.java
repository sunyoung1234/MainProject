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

    // ȸ������ ó��
    @RequestMapping("/registDo")
    public String registDo(HttpServletRequest req, MultipartFile img, HttpSession session) {
        // �Է°� �ޱ�
        String memId = req.getParameter("memId"); // ���� ����
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
            // �̹��� ���ε�
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
        String detailAddress = req.getParameter("memDetailAddress");
        String postcode = req.getParameter("postcode");
        String extraAddress = req.getParameter("extraAddress");
        
        // ����� �����Ͱ� �ҷ��������� üũ
        System.out.println("ID: " + id);
        System.out.println("Password: " + pw);
        System.out.println("Email: " + email);
        System.out.println("Phone: " + phone);
        System.out.println("Name: " + name);
        System.out.println("Address: " + address);
        System.out.println("DetailAddress: " + detailAddress);
        System.out.println("Postcode: " + postcode);
        System.out.println("ExtraAddress: " + extraAddress);

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
            MemberDTO updateMem = new MemberDTO(id, pw, name, phone, email, address, detailAddress, postcode, extraAddress, imgPath, defaultMemLevel);
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

            return "redirect:/"; // Ȩ���� �����̷�Ʈ
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
    
    // ���� �������� �̵�
    @RequestMapping("/mypage")
    public String mypage(HttpSession session, Model model) {
        
        MemberDTO login = (MemberDTO) session.getAttribute("login");
        String memId = login.getMemId();

         model.addAttribute("member",login);
        
        return "member/mypage";
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
}
