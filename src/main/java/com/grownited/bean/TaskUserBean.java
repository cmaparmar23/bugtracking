package com.grownited.bean;

public class TaskUserBean {
	
	private Integer taskUserId;
	private Integer userId ;       
	private Integer taskId ;
	private Integer assignStatus ;
	private Integer statusId;      
	private Integer utilizedHours;
	
	private String firstName;
	private String taskName;
	private String statusName;
	public Integer getTaskUserId() {
		return taskUserId;
	}
	public void setTaskUserId(Integer taskUserId) {
		this.taskUserId = taskUserId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getTaskId() {
		return taskId;
	}
	public void setTaskId(Integer taskId) {
		this.taskId = taskId;
	}
	public Integer getAssignStatus() {
		return assignStatus;
	}
	public void setAssignStatus(Integer assignStatus) {
		this.assignStatus = assignStatus;
	}
	public Integer getStatusId() {
		return statusId;
	}
	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}
	public Integer getUtilizedHours() {
		return utilizedHours;
	}
	public void setUtilizedHours(Integer utilizedHours) {
		this.utilizedHours = utilizedHours;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getTaskName() {
		return taskName;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	

}
