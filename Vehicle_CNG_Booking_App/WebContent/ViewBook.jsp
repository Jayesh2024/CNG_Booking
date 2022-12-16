<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import = "java.sql.*" %>
    <%@ page import= "com.DbConnection.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>User View- Tables</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="CNGDash.html">
                <div class="sidebar-brand-icon rotate-n-15">
                   <!--  <i class="fas fa-laugh-wink"></i> -->
                </div>
                <div class="sidebar-brand-text mx-3">CNG User</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="CNGDash.html">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
              <li class="nav-item active">
               			 <a class="nav-link active" href="ViewBook.jsp">
                   			 <i class="fas fa-list fa-sm fa-fw mr-2"></i>
                   			 <span>View Todays Bookings</span>
                   		</a>
                   		
                   			 <li class="nav-item active">
               					 <a class="nav-link active" href="CngPumpView.jsp">
                   					 <i class="fas fa-fw fa-folder"></i>
                   					 <span>View CNG Pumps</span>
                   				</a>
                   				
                   					<li class="nav-item active">
               					 		<a class="nav-link active" href="UpdateCng.html">
                   							 <i class="fas fa-fw fa-wrench"></i>
                   							 <span>Update CNG Data</span>
                   						</a>
                   						 <hr class="sidebar-divider">
                   							<li class="nav-item active">
               									<a class="text-center nav-link active" href="CNGLogin.html">
                   									<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> 
                   									 <span>Log Out</span>
                   								</a>
                   							</li>
                   					</li>
                   			</li>
                   		</li>


            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in">
                                <!-- aria-labelledby="alertsDropdown"> -->
                                <h6 class="dropdown-header">
              
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>

              
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in">
                       
                                </h6>
                           
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_2.svg"
                                            alt="...">
                                        <div class="status-indicator"></div>
                                    </div>
                                 
                        <div class="topbar-divider d-none d-sm-block"></div>

                
                            </a>
                  

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="text-center h3 mb-2 text-gray-800">View Booked CNG</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">View Booked CNG Pumps</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
			                <thead>
			        			  <tr>
			         			   <th>ID</th>
			         			   <th>Pump_ID</th>
			         			   <th>Name</th>
			        		    	<th>Mobile</th>
			             			<th>CNG_kg</th>
			            
			          				  <%
											Connection con = DBConnection.connect();
											try
											{
												PreparedStatement ptmt = con.prepareStatement("select * from booking");
												ResultSet rs = ptmt.executeQuery();
								 
												while (rs.next())
												{
										%>
																		    	
																		    		 
											<tr>
							
												<td><%=rs.getInt("id") %></td>
												<td><%=rs.getInt("uid") %></td>
												<td><%=rs.getString("name") %></td>
												<td><%=rs.getString("mobile") %></td>
			   									<td><%=rs.getString("cng_kg") %></td>
								
				   							</tr>
																		    	
										 <% 
												}
										}
										catch(Exception e)
										{
											e.printStackTrace();
										}
										%>
          							</tr>
       							 </thead>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-primary text-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; By Jayesh Savle 2022</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

 
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>

</body>

</html>