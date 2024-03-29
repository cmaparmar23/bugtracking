<%@page import="com.grownited.bean.ModuleBean"%>
<%@page import="com.grownited.bean.StatusBean"%>
<%@page import="java.util.List"%>
<%@page import="com.grownited.bean.ProjectBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bug Tracking | Edit Module</title>

<jsp:include page="AllCss.jsp"></jsp:include>

</head>
<body>

<jsp:include page="NavBar.jsp"></jsp:include>

<div class="container-fluid page-body-wrapper">

<jsp:include page="AdminSideBar.jsp"></jsp:include>

<div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title">Edit Module  </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="admindashboard">Dashboard</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Module</li>
                </ol>
              </nav>
            </div>
            
             <div class="row"> 
              <div class="col-lg-10 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                  
                  
                 <div class="col-md-10 grid-margin stretch-card">
                <div class="card">
                 <div class="card-body">
                 
                 
                <%
	List<ProjectBean> listProject = (List<ProjectBean>) request.getAttribute("listProject");
                ModuleBean moduleBean=(ModuleBean)request.getAttribute("moduleBean");
%>

<%
	List<StatusBean> listStatus = (List<StatusBean>) request.getAttribute("listStatus");
%>
                 
                 <form class="forms-sample" action="updatemodule" method="post" >
                 <input type="hidden" name="moduleId" value="${moduleBean.moduleId }"/> 
                 
                 
                 <div class="form-group row">
                        <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Module Name</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="moduleName" value="${moduleBean.moduleName}">
                        </div>
                      </div>
                 
                 
                
                
                
                  <div class="form-group row">
                        <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Project</label>
                        
                 <div class="input-group-prepend">
                  <div class="col-sm-9">
                          <select class="btn btn-sm btn-outline-primary dropdown-toggle" name ="ProjectId"  data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            

								<%
										for(ProjectBean pb : listProject) {
		
	
								%>		
      								<option value = "<%=pb.getProjectId()%>"
      								<%=pb.getProjectId()==moduleBean.getProjectId()? "selected" :"" %>>
      								<%=pb.getProjectName()%>  </option>
      								<%
										}
     								 %>
         				</select>
        			 </div>
                  </div>
                </div>
                     
                     
                     
                      <div class="form-group row">
                        <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Status</label>
                        
                 <div class="input-group-prepend">
                  <div class="col-sm-9">
                          <select class="btn btn-sm btn-outline-primary dropdown-toggle" name ="StatusId"  data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            

								<%
										for(StatusBean sb : listStatus) {
		
	
								%>		
      								<option value = "<%=sb.getStatusId()%>"
      							<%=sb.getStatusId()==moduleBean.getStatusId()? "selected" :"" %>>
      								
      							
      								<%=sb.getStatusName()%>  </option>
      								<%
										}
     								 %>
         				</select>
        			 </div>
                  </div>
                </div>
                      
                      
                       <div class="form-group row">
                        <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Estimated Hours</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="estimatedHours" value="${moduleBean.estimatedHours}">
                        </div>
                      </div>
                      
                      
                      <div class="form-group row">
                        <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Total Utilized Hours</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="totalUtilizedHours" value="${moduleBean.totalUtilizedHours }">
                        </div>
                      </div>
                      
                       <div class="form-group row">
                        <label for="exampleInputMobile" class="col-sm-3 col-form-label">Document URL</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="documentUrl" value="${moduleBean.documentUrl}">
                        </div>
                      </div>
                      
                      
                      
                      <div class="form-group row">
                        <label for="exampleInputMobile" class="col-sm-3 col-form-label">Description</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="description" value="${moduleBean.description}">
                        </div>
                      </div>
                    
                      <button type="submit" class="btn btn-gradient-primary me-2">Update Module</button>
                  	 <button class="btn btn-gradient-primary me-2" href="listmodule">Cancel</button>
                  		
                    </form>
                 
                 
                 
                 </div>
                </div>
             	 </div>
                   

				
                </div>
                </div>
               </div>
               </div>
              </div>
       </div>
    </div>

		<jsp:include page="AllJs.jsp"></jsp:include>
	

</body>
</html>