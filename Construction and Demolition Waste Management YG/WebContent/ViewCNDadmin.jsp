<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager" %>
<%
String driver="com.mysql.jdbc.Driver";
String connectionUrl="jdbc:mysql://localhost:3306/";
String database ="wastemanagement";
String userid="root";
String password="";
try
{
	Class.forName(driver);

}
catch(ClassNotFoundException e)
{
	e.printStackTrace();
}
Connection con=null;
Statement stmt=null;
ResultSet rs=null;

%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="assets/img/favicon.png">
  <title>
    Argon Dashboard  by Yashodeep Patil
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="assets/css/argon-dashboard.css?v=2.0.0" rel="stylesheet" />
</head>

<body class="g-sidenav-show   bg-gray-100">
  <div class="min-height-300 bg-primary position-absolute w-100"></div>
   <aside class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4 " id="sidenav-main">
  <div class="sidenav-header">
    <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
    <a class="navbar-brand m-0" href=" # " target="_blank">
      
      <img src="./assets/img/logo-ct-dark.png" class="navbar-brand-img h-100" alt="main_logo">
      
      <span class="ms-1 font-weight-bold">Admin Dashboard</span>
    </a>
  </div>
  <hr class="horizontal dark mt-0">

  <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
    <ul class="navbar-nav">
  
<li class="nav-item">
  <a class="nav-link " href="AddVehicle.html">
    
      <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
        <i class="ni ni-calendar-grid-58 text-warning text-sm opacity-10"></i>
      </div>
    
    <span class="nav-link-text ms-1">Add Vehicle</span>
  </a>
</li>

  
<li class="nav-item">
  <a class="nav-link " href="ViewVehicle.jsp">
    
      <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
        <i class="ni ni-credit-card text-success text-sm opacity-10"></i>
      </div>
    
    <span class="nav-link-text ms-1">View Vehicle</span>
  </a>
</li>

  
<li class="nav-item">
  <a class="nav-link " href="DeleteVehicle.jsp">
    
      <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
        <i class="ni ni-app text-info text-sm opacity-10"></i>
      </div>
    
    <span class="nav-link-text ms-1">Delete Vehicle</span>
  </a>
</li>

  
<li class="nav-item">
  <a class="nav-link " href="UpdateVehicle.html">
    
      <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
        <i class="ni ni-world-2 text-danger text-sm opacity-10"></i>
      </div>
    
    <span class="nav-link-text ms-1">Update Vehicle Details</span>
  </a>
</li>

<a class="nav-link " href="ViewCNDadmin.jsp">
    
      <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
        <i class="ni ni-world-2 text-danger text-sm opacity-10"></i>
      </div>
    
    <span class="nav-link-text ms-1">View CND </span>
  </a>
</li>

<a class="nav-link " href="ApproveCNDadmin.jsp">
    
      <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
        <i class="ni ni-world-2 text-danger text-sm opacity-10"></i>
      </div>
    
    <span class="nav-link-text ms-1">Approve CND </span>
  </a>
</li>
    
<li class="nav-item">
  <a class="nav-link " href="index.html">
    
      <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
        <i class="ni ni-single-copy-04 text-warning text-sm opacity-10"></i>
      </div>
    
    <span class="nav-link-text ms-1">Sign Out</span>
  </a>
</li>   
    </ul>
  </div>

  
</aside>
  
  
  
  
  
  
  <main class="main-content position-relative border-radius-lg ">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl " id="navbarBlur" data-scroll="false">
      <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-white" href="javascript:;">Pages</a></li>
            <li class="breadcrumb-item text-sm text-white active" aria-current="page">Tables</li>
          </ol>
          <h6 class="font-weight-bolder text-white mb-0">Tables</h6>
        </nav>
    
	 
	 
	 
      </div>
    </nav>
    <!-- End Navbar -->
    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0">
              <h6>CND Request</h6>
            </div>
            <div class="card-body px-0 pt-0 pb-2">
              <div class="table-responsive p-0">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Id</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Email</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Address</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Title</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Description</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Image</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Status</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Mark As</th>
                    </tr>
                  </thead>
                  
                  <tbody>
                   <%
