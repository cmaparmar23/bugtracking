<%@page import="com.grownited.bean.UserBean"%>
<%@page import="com.grownited.bean.ProjectBean"%>
<%@page import="com.grownited.bean.StatusBean"%>
<%@page import="com.grownited.bean.TechnologyBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bug Tracking | Edit User </title>

<jsp:include page="AllCss.jsp"></jsp:include>

</head>
<body>


<jsp:include page="NavBar.jsp"></jsp:include>

<div class="container-fluid page-body-wrapper">

<jsp:include page="AdminSideBar.jsp"></jsp:include>

<div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title">Edit User </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="admindashboard">Dashboard</a></li>
                  <li class="breadcrumb-item active" aria-current="page">User</li>
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
                UserBean userBean=(UserBean)request.getAttribute("userBean");
					%>
					
					
				
                 
                 <form class="forms-sample"  action="updateuser" method="post">
                 
                   <input type="hidden" name="userId" value="${userBean.userId }"/> 
                 
                 
                 
                      <div class="form-group row">
                        <label for="exampleInputEmail2" class="col-sm-3 col-form-label">First Name</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="projectName" value="${userBean.firstName}">
                        </div>
                      </div>
                        
                      
                      
                      <div class="form-group row">
                        <label for="exampleInputMobile" class="col-sm-3 col-form-label">Last Name</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="lastName" value="${userBean.lastName }">
                        </div>
                      </div>
                      
                      
                      <div class="form-group row">
                        <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Email</label>
                        <div class="col-sm-9">
                          <input type="email" class="form-control" name="email" value="${userBean.email }">
                        </div>
                      </div>
                      
                      
                      <div class="form-group row">
                        <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Password</label>
                        <div class="col-sm-9">
                          <input type="password" class="form-control" name="password" value="${userBean.password}" >
                        </div>
                      </div>
                      
                       
                      <div class="form-group row">
                        <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Gender</label>
                      <div class="col-sm-9">
                        <select class="form-control" name="gender" id="gender">
                           <option value="-1">Select Gender</option>
                          <option>Male</option>
                          <option>Female</option>
                        </select>
                      </div>
                      </div>
                      
                      <div class="form-group row">
                        <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Contact Number</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="number" value="${userBean.number}">
                        </div>
                      </div>
                      
                       
                      <div class="form-group row">
                        <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Role</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="role" value="${userBean.role}">
                        </div>
                      </div>
                      
                      
                      
                
		
                     
                      <button type="submit" class="btn btn-gradient-primary me-2">Update User</button>
                      
                       <button class="btn btn-gradient-primary me-2" href="listuser">Cancel</button>
                      
                    
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
    
                 
                   
    







