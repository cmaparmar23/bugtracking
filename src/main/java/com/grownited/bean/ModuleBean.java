package com.grownited.bean;

public class ModuleBean {
	private Integer moduleId ;
	private String moduleName;
	private Integer projectId;
	private Integer statusId;
	private Integer estimatedHours;
	private Integer totalUtilizedHours;
	private String documentUrl;
	private String  description;
	
	private String projectName;
	private String statusName;
	
	public Integer getModuleId() {
		return moduleId;
	}
	public void setModuleId(Integer moduleId) {
		this.moduleId = moduleId;
	}
	public String getModuleName() {
		return moduleName;
	}
	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}
	public Integer getProjectId() {
		return projectId;
	}
	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}
	public Integer getStatusId() {
		return statusId;
	}
	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}
	public Integer getEstimatedHours() {
		return estimatedHours;
	}
	public void setEstimatedHours(Integer estimatedHours) {
		this.estimatedHours = estimatedHours;
	}
	public Integer getTotalUtilizedHours() {
		return totalUtilizedHours;
	}
	public void setTotalUtilizedHours(Integer totalUtilizedHours) {
		this.totalUtilizedHours = totalUtilizedHours;
	}
	public String getDocumentUrl() {
		return documentUrl;
	}
	public void setDocumentUrl(String documentUrl) {
		this.documentUrl = documentUrl;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	
	
	

}
