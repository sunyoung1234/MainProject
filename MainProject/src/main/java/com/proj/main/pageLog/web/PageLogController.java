package com.proj.main.pageLog.web;

import java.time.Duration;
import java.util.ArrayList;
import java.util.Collections;
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
import com.proj.main.usersession.dto.UserCountDTO;
import com.proj.main.usersession.dto.UserSessionDTO;
import com.proj.main.usersession.service.UserService;

@Controller
public class PageLogController {
	
	@Autowired
	PageLogService pageLogService;
	
	@Autowired
	UserService userSessionService;
	
	@RequestMapping("/adminView")
	public String adminView(HttpSession session, String memId, Model model, String loginDate ) {
		
		
		List<PageLogDTO> logAll = pageLogService.allSelectPageLog();
		
		// 접속 기록있는 멤버 아이디 가져오기 중복없이
		List<PageLogDTO> memIdAll = pageLogService.memIdSelectPageLog();
		
		// 접속 기록 있는 페이지 이름 가져오기 중복없이
		List<PageLogDTO> distincePageName = pageLogService.distinctpageName();
		System.out.println(distincePageName);
		
		// 아이디별 페이지 접속 횟수 가져오기
		List<PageLogDTO> selectIdPageCount = pageLogService.selectIdPageCount();
		List<String> selectIdPageId = new ArrayList<>();
		List<Integer> selectIdPageCounting = new ArrayList<>();
		
		for(PageLogDTO items : selectIdPageCount) {
			selectIdPageId.add(items.getMemId());
			selectIdPageCounting.add(items.getVisitCount());
		}
		
		model.addAttribute("selectIdPageId",selectIdPageId);
		model.addAttribute("selectIdPageCounting",selectIdPageCounting);
 		
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
		
		/////////////////////////////////////////////////////
		// userSession

		// 평균 접속 시간
		List<UserSessionDTO> userAvgDuration = userSessionService.selectAvgDuration();
		
		List<String> userAvgDurationName = new ArrayList<>();
		List<Long> userAvgDurationNumber = new ArrayList<>();
		
		for(UserSessionDTO item5 : userAvgDuration) {
			userAvgDurationName.add(item5.getMemId());
			userAvgDurationNumber.add(item5.getSessionDuration());
		}
		
		int userAllCount = userAvgDurationName.size();
		
		long sum = 0;
		for(int i = 0; i < userAvgDurationNumber.size(); i++) {
			sum += userAvgDurationNumber.get(i);
		}
		
		long userAllAvg = Math.round(sum)/userAvgDurationNumber.size();
		model.addAttribute("userAllCount",userAllCount);
		model.addAttribute("userAllAvg",userAllAvg);
		// 어제 오늘 접속자 (중복x)
		int yesterdayCount = userSessionService.yesterdayUserCount();
		int todayCount = userSessionService.todayUserCount();
		model.addAttribute("yesterdayCount",yesterdayCount);
		model.addAttribute("todayCount",todayCount);
		
		int yesterdayUserAvg = userSessionService.yesterdayUserAvg();
		int todayUserAvg = userSessionService.todayUserAvg();
		
		model.addAttribute("yesterdayUserAvg",yesterdayUserAvg);
		model.addAttribute("todayUserAvg",todayUserAvg);
		
		////////////////////////////////////////////
		// 유저 시간별 접속 횟수
		
		List<String> userDate = userSessionService.selectDate();
		
		System.out.println(userDate);

		Collections.sort(userDate);
		
		System.out.println(userDate);
		model.addAttribute("userDate",userDate);
		loginDate = userDate.get(userDate.size()-1);
		List<UserCountDTO> userCount = userSessionService.userLoginCount(loginDate);
		
		System.out.println(userCount);
		
		List<String> loginHour = new ArrayList<>();
		List<String> loginCount = new ArrayList<>();
		
		for(UserCountDTO key : userCount) {
			loginHour.add(key.getLoginHour());
			loginCount.add(key.getLoginCount());
		}
		
		model.addAttribute("loginHour",loginHour);
		model.addAttribute("loginCount",loginCount);
		
		
		return "admin/adminView";
	}
	
	@ResponseBody
	@RequestMapping("/selectId")
	public Map<String, Object> selectId(String memId, Model model) {
		
		memId = memId.trim();
		System.out.println(memId);
		Map<String, Object> result = new HashMap<>();
				
		if(memId.equals("all")){
			List<PageLogDTO> pageCount =  pageLogService.allSelectPageLog();
			List<String> memIdPage = new ArrayList<>();
			List<Integer> memIdCount = new ArrayList<>();
			
			for(PageLogDTO item : pageCount) {
				memIdPage.add(item.getPageName());
				memIdCount.add(item.getVisitCount());
			}
	        result.put("pageNames", memIdPage);
	        result.put("visitCounts", memIdCount);
		}else {
			List<PageLogDTO> selectId = pageLogService.selectPageLog(memId);
			System.out.println(selectId);
			List<String> memIdPage = new ArrayList<>();
			List<Integer> memIdCount = new ArrayList<>();
			
			for(PageLogDTO item : selectId) {
				memIdPage.add(item.getPageName());
				memIdCount.add(item.getVisitCount());
			}
			
	        result.put("pageNames", memIdPage);
	        result.put("visitCounts", memIdCount);
		}
		
		
		
		System.out.println(result);
		
		
		
		return result; 
	}
	
	@ResponseBody
	@RequestMapping("/selectPage")
	public Map<String, Object> selectPage(String pageName, Model model) {
		
		pageName = pageName.trim();
		
		List<String> memId = new ArrayList<>();
		List<Integer> memIdCount = new ArrayList<>();
		
		Map<String, Object> result = new HashMap<>();
		if(pageName.equals("all")) {
			List<PageLogDTO> page = pageLogService.selectIdPageCount();
			for(PageLogDTO item : page) {
				memId.add(item.getMemId());
				memIdCount.add(item.getVisitCount());
			}
			
			
			
			 // 결과 Map에 담기
	        result.put("memId", memId);
	        result.put("visitCounts", memIdCount);
			
		}else {
			List<PageLogDTO> selectPage = pageLogService.pageNameSelectPageLog(pageName);
			for(PageLogDTO item : selectPage) {
				memId.add(item.getMemId());
				memIdCount.add(item.getVisitCount());
			}
			
			
			 // 결과 Map에 담기
	        result.put("memId", memId);
	        result.put("visitCounts", memIdCount);
		}
		
		
		
		return result; 
	}
	
	
	@ResponseBody
	@RequestMapping("/selectDate")
	public Map<String, Object> selectDate(String userDate, Model model) {
		
		userDate = userDate.trim();
		
		List<String> userHour = new ArrayList<>();
		List<String> userCount = new ArrayList<>();
		
		Map<String, Object> result = new HashMap<>();
		
		List<UserCountDTO> userCounts = userSessionService.userLoginCount(userDate);
		for(UserCountDTO item : userCounts) {
			userHour.add(item.getLoginHour());
			userCount.add(item.getLoginCount());
		}
		
		
		 // 결과 Map에 담기
	    result.put("userHour", userHour);
	    result.put("userCount", userCount);


		
		
		return result; 
	}
	
}
