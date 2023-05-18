<%@page import="com.grownited.bean.ProjectBean"%>
<%@page import="java.util.List"%>
<%@page import="com.grownited.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bug Tracking | Project User</title>
<jsp:include page="AllCss.jsp"></jsp:include>

</head>
<body>

<jsp:include page="NavBar.jsp"></jsp:include>

<div class="container-fluid page-body-wrapper">

<jsp:include page="AdminSideBar.jsp"></jsp:include>

<div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title">Add Project User  </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="admindashboard">Dashboard</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Project User</li>
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
	List<UserBean> listUser = (List<UserBean>) request.getAttribute("listUser");
%>

<%
	List<ProjectBean> listProject = (List<ProjectBean>) request.getAttribute("listProject");
%>
                 
                 <form class="forms-sample"   action="saveprojectuser" method="post">
                 
                 
                  <div class="form-group row">
                        <label for="exampleInputEmail2" class="col-sm-3 col-form-label">User</label>
                        
                 <div class="input-group-prepend">
                  <div class="col-sm-9">
                          <select class="btn btn-sm btn-outline-primary dropdown-toggle" name ="UserId"  data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            
		<%
			for(UserBean ub : listUser) {
		%>	
			
      <option value = "<%=ub.getUserId()%>">
       <%=ub.getFirstName()%> 
        
      </option>
      
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
                        <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Assign Status</label>
                      <div class="col-sm-9">
                        <select class="form-control" name="assignStatus" id="assignStatus">
                           <option>--Assign Status--</option>
                          <option value="1">Assign</option>
                          <option value="2">Revoke</option>
                        </select>
                      </div>
                      </div>
                      
                    
              
   
                     
                      <button type="submit" class="btn btn-gradient-primary me-2">Save Project USer</button>
                  
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