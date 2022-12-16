<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.sql.*" %>
    <%@ page import= "com.DbConnection.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Delete Pump - Table</title>

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
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="AdminDash.html">
                <div class="sidebar-brand-icon rotate-n-15">
                   <!--  <i class="fas fa-laugh-wink"></i> -->
                </div>
                <div class="sidebar-brand-text mx-3">CNG Admin </div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="AdminDash.html">
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
                <a class="nav-link active" href="AdminView.jsp">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>View CNG Pumps</span>
                 </a> 
                  
                     <li class="nav-item active">
               			 <a class="nav-link active" href="ApprovePump.jsp">
                   			 <i class="fas fa-fw fa-cog"></i>
                   			 <span>Approve CNG Pumps</span>
                   		</a>
                   		
                   			 <li class="nav-item active">
               					 <a class="nav-link active" href="DeletePump.jsp">
                   					 <i class="fas fa-fw fa-wrench"></i>
                   					 <span>Delete CNG Pumps</span>
                   				</a>
                   				 <hr class="sidebar-divider">
                   					<li class="nav-item active">
               							<a class="text-center nav-link active" href="AdminLogin.html">
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

                        </li>

                      
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in">
                               
                                </h6>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="text-center h3 mb-2 text-gray-800">CNG PUMP Status</h1>
     
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">CNG Pump Status</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
							          <tr>
							            <th>ID</th>
							            <th>Pump_Name</th>
							            <th>Address</th>
							            <th>City</th>
							            <th>Taluka</th>
							            <th>District</th>
							            <th>Mobile</th>
							            <th>Password</th>
							            <th>Open_Time</th>
							            <th>Close_Time</th>
							       <!-- <th>Lattitude</th>
							            <th>Longitude</th> -->
							            <th>CNG Kg</th>
							            <th>Delete Pump</th>
							            
							            <%
											Connection con = DBConnection.connect();
											try
											{
												PreparedStatement ptmt = con.prepareStatement("select * from  cng_pump ");
												ResultSet rs = ptmt.executeQuery();
												String cls="active";
												while (rs.next())
												{
										%>
																						    															    	
										<tr>											    		  
											<td><%=rs.getInt("cng_id") %></td>
											<td><%=rs.getString("pump_name") %></td>
											<td><%=rs.getString("address") %></td>
											<td><%=rs.getString("city") %></td>
											<td><%=rs.getString("taluka") %></td>
											<td><%=rs.getString("district") %></td>
											<td><%=rs.getString("mobileNo") %></td>
											<td><%=rs.getString("password") %></td>
											<td><%=rs.getString("open_time") %></td>
											<td><%=rs.getString("close_time") %></td>
									   <!-- <td><%=rs.getString("latitude") %></td>
											<td><%=rs.getString("longitude") %></td> -->
											<td><%=rs.getString("cng_kg") %></td>
											<td><a href="PumpDelete.jsp?id=<%=rs.getInt(1)%>">Delete</a></td>									    		
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