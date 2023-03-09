
<%@page import="com.grownited.bean.ProjectBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bug Tracking | List Project</title>
</head>
<body>




<h3>List Project</h3>

<%
	List<ProjectBean> listProject=(List<ProjectBean>)request.getAttribute("listProject");
%>
<table border="1">
	<tr>
		<th>ProjectId</th>
		<th>Title</th>
		<th>Description</th>
		<th>TecnologyId</th>
		<th>Estimated Hours</th>
		<th>Start Date</th>
		<th>Completion Date</th>
		<th>Utilized Hours</th>
		<th>Status Id </th>
		<th>Deleted</th>
		<th>Action</th>
	</tr>
	
<%
	for(ProjectBean pb:listProject){
%>

	
	<tr>
		<td><%=pb.getProjectId() %></td>
		<td><%=pb.getTitle() %></td>
		<td><%=pb.getDescription() %></td>
		<td><%=pb.getTechnologyId() %></td>
		<td><%=pb.getEstimatedHours() %></td>
		<td><%=pb.getStartDate() %></td>
		<td><%=pb.getCompletionDate() %></td>
		<td><%=pb.getUtilizedHours() %></td>
		<td><%=pb.getStatusId() %></td>
		<td><%=pb.getDeleted() %></td>
	
	
		<td><a href="deleteproject/<%=pb.getProjectId() %>">Delete</a></td>
	</tr>
	
<%
	}
%>
		
</table>
</body>
</html>