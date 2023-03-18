<%@page import="com.grownited.bean.ProjectBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Project</title>
</head>
<body>

<h2>View Project</h2>

<%
	ProjectBean projectBean=(ProjectBean)request.getAttribute("projectBean");
%>

<b>ProjectId:</b><%=projectBean.getProjectId() %><br><br>
Title:<%=projectBean.getTitle() %><br><br>
Description:<%=projectBean.getDescription() %><br><br>
TechnologyId:<%=projectBean.getTechnologyId()%><br><br>
Estimated Hours:<%=projectBean.getEstimatedHours() %><br><br>
Start Date:<%=projectBean.getStartDate()%><br><br>
Completion Date:<%= projectBean.getCompletionDate()%><br><br>
Utilized Hours:<%=projectBean.getUtilizedHours() %><br><br>
Status:<%=projectBean.getStatusId() %><br><br>

</body>
</html>