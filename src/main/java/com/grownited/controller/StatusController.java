package com.grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.bean.StatusBean;
import com.grownited.dao.StatusDao;
@Controller

public class StatusController {
	
	@Autowired
	StatusDao statusDao;
	
	@GetMapping("/newstatus")
	public String newStatus() {
		return "NewStatus";
	}
	
	@PostMapping("/savestatus")
	public String saveStatus(StatusBean statusBean) {
		System.out.println(statusBean.getStatusId());
		System.out.println(statusBean.getStatusName());
		statusDao.addStatus(statusBean);
		return "redirect:/liststatus";
		
	}
	
	@GetMapping("/liststatus")
	public String listStatus(Model model) {
		
		List<StatusBean> list=statusDao.getAllStatus();
		model.addAttribute("list",list);
		return "ListStatus";
	}
	
	@GetMapping("/deletestatus/{statusId}")
	public String deleteStatus(@PathVariable("statusId") Integer statusId) {
		
		statusDao.deleteStatus(statusId);
		return "redirect:/liststatus";
	}
	
		
		
	}
	


