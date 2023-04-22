package com.grownited.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.grownited.bean.ModuleBean;
import com.grownited.bean.ProjectBean;
import com.grownited.bean.TaskBean;

@Repository

public class ModuleDao {
@Autowired
JdbcTemplate stmt;
 public void addModule(ModuleBean moduleBean) {
	 String insertQuery="insert into module(moduleName,projectId,statusId,estimatedHours,totalUtilizedHours,documentUrl,description)values(?,?,?,?,?,?,?)";
	 	
	 stmt.update(insertQuery,moduleBean.getModuleName(),moduleBean.getProjectId(),moduleBean.getStatusId(),moduleBean.getEstimatedHours(),moduleBean.getTotalUtilizedHours(),moduleBean.getDocumentUrl(),moduleBean.getDescription());
 
 
 }
 
 //list
 
 public List<ModuleBean>getAllModule(){
	 	String joinQuery="select p.projectName,s.statusName,m.projectId, m.moduleName,m.moduleId,m.statusId,m.documentUrl from module m, project p, status s where p.projectId=m.projectId and m.statusId=s.statusId";
		return stmt.query(joinQuery,new BeanPropertyRowMapper<ModuleBean>(ModuleBean.class));

	 
	 
 }
 
 public void deleteModule(Integer moduleId) {
	 String updateQuery="delete from module where moduleId=?";
	 stmt.update(updateQuery,moduleId);
 }
 
 
	
	public ModuleBean getModuleById(Integer moduleId) {
		ModuleBean moduleBean=null;
		try {
			moduleBean=stmt.queryForObject("select * from module where moduleId=?",
					new BeanPropertyRowMapper<ModuleBean>(ModuleBean.class),new Object[] {moduleId});
			
		}
		catch(Exception e) {
			System.out.println("TaskDao::getModuleById()");
			System.out.println(e.getMessage());
		}
		return moduleBean;
	}
	
	
	public void updateModule(ModuleBean moduleBean) {
		String updateQuery="update module set moduleName=? ,projectId = ?, statusId=?,estimatedHours=?,totalUtilizedHours=?,documentUrl=?,description =? where moduleId=?";
		stmt.update(updateQuery,moduleBean.getModuleName(),moduleBean.getProjectId(),moduleBean.getStatusId(),moduleBean.getEstimatedHours(),moduleBean.getTotalUtilizedHours(),moduleBean.getDocumentUrl(),moduleBean.getDescription(),moduleBean.getModuleId());
	}
}
