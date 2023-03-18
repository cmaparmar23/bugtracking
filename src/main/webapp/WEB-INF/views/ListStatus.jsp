<%@page import="java.util.List"%>
<%@page import="com.grownited.bean.StatusBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bug Tracking | List Status</title>
</head>
<body>

<h3>List Status</h3>

<%
	List<StatusBean> list=(List<StatusBean>)request.getAttribute("list");
%>
<table border="1">
<tr>
	<th>StatusId</th>
	<th>StatusName</th>
	<th>Action</th>
</tr>
	<%
		for(StatusBean sb:list){
	%>
<tr>
	<td><%=sb.getStatusId() %></td>
	<td><%=sb.getStatusName() %></td>
	
	<td><a href="deletestatus/<%=sb.getStatusId()%>">Delete</a></td>
	</tr>
	
	<%
	}
%>
</table>
</body>
</html>