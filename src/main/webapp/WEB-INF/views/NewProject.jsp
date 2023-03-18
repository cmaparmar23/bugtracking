<%@page import="java.util.List"%>
<%@page import="com.grownited.bean.TechnologyBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bug Tracking | New project</title>
</head>
<body>

<%
	List<TechnologyBean> list = (List<TechnologyBean>) request.getAttribute("list");
%>
	
<form action="saveproject" method="post">
		
		
	
		Project Title:<input type="text" name ="title"/><br><br>
		Description:<input type="text" name ="description"/><br><br>
		
		TechnologyId<select name="TechnologyId">
		<%
			for(TechnologyBean tb:list){
		%>
		
		<option value="<%=tb.getTechnologyId()%>">
		<%=tb.getTechnologyName() %> </option>
		
		
		<%
			}
		%>
		
		</select><br><br>
		Estimated Hours:<input type="text" name ="estimatedHours"/><br><br>
		Start Date:<input type="date" name ="startDate"/><br><br>
		Completion Date:<input type="date" name ="completionDate"/><br><br>
		Utilized Hours:<input type="text" name ="utilizedHours"/><br><br>
		
		<input type="submit" value ="save Project"/>
		</form>
		<br><br>
	
		
	

</body>
</html>
