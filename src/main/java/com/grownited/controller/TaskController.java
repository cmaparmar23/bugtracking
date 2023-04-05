package com.grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.bean.TaskBean;


import com.grownited.dao.ModuleDao;
import com.grownited.dao.ProjectDao;
import com.grownited.dao.StatusDao;
import com.grownited.dao.TaskDao;

@Controller

public class TaskController {
	
	@Autowired
	TaskDao taskDao;
	
	@Autowired
	ProjectDao projectDao;
	
	@Autowired
	StatusDao statusDao;
	
	@Autowired
	ModuleDao moduleDao;	
	
	@GetMapping("/newtask")
	public String newTask(Model model) {
		model.addAttribute("listProject",projectDao.getAllProject());
		model.addAttribute("listStatus",statusDao.getAllStatus());
		model.addAttribute("listModule",moduleDao.getAllModule());
		
		return "NewTask";
	}
	
	
	
	@PostMapping("/savetask")
	public String saveTask(TaskBean taskBean)
	{
		System.out.println(taskBean.getTaskId());
		System.out.println(taskBean.getTaskName());
		taskDao.addTask(taskBean);
		return "redirect:/listtask";
	}
	
	@GetMapping("/listtask")
	public String listTask(Model model) {
		List<TaskBean>listTask=taskDao.getAllTask();
		model.addAttribute("listTask",listTask);
		return "ListTask";
	}
	
	@GetMapping("/deletetask/{taskId}")
	public String deleteTask (@PathVariable("taskId")Integer taskId) {
		taskDao.deleteTask(taskId);
		return"redirect:/listtask";
	}
	

	@GetMapping("/viewtask")
	public String viewTask(@RequestParam("taskId")Integer taskId,Model model) {
		TaskBean taskBean =taskDao.getTaskById(taskId);
		model.addAttribute("taskBean",taskBean);
	return "ViewTask";
	}
	
	
	
	@GetMapping("/edittask")
	public String editTask (@RequestParam("taskId") Integer taskId,Model model){
		
		TaskBean taskBean=taskDao.getTaskById(taskId);
		model.addAttribute("taskBean",taskBean);
		return "EditTask";
		
	}

	@PostMapping("/updatetask")
	public String updateTask(TaskBean taskBean) {
		taskDao.updateTask(taskBean);
		return "redirect:/listtask";
	}

	

}
