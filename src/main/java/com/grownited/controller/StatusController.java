package com.grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.bean.ProjectUserBean;
import com.grownited.bean.StatusBean;
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
		
		List<StatusBean> listStatus=statusDao.getAllStatus();
		model.addAttribute("listStatus",listStatus);
		return "ListStatus";
	}
	
	@GetMapping("/deletestatus/{statusId}")
	public String deleteStatus(@PathVariable("statusId") Integer statusId) {
		
		statusDao.deleteStatus(statusId);
		return "redirect:/liststatus";
	}
	
	
	@GetMapping("/viewstatus")
	public String viewStatus(@RequestParam("statusId")Integer statusId,Model model) {
		StatusBean statusBean =statusDao.getStatusById(statusId);
		model.addAttribute("statusBean",statusBean);
	return "ViewStatus";
	}
	
	
	@GetMapping("/editstatus")
	public String editStatus (@RequestParam("statusId") Integer statusId,Model model){
		
		StatusBean statusBean=statusDao.getStatusById(statusId);
		model.addAttribute("statusBean",statusBean);
		return "EditStatus";
		
	}

	@PostMapping("/updatestatus")
	public String updateStatus(StatusBean statusBean) {
		statusDao.updateStatus(statusBean);
		return "redirect:/liststatus";
	}
	
}
	


