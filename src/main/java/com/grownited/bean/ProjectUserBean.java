package com.grownited.bean;

public class ProjectUserBean {
	private Integer projectUserId ;
	 private Integer userId ;      
	 private Integer projectId;     
	 private Integer assignStatus;
	 
	 
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

}
