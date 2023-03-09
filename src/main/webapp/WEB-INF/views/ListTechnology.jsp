
<%@page import="com.grownited.bean.TechnologyBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bug Tracking | List Technology</title>
</head>
<body>




<h3>List Technology</h3>

<%
	List<TechnologyBean> list=(List<TechnologyBean>)request.getAttribute("list");
%>
<table border="1">
	<tr>
		<th>TechnologyId</th>
		<th>TechnologyName</th>
		<th>Deleted?</th>
		<th>Action</th>
	</tr>
	
<%
	for(TechnologyBean tb:list){
%>

	
	<tr>
		<td><%=tb.getTechnologyId()%></td>
		<td><%=tb.getTechnologyName() %></td>
		<td><%=tb.getDeleted() %></td>
		<td><a href="deletetechnology/<%=tb.getTechnologyId() %>">Delete</a>|
		<a href="viewtechnology/<%=tb.getTechnologyId()%>">View</a></td>
	</tr>
	
<%
	}
%>
		
</table>
</body>
</html>