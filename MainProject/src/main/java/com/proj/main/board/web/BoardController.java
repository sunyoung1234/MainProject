package com.proj.main.board.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("/freeBoardView")
	public String freeBoradView() {
		return "board/freeBoradView";
	}
	
	
	@RequestMapping("/infoBoardView")
	public String infoBoardView() {
		return "board/infoBoardView";
		
	}
	

	
}
