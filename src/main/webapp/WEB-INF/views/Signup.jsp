<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BugTracking|Signup</title>
</head>
<body>
<form action="saveuser" method="post">
FirstName: <input type="text" name="firstName"><br><br>
LastName: <input type="text" name="lastName"><br><br>
Email: <input type="email" name="email"><br><br>
Password: <input type="password" name="password"><br><br>
Confirm Password: <input type="password" name="confirmPassword"><br><br>

		<br><br>

<input type="submit" value="Signup"/>

</form>
<br><br>
<a href="login">Login</a>

</body>
</html>