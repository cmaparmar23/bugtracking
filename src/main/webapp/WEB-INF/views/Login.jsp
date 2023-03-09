<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<form action="authentication" method="post">


Email: <input type="Email" name="email"><br><br>
Password: <input type="Password" name="password"><br>
<br><input type="submit" value="Login"/>
</form>
${error}
<br>
<a href="signup">Signup</a> | <a href="forgetpassword">ForgetPassword</a>

</body>
</html>