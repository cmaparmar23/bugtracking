
<%@page import="com.grownited.bean.UserBean"%>
<%@page import="com.grownited.bean.TechnologyBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" >
<title>Bug Tracking | List Technology</title>
<jsp:include page="AllCss.jsp"></jsp:include>
  



</head>
<body>

<jsp:include page="NavBar.jsp"></jsp:include>


<div class="container-fluid page-body-wrapper">



<jsp:include page="AdminSideBar.jsp"></jsp:include>

<div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title"> User Tables </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="admindashboard">Dashboard</a></li>
                  <li class="breadcrumb-item active" aria-current="page">User</li>
                </ol>
              </nav>
            </div>
            <div class="row">
              
              
              <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                   
                  
                    
                    
                    
                    
                    <%
						List<UserBean> listUser=(List<UserBean>)request.getAttribute("listUser");
					%>
                    <table  id="user"  class="table table-striped">
                      <thead>
                        <tr>
                          <th> User Id </th>
                          <th> First Name </th>
                       
                          <th> Email </th>
                        
                        
                          <th>Contact Number</th>
                          <th>Role</th>
                          
                          
                          <th>Action</th>
                       
                        </tr>
                      </thead>
                      <%
							for(UserBean ub:listUser){
						%>
                      <tbody>
                      
                        <tr>
                        			 <td><%=ub.getUserId()%></td>
									<td><%=ub.getFirstName()%></td>
									 <td><%=ub.getEmail()%></td>
								
								<td><%=ub.getNumber() %></td>
								<td><%=ub.getRole() %></td>
							
								<td>
									<a href="viewuser?userId=<%=ub.getUserId()%>"><i class="mdi mdi-eye"></i></a>
									|
									<a href="edituser?userId=<%=ub.getUserId()%>"><i class="mdi mdi-pencil"></i></a></td>
     
								
									
									
									
                        </tr>
                        
                        <%
								}
						%>
                        
                        
                          </tbody>
                    </table>
                    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
                    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
                    <script>$(document).ready(function () {
                        $('#user').DataTable();
                    });</script>
                    
                  
                    
                    
                    <div class="mt-3">
                    <a class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn" href="newuser">ADD Technology</a></i>
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
 


</body>
</html>


























