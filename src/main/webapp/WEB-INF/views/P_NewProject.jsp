<%@page import="com.grownited.bean.StatusBean"%>
<%@page import="com.grownited.bean.TechnologyBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bug Tracking | New project </title>

<jsp:include page="AllCss.jsp"></jsp:include>

</head>
<body>


<jsp:include page="NavBar.jsp"></jsp:include>

<div class="container-fluid page-body-wrapper">

<jsp:include page="ProjectManagerSideBar.jsp"></jsp:include>

<div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title">Add Project  </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="admindashboard">Dashboard</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Project</li>
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
					List<TechnologyBean> list = (List<TechnologyBean>) request.getAttribute("list");
					%>
					
					
					<%
						List<StatusBean> listStatus = (List<StatusBean>) request.getAttribute("listStatus");
					%>
                 
                 <form class="forms-sample"  action="p_saveproject" method="post">
                 
                 
                  <div class="form-group row">
                        <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Technology</label>
                        
                 <div class="input-group-prepend">
                  <div class="col-sm-9">
                          <select class="btn btn-sm btn-outline-primary dropdown-toggle" name ="TechnologyId"  data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            

								<%
										for(TechnologyBean tb : list) {
		
	
								%>		
      								<option value = "<%=tb.getTechnologyId()%>">
      								<%=tb.getTechnologyName()%>  </option>
      								<%
										}
     								 %>
         				</select>
        			 </div>
                  </div>
                </div>
                     
                      <div class="form-group row">
                        <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Project Name</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="projectName">
                        </div>
                      </div>
                      
                      
                      
                      <div class="form-group row">
                        <label for="exampleInputMobile" class="col-sm-3 col-form-label">Description</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="description">
                        </div>
                      </div>
                      
                      
                      <div class="form-group row">
                        <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Estimated Hours</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="estimatedHours">
                        </div>
                      </div>
                      
                      
                      <div class="form-group row">
                        <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Start Date</label>
                        <div class="col-sm-9">
                          <input type="date" class="form-control" name="startDate" >
                        </div>
                      </div>
                      
                       
                      <div class="form-group row">
                        <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Completion Date</label>
                        <div class="col-sm-9">
                          <input type="date" class="form-control" name="completionDate" >
                        </div>
                      </div>
                      
                      <div class="form-group row">
                        <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Utilized Hours</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="utilizedHours">
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
      				<option value = "<%=sb.getStatusId()%>">
      					<%=sb.getStatusName()%>  </option>
      				<%
						}
      				%>
						</select>
        			 </div>
                  </div>
                </div>
		
                     
                      <button type="submit" class="btn btn-gradient-primary me-2">Save Project</button>
                    
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
    
                 
                   
    







