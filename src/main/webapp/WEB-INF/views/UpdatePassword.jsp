<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <!-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bug Tracking | Update Password</title>
</head>
<body>
<form action="updatemypassword" method="post">

Email: <input type="email" name="email"><br><br>
Password: <input type="password" name="password"><br><br>
Confirm Password: <input type="password" name="confirmPassword"><br><br>
OTP:<input type="text" name="otp"/>
<br><br>

<input type="submit" value="Update Password"/>

</form>

</body>
</html>
 -->
 
 <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bug Tracking | Update Password</title>
  <jsp:include page="AllCss.jsp"></jsp:include>
  </head>
  <body>
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth">
          <div class="row flex-grow">
            <div class="col-lg-4 mx-auto">
              <div class="auth-form-light text-left p-5">
                <div class="brand-logo">
                  <img src="../../assets1/images/logo.svg">
                </div>
                <h4>Bug Tracking</h4>
                <p class="font-weight-light">You are only one step a way from your new password, recover your password now.</p>
                <form class="pt-3" action="updatemypassword" method="post">
                
                
                  <div class="form-group">
                    <input type="email" class="form-control form-control-lg"  placeholder="Email" name="email">
                  </div>
                  <div class="form-group">
                    <input type="password" class="form-control form-control-lg"  placeholder="Password" name="password">
                  </div>
                  <div class="form-group">
                    <input type="password" class="form-control form-control-lg" placeholder="Confirm Password" name="confirmPassword">
                  </div>
                  <div class="form-group">
                    <input type="password" class="form-control form-control-lg"  placeholder="OTP" name="otp">
                  </div>
                  
                  
                  <div class="mt-3">
                    <button class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn" type="submit" >Update Password</button>
                  </div>
                  
                   <p class="mt-3 mb-1">
        <a href="login">Login</a>
      </p>
                </form>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="../../assets1/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="../../assets1/js/off-canvas.js"></script>
    <script src="../../assets1/js/hoverable-collapse.js"></script>
    <script src="../../assets1/js/misc.js"></script>
  
 