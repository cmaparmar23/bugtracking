<%@page import="com.grownited.bean.ModuleBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Module</title>
</head>
<body>
<h2>View Module</h2>

<%
	ModuleBean moduleBean=(ModuleBean)request.getAttribute("moduleBean");
%>

<b>ModuleId:</b><%=moduleBean.getModuleId() %><br><br>

Module Name:<%=moduleBean.getModuleName() %><br><br>

ProjectId:<%=moduleBean.getProjectId() %><br><br>

StatusId:<%=moduleBean.getStatusId() %><br><br>

Estimated Hours:<%=moduleBean.getEstimatedHours() %><br><br>

Total Utilized Hours:<%=moduleBean.getTotalUtilizedHours() %><br><br>

Document URL:<%=moduleBean.getDocumentUrl()%><br><br>

Description:<%=moduleBean.getDescription() %><br><br>


</body>
</html>