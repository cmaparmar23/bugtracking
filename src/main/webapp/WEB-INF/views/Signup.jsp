<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bug Tracking | Signup</title>
<jsp:include page="AllCss.jsp"></jsp:include>

</head>
<body>

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
                <h6 class="font-weight-light">Signing up is easy. It only takes a few steps</h6>
                <form class="pt-3"  action="saveuser" method="post">
                  <div class="form-group">
                    <input type="text" class="form-control form-control-lg"  placeholder="Firstname"   name="firstName" id="firstName">
                    <span class="error" id="firstNameError"></span>
                  </div>
                  
                  
                  <div class="form-group">
                    <input type="text" class="form-control form-control-lg" placeholder="Last name" name="lastName" id="lastName">
                    <span class="error" id="lastNameError"></span>
                    <span class="error" id="emailError"></span>
                    
                  </div>
                  
                  <div class="form-group">
                       
                        <select class="form-control form-control-lg" placehoder="gender" name="gender" id="gender">
                          <option>Male</option>
                          <option>Female</option>
                        </select>
                      </div>
                      
                      <div class="form-group">
                    <input type="text" class="form-control form-control-lg" id="number"  name="number" placeholder="Contact Number">
                  </div>
                      
                     
                      
                  <div class="form-group">
                    <input type="email" class="form-control form-control-lg" placeholder="Email" name="email" id="email">
                    <!--  <div style="color:red;" >${error}</div>-->
                    
                    
                    
                  </div>
                 
                  <div class="form-group">
                    <input type="password" class="form-control form-control-lg"  placeholder="Password" name="password" id="password">
                    <span class="error" id="passwordError"></span>
                  </div>
                  
                  
                  <div class="form-group">
                    <input type="password" class="form-control form-control-lg" placeholder="Retype password" name="confirmPassword" id="confirmPassword">
                    <span class="error" id="confirmPassword"></span>
                    
                  </div>
                  
                  
                  <div class="mb-4">
                    <div class="form-check">
                      <label class="form-check-label text-muted">
                        <input type="checkbox" class="form-check-input"> I agree to all Terms &amp; Conditions <i class="input-helper"></i></label>
                    </div>
                  </div>
                  <div class="mt-3">
                  <button class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn" onclick="validation()">SIGN UP</button>
                   
                  </div>
                  <div class="text-center mt-4 font-weight-light"> Already have an account? <a href="login" class="text-primary">Login</a>
                  </div>
                </form>
                
                
                 <script type="text/javascript">
        a = 10;
        console.log(a);


        function validation() {
            firstName = document.getElementById("firstName");
            firstNameError = document.getElementById("firstNameError");
            firstNameRegex = /^[a-zA-Z]+$/;
            
            lastName = document.getElementById("lastName");
            lastNameError = document.getElementById("lastNameError");
            lastNameRegex = /^[a-zA-Z]+$/;

            email = document.getElementById("email")
            emailError = document.getElementById("emailError");
            emailRegex = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9-]{2,3}$/;
            
          

            if (firstName.value == '') {
                firstNameError.innerHTML = "Please Enter FirstName"
            } else {
                if (firstNameRegex.test(firstName.value) == false) {
                    firstNameError.innerHTML = "Please Enter Valid FirstName";

                } else {
                    firstNameError.innerHTML = "";

                }
            }

            if (lastName.value == '') {
                lastNameError.innerHTML = "Please Enter LastName"
            } else {
                if (lastNameRegex.test(lastName.value) == false) {
                    lastNameError.innerHTML = "Please Enter Valid LastName";

                } else {
                    lastNameError.innerHTML = "";

                }
            }
            if (email.value == '') {
                emailError.innerHTML = "Please Enter Email"
            } else {
                if (emailRegex.test(email.value) == false) {
                    emailError.innerHTML = "Please Enter Valid Email"
                } else {
                    emailError.innerHTML = "";
                }
            }
        }
       
    
    </script>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    
   
  
	<jsp:include page="AllJs.jsp"></jsp:include>


</body>
</html>