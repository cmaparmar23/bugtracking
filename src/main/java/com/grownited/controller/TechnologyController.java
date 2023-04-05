package com.grownited.controller;

import java.util.List;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.bean.TechnologyBean;
import com.grownited.dao.TechnologyDao;

@Controller
public class TechnologyController {
	
	@Autowired
	TechnologyDao technologyDao;
	
	
	
		@GetMapping("/newtechnology")

		public String newTechnology(HttpServletRequest request) { // method

			// cookie name
			// cookie userid
			int userId=-1;
			// read all cookies from request
			String firstName="";
			Cookie c[] = request.getCookies();//jSEssionId userId octo firstName 

			for (Cookie x : c) {// jsessionid userId firstname
				if (x.getName().equals("userId")) {
					userId = Integer.parseInt(x.getValue());
				}
				if (x.getName().equals("firstName")) {
					firstName = x.getValue();
				}
			}

			System.out.println("userId -> " + userId);
			System.out.println("firstName -> " + firstName);

		
		
		
		return"NewTechnology";//jsp name
	}
	
	@PostMapping("/savetechnology")
	public String saveTechnology(TechnologyBean technologyBean) {
		System.out.println(technologyBean.getTechnologyName()); 
		technologyDao.addTechnology(technologyBean);
		return "redirect:/listtechnologies";
		
	}
	
	
	@GetMapping("/listtechnologies")
	public String listTechnology(Model model) {
		
		//pull all category from db-table
		List<TechnologyBean> list=technologyDao.getAllTechnology();
		model.addAttribute("list",list);
		return "ListTechnology";
	}
	
	
	
	@GetMapping("/deletetechnology/{technologyId}")
	public String deleteTechnology(@PathVariable("technologyId") Integer technologyId) {
		
		technologyDao.deleteTechnology(technologyId);
		return "redirect:/listtechnologies";
	}
	
	
	
	@GetMapping("/viewtechnology")
	public String viewTechnology(@RequestParam("technologyId")Integer technologyId,Model model) {
		TechnologyBean technologyBean =technologyDao.getTechnologyById(technologyId);
		model.addAttribute("technologyBean",technologyBean);
	return "ViewTechnology";
	}



@GetMapping("/edittechnology")
public String editTechnology (@RequestParam("technologyId") Integer technologyId,Model model){
	
	TechnologyBean technologyBean=technologyDao.getTechnologyById(technologyId);
	model.addAttribute("technologyBean",technologyBean);
	return "EditTechnology";
	
}

@PostMapping("/updatetechnology")
public String updateTechnology(TechnologyBean technologyBean) {
	technologyDao.updateTechnology(technologyBean);
	return "redirect:/listtechnologies";
}
}
























