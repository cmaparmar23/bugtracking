<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bug Tracking | Edit Status</title>
</head>
<jsp:include page="AllCss.jsp"></jsp:include>

<body>


<jsp:include page="NavBar.jsp"></jsp:include>

<div class="container-fluid page-body-wrapper">

<jsp:include page="AdminSideBar.jsp"></jsp:include>

<div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title">Edit Status  </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="admindashboard">Dashboard</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Status</li>
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
                   
             
                    <form class="forms-sample" action="updatestatus" method="post">
                    
                         <input type="hidden" name="statusId" value="${statusBean.statusId }"/> 
                    
                     
                      <div class="form-group row">
                        <label for="exampleInputUsername2" class="col-sm-3 col-form-label" >Status</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="statusName" value="${statusBean.statusName}" >
                        </div>
                        
                        </div>
                     
                      <button type="submit" class="btn btn-gradient-primary me-2">Update Status</button>
                      
                        <button class="btn btn-gradient-primary me-2" href="liststatus">Cancel</button>
                      
                    
                     
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