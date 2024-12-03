package com.proj.main.map.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.proj.main.map.dto.ZeroDTO;
import com.proj.main.map.service.MapService;
import com.proj.main.member.dto.MemberDTO;
import com.proj.main.pageLog.dto.PageLogDTO;

@Controller
public class MapController {

	@Autowired
	MapService ms;
	
	@RequestMapping("/mapView")
	public String mapView(Model model, HttpSession session) {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		if(login != null) {
			String memId = login.getMemId();
			PageLogDTO log = new PageLogDTO();
			log.setMemId(memId);
			log.setPageName("Áöµµ");
		}
		
		
		List<ZeroDTO> zeroList = ms.getZeroList();
		model.addAttribute("zeroList", zeroList);
		
		Map<String , Integer> countRegion = new HashMap<>(); 
		
		for(ZeroDTO zero : zeroList) {
			String key = zero.getRegion();
			countRegion.put( key, countRegion.getOrDefault(key, 0)+1 );
		}
		List<String> keyList = new ArrayList<>(countRegion.keySet());
		List<Integer> valueList = new ArrayList<>(countRegion.values());
		
		model.addAttribute("keyList", keyList);
		model.addAttribute("valueList", valueList);
		
		
		
		return "map/mapView"; 
	}
}
