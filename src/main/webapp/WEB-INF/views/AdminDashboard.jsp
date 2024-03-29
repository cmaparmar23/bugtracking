<%@page import="com.grownited.bean.UtilizedHoursChartBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!--
 <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
</head>
<body>

<h2>Admin Dashboard</h2>
<a href="newtechnology"> Add New Technology</a>
<br>
<a href="listtechnologies">List Technology</a>
<br><br>

<a href="newproject">Add project</a>
<br>
<a href="listproject">List Project</a>
<br><br>

<a href="newstatus">New Status</a>
<br>
<a href="liststatus">List Status</a>

<br><br>
<a href="newtask">New Task</a>
<br>
<a href="listtask">List Task</a>

<br>
<br>
<a href="newmodule"> New Module</a>
<br>
<a href="listmodule">List Module</a>
<br>
<br>
<a href="newprojectuser"> New Project User</a>
<br>
<a href="listprojectuser">List Project User</a>
<br>
<br>
<a href="newtaskuser"> New Task User</a>
<br>
<a href="listtaskuser">List Task User</a>


<br><br>
<a href="logout">Logout</a>
</body>
</html>
  -->
  
  <html>
  
  <head>
  
  <jsp:include page="AllCss.jsp"></jsp:include>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  
   </head>
  
  
  <body>
  
  <div class="container-scroller"  >
  
  <jsp:include page="NavBar.jsp"></jsp:include>
  
  
  
 
  
  
 <div class="container-fluid page-body-wrapper pt-0 proBanner-padding-top">
 
 <jsp:include page="AdminSideBar.jsp"></jsp:include>
 
 <div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title">
                <span class="page-title-icon bg-gradient-primary text-white mr-2">
                  <i class="mdi mdi-home"></i>
                </span> Dashboard
              </h3>
              <nav aria-label="breadcrumb">
                <ul class="breadcrumb">
                  <li class="breadcrumb-item active" aria-current="page">
                    <span></span>Overview <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
                  </li>
                </ul>
              </nav>
            </div>
            <div class="row">
              <div class="col-md-4 stretch-card grid-margin">
                <div class="card bg-gradient-danger card-img-holder text-white">
                  <div class="card-body">
                    <img src="assets1/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image">
                    <h4 class="font-weight-normal mb-3">Total On Going<i class="mdi mdi-chart-line mdi-24px float-right"></i>
                    </h4>
                    <h2 class="mb-5">${totalInProgessProject}</h2>
                    <h6 class="card-text">Increased by 60%</h6>
                  </div>
                </div>
              </div>
              <div class="col-md-4 stretch-card grid-margin">
                <div class="card bg-gradient-info card-img-holder text-white">
                  <div class="card-body">
                    <img src="assets1/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image">
                    <h4 class="font-weight-normal mb-3">Total Completed Project<i class="mdi mdi-bookmark-outline mdi-24px float-right"></i>
                    </h4>
                    <h2 class="mb-5">${totalCompleted}</h2>
                    <h6 class="card-text">Decreased by 10%</h6>
                  </div>
                </div>
              </div>
              <div class="col-md-4 stretch-card grid-margin">
                <div class="card bg-gradient-success card-img-holder text-white">
                  <div class="card-body">
                    <img src="assets1/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image">
                    <h4 class="font-weight-normal mb-3">Total Delayed Project<i class="mdi mdi-diamond mdi-24px float-right"></i>
                    </h4>
                    <h2 class="mb-5">${totalDelayedProject}</h2>
                    <h6 class="card-text">Increased by 5%</h6>
                  </div>
                </div>
              </div>
            </div>
           <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                  <h5 class="card-title">Project-Utilized Hours</h5>
                  <%
                  List<UtilizedHoursChartBean> chartData=(List<UtilizedHoursChartBean>)request.getAttribute("chartData");
                  %>
                 	 <div>
							<canvas id="utilizedchart"></canvas>
					</div>
					
					<script>
  const ctx = document.getElementById('utilizedchart');

  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: [
    	  <%for(UtilizedHoursChartBean u:chartData){%>
    	'<%=u.getProjectName()%>',
    	  <%}%>],
      datasets: [{
        label: '# of UtilizedHors',
        data: [
        	<%for(UtilizedHoursChartBean u :chartData){%>
        	<%=u.getUtilizedHours()%>,
        	<%}%>
        	
        	],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
</script>
 
                </div>
              </div>
             
            </div>
          
           
            
                
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
          <footer class="footer">
            <div class="container-fluid clearfix">
              <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © bootstrapdash.com 2020</span>
              <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Free <a href="https://wordpress-923989-3206731.cloudwaysapps.com/bootstrap-admin-template/" target="_blank">Bootstrap admin template</a> from Bootstrapdash.com</span>
            </div>
          </footer>
          <!-- partial -->
        </div>
 
 
 
 
 </div>
  
  </div>
  
         <jsp:include page="AllJs.jsp"></jsp:include>
          <script src="assets1/vendors/js/vendor.bundle.base.js"></script>
  
  <!-- endinject -->
  <!-- Plugin js for this page -->
  
  <script src="assets1/vendors/chart.js/Chart.min.js"></script>
  <script src="assets1/js/jquery.cookie.js" type="text/javascript"></script>
  
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  
  <script src="assets1/js/off-canvas.js"></script> 
  <script src="assets1/js/hoverable-collapse.js"></script>
  <script src="assets1/js/misc.js"></script>
  
  <!-- endinject -->
  <!-- Custom js for this page -->
  
  <script src="assets1/js/dashboard.js"></script>
  <script src="assets1/js/todolist.js"></script>
  
  
 
  <!-- End custom js for this page -->
 
  
  </body>
  
  </html>