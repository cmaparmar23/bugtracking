
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
	List<ProjectBean> list=(List<ProjectBean>)request.getAttribute("list");
%>

<table border="1">

	<tr>
		<th>ProjectId</th>
		<th>Title</th>
		<th>TechnologyId</th>
		<th>Status Id </th>
		<th>Action</th>
	</tr>
	
<%
	for(ProjectBean pb:list){
%>

	
	<tr>
		<td><%=pb.getProjectId() %></td>
		<td><%=pb.getTitle() %></td>
		<td><%=pb.getTechnologyId() %></td>
		<td><%=pb.getStatusId() %></td>
	
	
		<td><a href="deleteproject/<%=pb.getProjectId() %>">Delete</a>|
		<a href="viewproject/<%=pb.getProjectId()%>">View</a></td>
	</tr>
	
<%
	}
%>
		
</table>
</body>
</html>