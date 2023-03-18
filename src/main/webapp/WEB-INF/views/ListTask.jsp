<%@page import="com.grownited.bean.TaskBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bug Tracking | List Task</title>
</head>
<body>

<h3>List Task</h3>

<%
	List<TaskBean>listask= (List<TaskBean>)request.getAttribute("listtask");
%>
<table border="1">
	<tr>
		<th>TaskId</th>
		<th>TaskName</th>
		<th>ProjectId</th>
		<th>Action</th>
	</tr>
	
	<%
	for(TaskBean tb:listask){
%>


	<tr>
		<td><%=tb.getTaskId() %></td>
		<td><%=tb.getTaskName() %></td>
		<td><%=tb.getProjectId() %></td>
		<td><a href="deletetask/<%=tb.getTaskId() %>">Delete</a>|
				<a href="viewtask/<%=tb.getTaskId()%>">View</a></td>
		
		
	</tr>
		
		
		
	<%
	}
%>
		


</table>


</body>
</html>