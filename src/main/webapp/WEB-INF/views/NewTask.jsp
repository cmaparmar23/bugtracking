<%@page import="com.grownited.bean.StatusBean"%>
<%@page import="com.grownited.bean.ModuleBean"%>
<%@page import="java.util.List"%>
<%@page import="com.grownited.bean.ProjectBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bug Tracking | New Task</title>
<jsp:include page="AllCss.jsp"></jsp:include>

</head>
<body>



<jsp:include page="NavBar.jsp"></jsp:include>

<div class="container-fluid page-body-wrapper">

<jsp:include page="AdminSideBar.jsp"></jsp:include>

<div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title">Add Task  </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="admindashboard">Dashboard</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Task</li>
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
					List<ModuleBean> listModule = (List<ModuleBean>) request.getAttribute("listModule");
					%>
					
					
					<%
						List<StatusBean> listStatus = (List<StatusBean>) request.getAttribute("listStatus");
					%>
					
					<%
						List<ProjectBean> listProject = (List<ProjectBean>) request.getAttribute("listProject");
					%>
                 
                 <form class="forms-sample"  action="savetask" method="post">
                 
                 
                  <div class="form-group row">
                        <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Module</label>
                        
                 <div class="input-group-prepend">
                  <div class="col-sm-9">
                          <select class="btn btn-sm btn-outline-primary dropdown-toggle" name ="ModuleId"  data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            

								<%
										for(ModuleBean mb : listModule) {
		
	
								%>		
      								<option value = "<%=mb.getModuleId()%>">
      								<%=mb.getModuleName()%>  </option>
      								<%
										}
     								 %>
         				</select>
        			 </div>
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
      								<option value = "<%=pb.getProjectId()%>">
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
      								<option value = "<%=sb.getStatusId()%>">
      								<%=sb.getStatusName()%>  </option>
      								<%
										}
     								 %>
         				</select>
        			 </div>
                  </div>
                </div>
                      <div class="form-group row">
                        <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Task Name</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="taskName">
                        </div>
                      </div>
                      
                       <div class="form-group row">
                        <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Estimated Hours</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="estimatedHours">
                        </div>
                      </div>
                      
                      
                      <div class="form-group row">
                        <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Total Utilized Hours</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="totalUtilizedHours">
                        </div>
                      </div>
                      
                       <div class="form-group row">
                        <label for="exampleInputMobile" class="col-sm-3 col-form-label">Document URL</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="documentUrl">
                        </div>
                      </div>
                      
                      
                      
                      <div class="form-group row">
                        <label for="exampleInputMobile" class="col-sm-3 col-form-label">Description</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="description">
                        </div>
                      </div>
                      
                      
                   
                      
   
                     
                      <button type="submit" class="btn btn-gradient-primary me-2">Save Task</button>
                  
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