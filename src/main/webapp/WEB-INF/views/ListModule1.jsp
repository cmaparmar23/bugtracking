<%@page import="com.grownited.bean.TaskBean"%>
<%@page import="com.grownited.bean.ModuleBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bug Tracking |List Module</title>
<jsp:include page="AllCss.jsp"></jsp:include>
</head>
<body>
<jsp:include page="NavBar.jsp"></jsp:include>


<div class="container-fluid page-body-wrapper">

<jsp:include page="ProjectManagerSideBar.jsp"></jsp:include>
<div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title"> Module Tables </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="admindashboard">Dashboard</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Module</li>
                </ol>
              </nav>
            </div>
            <div class="row">
              
              
              <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                   
                 
                    
<%
	List<ModuleBean>listModule= (List<ModuleBean>)request.getAttribute("listModule");
%>
					
					
                    <table class="table table-striped" id="module">
                      <thead>
                        <tr>
                       <th>ModukeId</th>
						<th>ModuleName</th>
		
						<th>Project Name</th>
				
						<th>Status</th>
						<th>Document URL</th>
						<th>Action</th>
                        </tr>
                      </thead>
<%
	for(ModuleBean mb: listModule){
%>

                      <tbody>
                      
                        <tr>
                        			 <td><%=mb.getModuleId() %></td>
									<td><%=mb.getModuleName() %></td>
								
									<td><%=mb.getProjectName() %></td>
								
									<td><%=mb.getStatusName() %></td>
									<td><%=mb.getDocumentUrl() %></td>
									<td>
									<a href="viewmodule1?moduleId=<%=mb.getModuleId()%>"><i class="mdi mdi-eye"></i></a>
									
									</td>
                        </tr>
                        
                        <%
								}
						%>
                        
                        
                          </tbody>
                    </table>
                    
                    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
                   <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
                   <script >$(document).ready(function () {
                	    $('#module').DataTable();
                   });</script>
                    
                    
                    <div class="mt-3">
                    <a class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn" href="newmodule">ADD MODULE</a></i>
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
              <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright � bootstrapdash.com 2020</span>
              <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Free <a href="https://wordpress-923989-3206731.cloudwaysapps.com/bootstrap-admin-template/" target="_blank">Bootstrap admin template</a> from Bootstrapdash.com</span>
            </div>
          </footer>
          <!-- partial -->
        </div>



 </div>



</body>
</html>