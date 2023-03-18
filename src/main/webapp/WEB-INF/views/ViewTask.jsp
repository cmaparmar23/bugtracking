<%@page import="com.grownited.bean.TaskBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Task</title>
</head>
<body>
<h2>View Task</h2>

<%
	TaskBean taskBean=(TaskBean)request.getAttribute("taskBean");
%>

<b>TaskId:</b><%=taskBean.getTaskId() %><br><br>

Task Name:<%=taskBean.getTaskName() %><br><br>

ProjectId:<%=taskBean.getProjectId() %><br><br>

Estimated Hours:<%=taskBean.getEstimatedHours() %><br><br>

Total Utilized Hours:<%=taskBean.getTotalUtilizedHours() %><br><br>

Document URL:<%=taskBean.getDocumentUrl()%><br><br>

Description:<%=taskBean.getDescription() %><br><br>





</body>
</html>