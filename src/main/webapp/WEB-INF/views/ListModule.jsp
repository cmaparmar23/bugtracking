<%@page import="com.grownited.bean.ModuleBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bug Tracking |List Module</title>

</head>
<body>
<h3>List Module</h3>

<%
	List<ModuleBean> list=(List<ModuleBean>)request.getAttribute("list");
%>
<table border="1">
	<tr>
		<th>ModuleId</th>
		<th>ModuleName</th>
		<th>ProjectId</th>
		<th>StatusId</th>
		<th>Action</th>
	</tr>
	
	<%
	for(ModuleBean mb:list){
%>


	<tr>
		<td><%=mb.getModuleId() %></td>
		<td><%=mb.getModuleName() %></td>
		<td><%=mb.getProjectId() %></td>
		<td><%=mb.getStatusId() %></td>
		<td><a href="deletemodule/<%=mb.getModuleId() %>">Delete</a>|
						<a href="viewmodule/<%=mb.getModuleId()%>">View</a></td>
		
		</td>
		
	</tr>
	<%
	}
	%>
</table>

</body>
</html>