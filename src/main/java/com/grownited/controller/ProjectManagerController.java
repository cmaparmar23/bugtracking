package com.grownited.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProjectManagerController {
	
	@GetMapping("/projectmanagerdashboard")
	public String adminDashboard() {
		System.out.println("Inside projectmanagerdashboard --url-metho--");

		return"ProjectManagerDashboard";
	}

	
	

}
