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
<title>Bug Tracking | Edit project </title>

<jsp:include page="AllCss.jsp"></jsp:include>

</head>
<body>


<jsp:include page="NavBar.jsp"></jsp:include>

<div class="container-fluid page-body-wrapper">

<jsp:include page="AdminSideBar.jsp"></jsp:include>

<div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title">Edit Project  </h3>
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
                 ProjectBean projectBean=(ProjectBean)request.getAttribute("projectBean");
					%>
					
					
					<%
						List<StatusBean> listStatus = (List<StatusBean>) request.getAttribute("listStatus");
					%>
                 
                 <form class="forms-sample"  action="updateproject" method="post">
                 
                   <input type="hidden" name="projectId" value="${projectBean.projectId }"/> 
                 
                 
                  <div class="form-group row">
                        <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Technology</label>
                        
                 <div class="input-group-prepend">
                  <div class="col-sm-9">
                          <select class="btn btn-sm btn-outline-primary dropdown-toggle" name ="TechnologyId"  data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
                            <option value="-1">Select Technology</option>

								<%
										for(TechnologyBean tb : list) {
		
	
								%>		
      								<option value = "<%=tb.getTechnologyId()%>"
      								<%=tb.getTechnologyId()==projectBean.getTechnologyId()? "selected":"" %>>
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
                          <input type="text" class="form-control" name="projectName" value="${projectBean.projectName}">
                        </div>
                      </div>
                        
                      
                      
                      <div class="form-group row">
                        <label for="exampleInputMobile" class="col-sm-3 col-form-label">Description</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="description" value="${projectBean.description }">
                        </div>
                      </div>
                      
                      
                      <div class="form-group row">
                        <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Estimated Hours</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="estimatedHours" value="${projectBean.estimatedHours }">
                        </div>
                      </div>
                      
                      
                      <div class="form-group row">
                        <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Start Date</label>
                        <div class="col-sm-9">
                          <input type="date" class="form-control" name="startDate" value="${projectBean.startDate}" >
                        </div>
                      </div>
                      
                       
                      <div class="form-group row">
                        <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Completion Date</label>
                        <div class="col-sm-9">
                          <input type="date" class="form-control" name="completionDate" value="${projectBean.completionDate }" >
                        </div>
                      </div>
                      
                      <div class="form-group row">
                        <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Utilized Hours</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="utilizedHours" value="${projectBean.utilizedHours }">
                        </div>
                      </div>
                      
                      
                      
                  <div class="form-group row">
                        <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Status</label>
                        
                 <div class="input-group-prepend">
                  <div class="col-sm-9">
                          <select  value="${statusBean.statusName }" class="btn btn-sm btn-outline-primary dropdown-toggle"   name ="StatusId"    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            
                      <option value="-1">Select Status</option>
                     <%
						for(StatusBean sb : listStatus) {
					%>		
      				<option value = "<%=sb.getStatusId()%>"
      				
      				<%=sb.getStatusId()==projectBean.getStatusId()? "Selected" : "" %>>
      					<%=sb.getStatusName()%>  </option>
      				<%
						}
      				%>
						</select>
        			 </div>
                  </div>
                </div>
		
                     
                      <button type="submit" class="btn btn-gradient-primary me-2">Update Project</button>
                      
                       <button class="btn btn-gradient-primary me-2" href="listproject">Cancel</button>
                      
                    
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
    	<script> function validateProject(){
    		technologyId=document.getElementById("technologyId");
    		isError=false;
    		if(technologyId.value=="-1"){
    			isError=true;
    		}
    	}
    	</script>
    
    </body>
    </html>
    
                 
                   
    







