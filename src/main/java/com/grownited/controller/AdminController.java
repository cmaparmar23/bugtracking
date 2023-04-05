package com.grownited.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	
		@GetMapping("/admindashboard")
		public String adminDashboard(Model model) {
			System.out.println("Inside admindashboard--url-metho--");
			model.addAttribute("totaltodaySale",200);
			return"AdminDashboard";
		}
	

}
