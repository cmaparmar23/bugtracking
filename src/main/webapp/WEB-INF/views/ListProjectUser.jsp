<%@page import="com.grownited.bean.ProjectUserBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bug Tracking | List Project User</title>
<jsp:include page="AllCss.jsp"></jsp:include>

</head>
<body>



<jsp:include page="NavBar.jsp"></jsp:include>


<div class="container-fluid page-body-wrapper">

<jsp:include page="AdminSideBar.jsp"></jsp:include>
<div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title"> Project User Tables </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="admindashboard">Dashboard</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Project User</li>
                </ol>
              </nav>
            </div>
            <div class="row">
              
              
              <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                   
                 
                    
<%
	List<ProjectUserBean>listProjectUser= (List<ProjectUserBean>)request.getAttribute("listProjectUser");
%>
					
					
                    <table class="table table-striped" id="projectuser">
                      <thead>
                        <tr>
                       <th>ProjectUserId</th>
						<th>UserId</th>
						<th>ProjectId</th>
						<th>Assign Status</th>
						<th>Action</th>
                        </tr>
                      </thead>
<%
	for(ProjectUserBean pub:listProjectUser){
%>

                      <tbody>
                      
                       <tr>
							<td><%=pub.getProjectUserId() %></td>
							<td><%=pub.getUserId() %></td>
							<td><%=pub.getProjectId() %></td>
							<td><%=pub.getAssignStatus() %></td>
		
	
							<td><a href="deleteprojectuser/<%=pub.getProjectUserId() %>">Delete</a>|
							<a href="viewprojectuser?projectUserId=<%=pub.getProjectUserId()%>">View</a></td>
					</tr>
	
                        <%
								}
						%>
                        
                        
                          </tbody>
                    </table>
                    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
                   <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
                   <script >$(document).ready(function () {
                	    $('#projectuser').DataTable();
                   });</script>
                    
                    
                    <div class="mt-3">
                    <a class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn" href="newprojectuser">ADD PROJECT USER</a></i>
                  </div>
                  
                  
                  </div>
                </div>
              </div>
              
              
              
            </div>
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:../../partials/_footer.html -->
          <footer class="footer">
            <div class="container-fluid clearfix">
              <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © bootstrapdash.com 2020</span>
              <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Free <a href="https://wordpress-923989-3206731.cloudwaysapps.com/bootstrap-admin-template/" target="_blank">Bootstrap admin template</a> from Bootstrapdash.com</span>
            </div>
          </footer>
          <!-- partial -->
        </div>



 </div>
 
 
 

	<jsp:include page="AllJs.jsp"></jsp:include>


</body>
</html>