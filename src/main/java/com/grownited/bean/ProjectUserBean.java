package com.grownited.bean;

public class ProjectUserBean {
	private Integer projectUserId ;
	 private Integer userId ;      
	 private Integer projectId;     
	 private Integer assignStatus;
	 
	 private String firstName;
	 private String projectName;
	 
	 
	public Integer getProjectUserId() {
		return projectUserId;
	}
	public void setProjectUserId(Integer projectUserId) {
		this.projectUserId = projectUserId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getProjectId() {
		return projectId;
	}
	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}
	public Integer getAssignStatus() {
		return assignStatus;
	}
	public void setAssignStatus(Integer assignStatus) {
		this.assignStatus = assignStatus;
		
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	

}
