<%@page import="com.grownited.bean.TaskBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Task</title>
<jsp:include page="AllCss.jsp"></jsp:include>

</head>
<body>


<jsp:include page="NavBar.jsp"></jsp:include>


<div class="container-fluid page-body-wrapper">



<jsp:include page="AdminSideBar.jsp"></jsp:include>

<div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title"> View Task  </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="admindashboard">Dashboard</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Task</li>
                </ol>
              </nav>
            </div>
            <div class="row">
              
              
              <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                   
                  
       


<%
	TaskBean taskBean=(TaskBean)request.getAttribute("taskBean");
%>

TaskId:  <%=taskBean.getTaskId() %><br><br>

Task Name  :<%=taskBean.getTaskName() %><br><br>

Module Id:  <%=taskBean.getModuleId() %><br><br>

ProjectId  :<%=taskBean.getProjectId() %><br><br>

StatusId:  <%=taskBean.getStatusId() %><br><br>

Estimated Hours :<%=taskBean.getEstimatedHours() %><br><br>

Total Utilized Hours: <%=taskBean.getTotalUtilizedHours() %><br><br>

Document URL:  <%=taskBean.getDocumentUrl()%><br><br>

Description: <%=taskBean.getDescription() %><br><br>

</div>
                  
                  
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
      



	<jsp:include page="AllJs.jsp"></jsp:include>



</body>
</html>