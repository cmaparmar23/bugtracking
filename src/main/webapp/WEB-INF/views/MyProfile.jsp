<head>
<meta charset="ISO-8859-1">
<title>Bug Tracking |List Module</title>
<jsp:include page="AllCss.jsp"></jsp:include>
</head>
<body>
<jsp:include page="NavBar.jsp"></jsp:include>


<div class="container-fluid page-body-wrapper">

<jsp:include page="AdminSideBar.jsp"></jsp:include>
<div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title"> Module Tables </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="admindashboard">Dashboard</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Module</li>
                </ol>
              </nav>
            </div>
            <div class="row">
              
              
              <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                  
                  
                  <section class="section profile">
      <div class="row">
        <div class="col-xl-4">

          <div class="card">
            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

              <img src="assets1/profile/assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
              <h2>${user.firstName}</h2>
              <h3>${ user.role==1?"Admin":"ProjectManager"}</h3>
              <div class="social-links mt-2">
                <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>

        </div>

        <div class="col-xl-8">

          <div class="card">
            <div class="card-body pt-3">
                               <!-- Profile Edit Form -->
                  <form action="saveprofilepic" method="post" enctype="multipart/form-data">
                    <div class="row mb-3">
                      <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
                      <div class="col-md-8 col-lg-9">
                        <img src="${user.imageUrl }" alt="Profile">
                        <div class="pt-2">
                          <a href="#" class="btn btn-primary btn-sm" title="Upload new profile image"><i class="bi bi-upload"></i></a>
                          <a href="#" class="btn btn-danger btn-sm" title="Remove my profile image"><i class="bi bi-trash"></i></a>
                        </div>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="profileImg" type="file" class="form-control" id="fullName" >
                      </div>
                    </div>
                    
					<input type="hidden" name="userId" value="${user.userId }">
                  
                   


                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">Save Changes</button>
                    </div>
                  </form><!-- End Profile Edit Form -->

                </div>

                            </div><!-- End Bordered Tabs -->

            </div>
          </div>

        </div>
      </div>
    </section>
                   
                   
                   </div>    
                  </div>
                </div>
              </div>
            </div>
          </div>
          
       <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets1/profile/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets1/profile/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets1/profile/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets1/profile/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets1/profile/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets1/profile/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets1/profile/assets/vendor/simple-datatables/style.css" rel="stylesheet">
  
  
  
  
      
          
  <script src="assets1/profile/assets/js/main.js"></script>
  <jsp:include page="AllJs.jsp"></jsp:include>