package com.grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.bean.ProjectBean;
import com.grownited.bean.TaskBean;
import com.grownited.dao.TaskDao;

@Controller

public class TaskController {
	
	@Autowired
	TaskDao taskDao;
	
	@GetMapping("/newtask")
	public String newTask() {
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
		model.addAttribute("listtask",listTask);
		return "ListTask";
	}
	
	@GetMapping("/deletetask/{taskId}")
	public String deleteTask (@PathVariable("taskId")Integer taskId) {
		taskDao.deleteTask(taskId);
		return"redirect:/listtask";
	}
	

	@GetMapping("/viewtask/{taskId}")
	public String viewTask(@PathVariable("taskId")Integer taskId,Model model) {
		TaskBean taskBean =taskDao.getTaskById(taskId);
		model.addAttribute("taskBean",taskBean);
	return "ViewTask";
	}

	

}
