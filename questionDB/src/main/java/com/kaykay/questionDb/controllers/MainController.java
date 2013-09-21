package com.kaykay.questionDb.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kaykay.questionDb.domain.Question;


@Controller
@RequestMapping({"/","home"})
public class MainController {
	
//	@RequestMapping
//	public String getHomePage(){
//		return "home";
//	}
	
	@RequestMapping
	public ModelAndView question(){
	
		return new ModelAndView("home", "command", new Question());
	}

}
