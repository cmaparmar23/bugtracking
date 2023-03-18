<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bug Tracking | New Task</title>
</head>
<body>

<form action="savetask" method="post">

		Task Name:<input type="text" name ="taskName"/><br><br>
		Estimated Hours:<input type="text" name ="estimatedHours"/><br><br>
		Total Utilized Hours:<input type="text" name ="totalUtilizedHours"/><br><br>
		Document Url:<input type="text" name ="documentUrl"/><br><br>
		Description:<input type="text" name ="description"/><br><br>
		
		<input type="submit" value ="save Task"/>
	


</form>

</body>
</html>