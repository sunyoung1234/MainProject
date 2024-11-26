package com.proj.main.pageLog.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.proj.main.member.dto.MemberDTO;
import com.proj.main.pageLog.dto.PageLogDTO;
import com.proj.main.pageLog.service.PageLogService;

@Controller
public class PageLogController {
	
	@Autowired
	PageLogService pageLogService;
	
	@RequestMapping("/adminView")
	public String adminView(HttpSession session, String memId, Model model ) {
		
		
		List<PageLogDTO> logAll = pageLogService.allSelectPageLog();
		// List<PageLogDTO> log = pageLogService.selectPageLog(memId);
		
		// 접속 기록있는 멤버 아이디 가져오기 중복없이
		List<PageLogDTO> memIdAll = pageLogService.memIdSelectPageLog();
		
		// 접속 기록 있는 페이지 이름 가져오기 중복없이
		List<PageLogDTO> distincePageName = pageLogService.distinctpageName();
		System.out.println(distincePageName);
		
		List<String> pageNameAll = new ArrayList<>();
		List<String> visitMemId = new ArrayList<>();
		List<Integer> visitCountAll = new ArrayList<>();
		
		List<String> logMemId = new ArrayList<>();
		List<String> logPageName = new ArrayList<>();
		
		for(PageLogDTO item : logAll) {
			
			pageNameAll.add(item.getPageName());
			visitCountAll.add(item.getVisitCount());
		}
		
		for(PageLogDTO item2 : memIdAll) {
			visitMemId.add(item2.getMemId());
			logMemId.add(item2.getMemId());
		}
		
		for(PageLogDTO item3 : distincePageName) {
			logPageName.add(item3.getPageName());
		}
		
		System.out.println(pageNameAll);
		System.out.println(visitCountAll);
		System.out.println(logMemId);
		System.out.println(logPageName);
		System.out.println(visitMemId);
		
		model.addAttribute("visitMemId", visitMemId);
		model.addAttribute("pageNameAll", pageNameAll);
		model.addAttribute("visitCountAll", visitCountAll);
		model.addAttribute("logMemId", logMemId);
		model.addAttribute("logPageName", logPageName);
		
		
		System.out.println(logAll);
		
		return "admin/adminView";
	}
	
	@ResponseBody
	@RequestMapping("/selectId")
	public Map<String, Object> selectId(String memId, Model model) {
		
		memId = memId.trim();
		System.out.println(memId);
		
		List<PageLogDTO> selectId = pageLogService.selectPageLog(memId);
		System.out.println(selectId);
		List<String> memIdPage = new ArrayList<>();
		List<Integer> memIdCount = new ArrayList<>();
		
		for(PageLogDTO item : selectId) {
			memIdPage.add(item.getPageName());
			memIdCount.add(item.getVisitCount());
		}
		
		Map<String, Object> result = new HashMap<>();
		
		 // 결과 Map에 담기
        result.put("pageNames", memIdPage);
        result.put("visitCounts", memIdCount);
		
		System.out.println(result);
		
		
		
		return result; 
	}
	
	@ResponseBody
	@RequestMapping("/selectPage")
	public Map<String, Object> selectPage(String pageName, Model model) {
		
		pageName = pageName.trim();
		
		List<PageLogDTO> selectPage = pageLogService.pageNameSelectPageLog(pageName);
		System.out.println(selectPage);
		List<String> memId = new ArrayList<>();
		List<Integer> memIdCount = new ArrayList<>();
		
		for(PageLogDTO item : selectPage) {
			memId.add(item.getMemId());
			memIdCount.add(item.getVisitCount());
		}
		
		Map<String, Object> result = new HashMap<>();
		
		 // 결과 Map에 담기
        result.put("memId", memId);
        result.put("visitCounts", memIdCount);
		
		System.out.println(result);
		
		
		
		return result; 
	}
	
}
