<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
   <!-- 
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
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bug Tracking| Forgot Password</title>
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
                <p class="font-weight-light">You forgot your password? Here you can easily retrieve a new password.</p>
                <form class="pt-3" action="sendotpforforgetpassword" method="post">
                  <div class="form-group">
                    <input type="email" class="form-control form-control-lg"  placeholder="Email" name="email">
                  </div>
                 
                  <div class="mt-3">
                    <button class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn" type="submit" >Send OTP</button>
                  </div>
                  
                   <p class="mt-3 mb-1">
        <a href="login">Login</a>
      </p>
      <p class="mb-0">
        <a href="signup" class="text-center">Register a new membership</a>
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
  </body>
  </html>