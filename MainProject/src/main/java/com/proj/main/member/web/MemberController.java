package com.proj.main.member.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.proj.main.FileUpload;
import com.proj.main.attach.dto.AttachDTO;
import com.proj.main.attach.service.AttachService;
import com.proj.main.member.dto.MemberDTO;
import com.proj.main.member.dto.MyBuildingDTO;
import com.proj.main.member.service.MemberService;
import com.proj.main.result.dto.ApplyZEBDTO;
import com.proj.main.result.dto.TestResultDTO;
import com.proj.main.result.service.ResultService;
import com.proj.main.usersession.service.UserService;

@Controller
public class MemberController {
    
    @Autowired
    MemberService memberService;

    @Autowired
    AttachService attachService;

    @Autowired
    FileUpload fileUpload;
    
    @Autowired
    ResultService rs;
    
    @Autowired
	UserService userService;
    
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
        String ext = "JPEG";
        try {
            // �̹��� ���ε�
            if (img != null && !img.isEmpty()) {
                AttachDTO attach = fileUpload.getAttachByMultipart(img,ext);
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
                AttachDTO attach = fileUpload.getAttachByMultipart(img,"JPEG");
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
        
        String memId;
        if (login != null) {
            session.setAttribute("login", login); // ���ǿ� �α��� ���� ����
            memId = login.getMemId();
            System.out.println(session.getAttribute("login"));
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
	        userService.insertLoginUser(memId);
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
    	
    	MemberDTO login = (MemberDTO) session.getAttribute("login");
    	System.out.println("nullPoint1");
    	System.out.println(login);
    	String memId = login.getMemId();
    	System.out.println(memId);
    	System.out.println("nullPoint2");
    	userService.updateLogoutTime(memId);
    	System.out.println("nullPoint3");
        userService.updateTimeCalc(memId);
        System.out.println("nullPoint4");
    	
        session.invalidate(); // ���� ��ȿȭ
        return "redirect:/"; // Ȩ���� �����̷�Ʈ
    }
    
    @ResponseBody
    @RequestMapping("/sessionOut")
    public String sessionOut(HttpSession session, String memId) {
    	
    	System.out.println(memId);
    	userService.updateLogoutTime(memId);
    	System.out.println("nullPoint3");
        userService.updateTimeCalc(memId);
        System.out.println("nullPoint4");
    	
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
    
    
    @RequestMapping("/productView")
    public String productView() {
    	
    	return "member/productView";
    }
    
    @RequestMapping("/registMyBuildingView")
    public String  registMyBuilding() {
    	return "member/registMyBuildingView";
    }
    
    @RequestMapping("/registMyBuilding")
    public String registMyBuilding(MyBuildingDTO myB, MultipartFile[] files, HttpSession session) {
    	
    	MemberDTO login = (MemberDTO) session.getAttribute("login");
    	String id = login.getMemId();
    	
    	Date date = new Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
    	String now = sdf.format(date);
    	String b_id = id + now;
    	
    	myB.setBuildingId(b_id);
    	myB.setMemId(id);
    	
    	String imgPath = null;
    	List<String> pathList = new ArrayList<>();
    	
    	if(files.length > 0) {
    		try {
				List<AttachDTO> attachList = fileUpload.getAttachListByMultiparts(files,"JPEG");
				for(AttachDTO  attach : attachList) {
					imgPath = attach.getAtchPath().substring(11);
					attachService.insertAttach(attach);
					pathList.add(imgPath);
					
				}
				ObjectMapper objectMapper = new ObjectMapper();
				String pathListJson = objectMapper.writeValueAsString(pathList);
				myB.setBuildingImg("{" +pathListJson + "}");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	
    	
    	memberService.insertMyBuilding(myB);
    	
    	return "redirect:/myBuildingView";
    }
    
    @RequestMapping("/myBuildingView")
    public String myBuilding(HttpSession session, Model model) {
    	
    	MemberDTO login = (MemberDTO) session.getAttribute("login");
    	
    	if(login == null) {
    		return "member/loginView";
    	}
    	
    	
    	String id = login.getMemId();
    	
    	List<MyBuildingDTO> buildings = memberService.getMyBuildings(id);
    	List<MyBuildingDTO> names = memberService.getZebTestN(id);
    	List<String> buildingNameList = new ArrayList<>();
    	
    	List<Integer> zebList = new ArrayList<>();
    	List<String> eList = new ArrayList<>();
    	List<String> iList = new ArrayList<>();
    	
    	
    	
    	if(buildings.size() > 0) {
    		model.addAttribute("myBuildingList", buildings);
    		List<String> mainImgList = new ArrayList<>();
    		
    		for(MyBuildingDTO building : buildings) {
    			if(building.getBuildingImg().length() > 4) {
    				
    				
    				int imgLen = building.getBuildingImg().length();
    				String imgStrs = building.getBuildingImg().substring(1, imgLen-1);
    				
    				// JSON �Ľ�
    				ObjectMapper objectMapper = new ObjectMapper();
    				try {
    					List<String> imageList = objectMapper.readValue(imgStrs, List.class);
    					
    					String mainImg = imageList.get(0);
    					building.setBuildingImg(mainImg);
    					
    					
    					
    				} catch (JsonParseException e) {
    					e.printStackTrace();
    				} catch (JsonMappingException e) {
    					e.printStackTrace();
    				} catch (IOException e) {
    					e.printStackTrace();
    				}
    			}else {
    				building.setBuildingImg("none");
    			}
    			
    			if(building.getZebLevel() < 6) {
    				buildingNameList.add(building.getBuildingName());
    			}
    		}
    		
    		model.addAttribute("buildingName", buildingNameList);
    		
    	}else {
    		String msg = "����Ͻ� �ǹ��� �����ϴ�.";
    		model.addAttribute("msg", msg);
    	}
    	
    	
    	
    	return "member/myBuildingView";
    }
    
    @RequestMapping("/applyZEB")
    public String applyZEB(Model model, String bname,ApplyZEBDTO zeb, HttpSession session, MultipartFile attachment) {
    	
    	MemberDTO login = (MemberDTO) session.getAttribute("login");
    	zeb.setMemId(login.getMemId());
    	
    	MyBuildingDTO mb = new MyBuildingDTO();
    	mb.setBuildingName(bname);
    	mb.setMemId(login.getMemId());
    	
    	String bId = rs.getBuildingId(mb);
    	zeb.setBuildingId(bId);
    	zeb.setBuildingName(bname);
    	
    	String originalFileName = attachment.getOriginalFilename();
    	String ext = "";
        if (originalFileName != null && originalFileName.contains(".")) {
            ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
        }
        
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
        String sys = sdf.format(date);
        zeb.setApplyDate(sys);
        
        try {
			AttachDTO attach = fileUpload.getAttachByMultipart(attachment, ext);
			String filePath = attach.getAtchPath().substring(11); 
            attachService.insertAttach(attach); 
            zeb.setFileName(filePath);
            
            
		} catch (IOException e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        rs.applyZEB(zeb);
    	
    	return "redirect:/myBuildingView";
    }
    
    @RequestMapping("/applyStatusView")
    public String applyStatus(HttpSession session, Model model) {
    	MemberDTO login = (MemberDTO) session.getAttribute("login");
    	String m_id = login.getMemId();
    	
    	List<ApplyZEBDTO> applys = rs.applyStatusById(m_id);
    	model.addAttribute("applys", applys);
    	
    	
    	List<String> statusList = new ArrayList<>();
    	
    	for(ApplyZEBDTO apply : applys) {
    		
    		if(apply.getRejectYn().equals("Y")) {
    			statusList.add("���"); 
    		}else if(apply.getApproveYn().equals("Y")) {
    			statusList.add("�Ϸ� (" + apply.getZebLevel() + "���)");
    		}else {
    			statusList.add("��û��");
    		}
    	}
    	
    	
    	model.addAttribute("statusList", statusList);
    	
    	if(m_id.equals("admin")) {
    		List<ApplyZEBDTO> applyAdmins = rs.applyStatusAdmin();
    		model.addAttribute("applyAdmin", applyAdmins);
    		
    		List<String> statusAdmin = new ArrayList<>();
    		
    		for(ApplyZEBDTO apply : applyAdmins) {
        		
        		if(apply.getRejectYn().equals("Y")) {
        			statusAdmin.add("���"); 
        		}else if(apply.getApproveYn().equals("Y")) {
        			statusAdmin.add("�Ϸ� (" + apply.getZebLevel() + "���)");
        		}else {
        			statusAdmin.add("��û��");
        		}
        	}
    		
    		model.addAttribute("statusAdmin", statusAdmin);
    	}
    	
    	
    	return "member/applyStatusView"; 
    }
   
    @RequestMapping("/applyZEBDetailView")
    public String applyZEBDetailView(String bId, Model mo) {
    	
    	ApplyZEBDTO apply = rs.getApplyByBid(bId);
    	
    	mo.addAttribute("apply", apply);
    	
    	TestResultDTO tr = memberService.getTestResult(bId);
    	tr.getZebGrade();
    	mo.addAttribute("grade", tr.getZebGrade()); 
    	MyBuildingDTO myBuilding = memberService.getMyBuildingsByBuildingId(bId);
    	String roadAddress = myBuilding.getRoadAddress();
    	
    	mo.addAttribute("road", roadAddress); 
    	
        return "member/applyZEBDetailView";
    }
   
    // ���� ���� ��û ó��
    @ResponseBody
    @RequestMapping("/keep-session-alive")
    public String keepSessionAlive(HttpSession session) {
    	
    	if (session == null) {
            return "{\"message\": \"������ ����Ǿ����ϴ�.\"}";
        }
    	
    	String memId = "";
    	if(session.getAttribute("login") != null) {
    		MemberDTO login = (MemberDTO) session.getAttribute("login");
        	memId = login.getMemId();
    	}
    	
    	
        // ���� Ÿ�Ӿƿ��� 30������ ����
        session.setMaxInactiveInterval(30*60); // 30��
        return memId;
    }
	

}
