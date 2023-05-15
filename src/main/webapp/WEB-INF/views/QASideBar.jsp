

<nav class="sidebar sidebar-offcanvas" id="sidebar">

          <ul class="nav">
          
         
            <li class="nav-item nav-profile">
             <h4>Bug Tracking</h4>
              <a href="#" class="nav-link">
                <div class="nav-profile-image">
                  <img src="${user.imageUrl }" alt="profile">
                  <span class="login-status online"></span>
                  <!--change to offline or busy as needed-->
                </div>
                
                <div class="nav-profile-text d-flex flex-column">
                  <span class="font-weight-bold mb-2">${user.firstName}</span>
                  <span class="text-secondary text-small">${ user.role==4?"QA":" "} </span>
                </div>
                <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
              </a>
            </li>
            
            
            
            <li class="nav-item active">
              <a class="nav-link" href="developerdashboard">
                <span class="menu-title">Dashboard</span>
                <i class="mdi mdi-home menu-icon"></i>
              </a>
            </li>
           
          
           
             <li class="nav-item">
              <a class="nav-link" href="#">
                <span class="menu-title">Task</span>
          <i class="mdi mdi-format-list-bulleted menu-icon"></i>
              </a>
            </li>
           
            
            
            
            
            
             <li class="nav-item">
              <a class="nav-link" href="qa_profile">
                <span class="menu-title">My Profile</span>
                <i class="mdi mdi-table-large menu-icon"></i>
              </a>
            </li>
            
            
            
           
          </ul>
        </nav>
        
      <script src="assets1/vendors/js/vendor.bundle.base.js"></script>
  
  <!-- endinject -->
  <!-- Plugin js for this page -->
  
  <script src="assets1/vendors/chart.js/Chart.min.js"></script>
  <script src="assets1/js/jquery.cookie.js" type="text/javascript"></script>
  
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  
  <script src="assets1/js/off-canvas.js"></script> 
  <script src="assets1/js/hoverable-collapse.js"></script>
  <script src="assets1/js/misc.js"></script>
  
  <!-- endinject -->
  <!-- Custom js for this page -->
  
  <script src="assets1/js/dashboard.js"></script>
  <script src="assets1/js/todolist.js"></script>
  
  
 
  <!-- End custom js for this page -->
 