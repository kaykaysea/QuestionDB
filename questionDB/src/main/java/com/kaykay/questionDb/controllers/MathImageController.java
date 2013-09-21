package com.kaykay.questionDb.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MathImageController {
	
	
	@RequestMapping("/capture/ImageCapture")
	public String mathToImage(@RequestParam("image") String image,
							  @RequestParam("save") String name,
							  @RequestParam("type") String type){
		
		
		
		
								return "image";
		
		
		
		
	}

}
