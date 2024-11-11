package com.proj.main.review.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.proj.main.FileUpload;
import com.proj.main.attach.dto.AttachDTO;
import com.proj.main.attach.service.AttachService;
import com.proj.main.member.dto.MemberDTO;
import com.proj.main.review.dto.ReviewDTO;
import com.proj.main.review.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	ReviewService rs;
	
	@Autowired
	FileUpload fileUpload;
	
	@Autowired
	AttachService attachService;
	
	@RequestMapping("/reviewView")
	public String reviewView() {
		return "review/reviewView";
	}
	
	@RequestMapping("/reviewWriteView")
	public String reviewWriteView() {
		return "review/reviewWriteView";
	}
	
	@RequestMapping("/reviewWriteDo")
	public String reviewWriteDo(ReviewDTO review, MultipartFile[] files, HttpSession session) {
		
		MemberDTO mem = (MemberDTO) session.getAttribute("login");
		String memId = mem.getMemId();
		review.setMemId(memId); 
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm:ss");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyMMddHHmmssSSS");
		String writeDate = sdf.format(date);
		String reviewId	= sdf2.format(date) + memId; 
		review.setRevDate(writeDate);
		review.setRevId(reviewId);
		
		String imgPath = null;
		List<String> pathList = new ArrayList<>();
		
		try {
			if(files.length > 0) {
				List<AttachDTO> attachList = fileUpload.getAttachListByMultiparts(files);
				for(AttachDTO attach : attachList) {
					imgPath = attach.getAtchPath().substring(11);
					attachService.insertAttach(attach);
					pathList.add(imgPath);
				}
				ObjectMapper objectMapper = new ObjectMapper();
				String pathListJson = objectMapper.writeValueAsString(pathList);
				review.setRevFile("{" +pathListJson + "}");
				
			}			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "redirect:/reviewWriteView";
		}
		
		rs.insertReview(review);
		
		return "redirect:/reviewView";
	}
}
