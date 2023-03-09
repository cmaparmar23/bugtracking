<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forget Password</title>
</head>
<body>
<form action="sendotpforforgetpassword" method="post">

Email: <input type="Email" name="email"><br><br>


<input type="submit" value="Send Otp"/>

</form>
<br><br>
${error}
<a href="login">Login</a>

</body>
</html>