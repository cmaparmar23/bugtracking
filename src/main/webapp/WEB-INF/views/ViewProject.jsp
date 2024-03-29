<%@page import="com.grownited.bean.ProjectBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Project</title>
<jsp:include page="AllCss.jsp"></jsp:include>

</head>
<body>


<jsp:include page="NavBar.jsp"></jsp:include>


<div class="container-fluid page-body-wrapper">



<jsp:include page="AdminSideBar.jsp"></jsp:include>

<div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title"> View Project  </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="admindashboard">Dashboard</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Project</li>
                </ol>
              </nav>
            </div>
            <div class="row">
              
              
              <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                   
                  
       



<%
	ProjectBean projectBean=(ProjectBean)request.getAttribute("projectBean");
%>

Project Id: <%=projectBean.getProjectId() %><br><br>
Title:  <%=projectBean.getProjectName() %><br><br>
Description:  <%=projectBean.getDescription() %><br><br>
Technology Id:  <%=projectBean.getTechnologyId()%><br><br>
Technology Name:   <%=projectBean.getTechnologyName() %><br><br>
Estimated Hours:  <%=projectBean.getEstimatedHours() %><br><br>
Start Date:  <%=projectBean.getStartDate()%><br><br>
Completion Date:  <%= projectBean.getCompletionDate()%><br><br>
Utilized Hours:  <%=projectBean.getUtilizedHours() %><br><br>
StatusID:  <%=projectBean.getStatusName() %><br><br>
Status:   <%=projectBean.getStatusName() %><br><br>



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
              <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright � bootstrapdash.com 2020</span>
              <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Free <a href="https://wordpress-923989-3206731.cloudwaysapps.com/bootstrap-admin-template/" target="_blank">Bootstrap admin template</a> from Bootstrapdash.com</span>
            </div>
          </footer>
          <!-- partial -->
       

	<jsp:include page="AllJs.jsp"></jsp:include>

</body>
</html>