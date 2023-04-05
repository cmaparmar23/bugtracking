<%@page import="com.grownited.bean.ModuleBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Module</title>
<jsp:include page="AllCss.jsp"></jsp:include>

</head>
<body>


<jsp:include page="NavBar.jsp"></jsp:include>


<div class="container-fluid page-body-wrapper">



<jsp:include page="AdminSideBar.jsp"></jsp:include>

<div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title"> View Module  </h3>
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
	ModuleBean moduleBean=(ModuleBean)request.getAttribute("moduleBean");
%>

Module Id:  <%=moduleBean.getModuleId() %><br><br>

Module Name:  <%=moduleBean.getModuleName() %><br><br>

Project Id:  <%=moduleBean.getProjectId() %><br><br>

StatusId:  <%=moduleBean.getStatusId() %><br><br>

Estimated Hours:  <%=moduleBean.getEstimatedHours() %><br><br>

Total Utilized Hours:<%=moduleBean.getTotalUtilizedHours() %><br><br>

Document URL:  <%=moduleBean.getDocumentUrl()%><br><br>

Description:  <%=moduleBean.getDescription() %><br><br>

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