try{
String pending="pending";
con = DriverManager.getConnection(connectionUrl+database, userid, password);
stmt=con.createStatement();
String sql ="select * from cnd where status='pending'";
rs = stmt.executeQuery(sql);
int i=0;
while(rs.next()){
%>
                    <tr>
                      <td>
                        <div class="d-flex px-2 py-1">
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm"><%=rs.getString("id") %></h6>
                          </div>
                        </div>
                      </td>
                      <td class="align-middle text-center text-sm">
                        <span class="badge badge-sm bg-gradient-success"><%=rs.getString("email") %></span>
                      </td>
                      <td>
                        <p class="text-xs font-weight-bold mb-0"><%=rs.getString("address") %></p>
                      </td>
                      
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold"><%=rs.getString("title") %></span>
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold"><%=rs.getString("description") %></span>
                      </td>
                      <td class="align-middle text-center">
                        
                        <a href="display.jsp?id=<%= rs.getString("id")%>">View</a>
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold"><%=rs.getString("status") %></span>
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold"></span>
                      </td >
                      <td class="badge badge-sm bg-gradient-success">
                     
                     <script>
                     function showAlert1() {
                      alert ("Approve your request successfully..!");
                      }
                     </script>
                      <script>
                     function showAlert2() {
                      alert ("Disapprove your request successfully..!");
                      }
                     </script>

                    
                      <a href="approve.jsp?id=<%=rs.getString("id") %>"><button type="button" class="approve" onclick="showAlert1()">Approve</button></a>
                      
                      <a href="Disapprove.jsp?id=<%=rs.getString("id") %>"><button type="button" class="Disapprove" onclick="showAlert2()">Disapprove</button></a>
                      </td>
                      
                      
                    </tr>
                    <%
                      i++;
                      }
                      con.close();
                      }catch(Exception e)
                      {
	                   e.printStackTrace();
                      }
                      %>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
     
      <footer class="footer pt-3  ">
        <div class="container-fluid">
          <div class="row align-items-center justify-content-lg-between">
            <div class="col-lg-6 mb-lg-0 mb-4">
              <div class="copyright text-center text-sm text-muted text-lg-start">
                © <script>
                  document.write(new Date().getFullYear())
                </script>,
                made with <i class="fa fa-heart"></i> by
                <a href="#" class="font-weight-bold" target="_blank">Yashodeep Patil</a>
                
              </div>
            </div>
            
          </div>
        </div>
      </footer>
    </div>
  </main>
  <div class="fixed-plugin">
    <a class="fixed-plugin-button text-dark position-fixed px-3 py-2">
      <i class="fa fa-cog py-2"> </i>
    </a>
    <div class="card shadow-lg">
      <div class="card-header pb-0 pt-3 ">
        <div class="float-start">
          <h5 class="mt-3 mb-0">Yashodeep Configurator</h5>
          <p>See our dashboard options.</p>
        </div>
        <div class="float-end mt-4">
          <button class="btn btn-link text-dark p-0 fixed-plugin-close-button">
            <i class="fa fa-close"></i>
          </button>
        </div>
        <!-- End Toggle Button -->
      </div>
      <hr class="horizontal dark my-1">
      <div class="card-body pt-sm-3 pt-0 overflow-auto">
        <!-- Sidebar Backgrounds -->
        <div>
          <h6 class="mb-0">Sidebar Colors</h6>
        </div>
        <a href="javascript:void(0)" class="switch-trigger background-color">
          <div class="badge-colors my-2 text-start">
            <span class="badge filter bg-gradient-primary active" data-color="primary" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-dark" data-color="dark" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-info" data-color="info" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-success" data-color="success" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-warning" data-color="warning" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-danger" data-color="danger" onclick="sidebarColor(this)"></span>
          </div>
        </a>
        <!-- Sidenav Type -->
        <div class="mt-3">
          <h6 class="mb-0">Sidenav Type</h6>
          <p class="text-sm">Choose between 2 different sidenav types.</p>
        </div>
        <div class="d-flex">
          <button class="btn bg-gradient-primary w-100 px-3 mb-2 active me-2" data-class="bg-white" onclick="sidebarType(this)">White</button>
          <button class="btn bg-gradient-primary w-100 px-3 mb-2" data-class="bg-default" onclick="sidebarType(this)">Dark</button>
        </div>
        <p class="text-sm d-xl-none d-block mt-2">You can change the sidenav type just on desktop view.</p>
        <!-- Navbar Fixed -->
        <div class="d-flex my-3">
          <h6 class="mb-0">Navbar Fixed</h6>
          <div class="form-check form-switch ps-0 ms-auto my-auto">
            <input class="form-check-input mt-1 ms-auto" type="checkbox" id="navbarFixed" onclick="navbarFixed(this)">
          </div>
        </div>
        <hr class="horizontal dark my-sm-4">
        <div class="mt-2 mb-5 d-flex">
          <h6 class="mb-0">Light / Dark</h6>
          <div class="form-check form-switch ps-0 ms-auto my-auto">
            <input class="form-check-input mt-1 ms-auto" type="checkbox" id="dark-version" onclick="darkMode(this)">
          </div>
        </div>
     
      </div>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="assets/js/core/popper.min.js"></script>
  <script src="assets/js/core/bootstrap.min.js"></script>
  <script src="assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="assets/js/argon-dashboard.min.js?v=2.0.0"></script>
</body>

</html>