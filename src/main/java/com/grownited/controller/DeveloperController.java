package com.grownited.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller

public class DeveloperController {

	@GetMapping("/developerdashboard")
	public String adminDashboard() {
		System.out.println("Inside developer --url-metho--");

		return"DeveloperDashboard";
	}

}
