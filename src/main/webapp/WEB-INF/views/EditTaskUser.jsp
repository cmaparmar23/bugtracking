<%@page import="com.grownited.bean.TaskUserBean"%>
<%@page import="java.util.List"%>
<%@page import="com.grownited.bean.StatusBean"%>
<%@page import="com.grownited.bean.TaskBean"%>
<%@page import="com.grownited.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bug Tracking | New Task User</title>

<jsp:include page="AllCss.jsp"></jsp:include>

</head>
<body>



<jsp:include page="NavBar.jsp"></jsp:include>

<div class="container-fluid page-body-wrapper">

<jsp:include page="AdminSideBar.jsp"></jsp:include>

<div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title">Edit Task User  </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="admindashboard">Dashboard</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Task User</li>
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
	TaskUserBean taskUserBean=(TaskUserBean)request.getAttribute("taskUserBean");

%>

<%
	List<TaskBean> listTask = (List<TaskBean>) request.getAttribute("listTask");
%>

<%
	List<StatusBean> listStatus = (List<StatusBean>) request.getAttribute("listStatus");
%>

                 
                 <form class="forms-sample"   action="updatetaskuser" method="post">
                     <input type="hidden" name="taskUserId" value="${taskUserBean.taskUserId }"/> 
                 
                 
                  <div class="form-group row">
                        <label for="exampleInputEmail2" class="col-sm-3 col-form-label">User</label>
                        
                 <div class="input-group-prepend">
                  <div class="col-sm-9">
                          <select class="btn btn-sm btn-outline-primary dropdown-toggle" name ="UserId"  data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            
		<%
			for(UserBean ub : listUser) {
		%>	
			
      <option value = "<%=ub.getUserId()%>"
           <%=ub.getUserId()==taskUserBean.getUserId() ?"selected" : "" %>>
      
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
                        <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Task</label>
                        
                 <div class="input-group-prepend">
                  <div class="col-sm-9">
                          <select class="btn btn-sm btn-outline-primary dropdown-toggle" name ="TaskId"  data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            

								<%
										for(TaskBean tb : listTask) {
		
	
								%>		
      								<option value = "<%=tb.getTaskId()%>"
      								     <%=tb.getTaskId()==taskUserBean.getTaskId() ?"selected" :""%>>
      								
      								<%=tb.getTaskName()%>  </option>
      								<%
										}
     								 %>
         				</select>
        			 </div>
                  </div>
                </div>
                     
                     
          
                      <div class="form-group row">
                        <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Assign Status</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="assignStatus" value="${taskUserBean. assignStatus}">
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
      								<%=sb.getStatusId()==taskUserBean.getStatusId()?"selected" :"" %>>
      								<%=sb.getStatusName()%>  </option>
      								<%
										}
     								 %>
         				</select>
        			 </div>
                  </div>
                </div>
                      
                      
                      
                      
                         <div class="form-group row">
                        <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Utilized Hours</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="utilizedHours">
                        </div>
                      </div>
                      
                      
                    
              
   
                     
                      <button type="submit" class="btn btn-gradient-primary me-2">Update Task USer</button>
                         <button class="btn btn-gradient-primary me-2" href="listtaskuser">Cancel</button>
                  
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