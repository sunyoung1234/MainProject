package com.proj.main.admin.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminController {
	
	@RequestMapping("/adminView")
	public String adminView() {
		
		
		return "admin/adminView";
	}
	
}
