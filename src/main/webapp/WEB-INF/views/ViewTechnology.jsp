<%@page import="com.grownited.bean.TechnologyBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>view Technology</title>
</head>
<body>
<h2>View Technology</h2>

<%
 TechnologyBean technologyBean=(TechnologyBean)request.getAttribute("technologyBean");

%>

TechnologyId:<%=technologyBean.getTechnologyId()%><br>
TechnologyName:<%=technologyBean.getTechnologyName() %><br>
Delete:<%=technologyBean.getDeleted()%><br>


</body>
</html>