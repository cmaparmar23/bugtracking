package com.grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.bean.TaskUserBean;
import com.grownited.dao.StatusDao;
import com.grownited.dao.TaskDao;
import com.grownited.dao.TaskUserDao;
import com.grownited.dao.UserDao;

@Controller
public class TaskUserController {
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	StatusDao statusDao;
	
	@Autowired
	TaskDao taskDao;
	
	
	@Autowired
	TaskUserDao taskUserDao;
	
	@GetMapping("/newtaskuser")
	public String newTaskUser(Model model) {
		model.addAttribute("listTask",taskDao.getAllTask());
		model.addAttribute("listUser",userDao.getAllUser());
		model.addAttribute("listStatus",statusDao.getAllStatus());
		return "NewTaskUser";
		
	}
	
	@PostMapping("/savetaskuser")
	public String saveTaskUser(TaskUserBean taskuserBean)
	{
		System.out.println(taskuserBean.getTaskUserId());
		taskUserDao.addTaskUser(taskuserBean);
		return "redirect:/listtaskuser";
		
		//dao
		//insert
	
		
	}
	@GetMapping("/listtaskuser")
	public String listTaskUser(Model model) {
		
		//pull all category from db-table
		List<TaskUserBean> listTaskUser=taskUserDao.getAllTaskUser();
		model.addAttribute("listTaskUser",listTaskUser);
		return "ListTaskUser";
	}
	
	@GetMapping("/deletetaskuser/{taskUserId}")
	public String deleteProjecUser(@PathVariable("taskUserId") Integer taskUserId) {
		
		taskUserDao.deleteTaskUser(taskUserId);
		return "redirect:/listtaskuser";
	}
	
	//view
	
	@GetMapping("/viewtaskuser")
	public String viewTaskUser(@RequestParam("taskUserId")Integer taskUserId,Model model) {
		TaskUserBean taskUserBean =taskUserDao.getTaskUserById(taskUserId);
		model.addAttribute("taskUserBean",taskUserBean);
	return "ViewTaskUser";
	}
	
	
	

}
