package CngBooking;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DbConnection.DBConnection;

/**
 * Servlet implementation class CngRegistration
 */
public class CngRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CngRegistration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		int id=0;
		String name =  request.getParameter("pname");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String tel = request.getParameter("taluka");
		String dist = request.getParameter("district");
		String mob = request.getParameter("mobile");
		String pass = request.getParameter("pwd");
		String optime = request.getParameter("open_time");
		String cltime = request.getParameter("close_time");
		String latu = request.getParameter("lattitude");
		String longi = request.getParameter("longitude");
		String cng_kg = request.getParameter("cng_kg");
		String status = "Pending";
		try
		{
			Connection con = DBConnection.connect();
			PreparedStatement ptmt = con.prepareStatement("insert into cng_pump values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ptmt.setInt(1, id);
			ptmt.setString(2, name);
			ptmt.setString(3, address);
			ptmt.setString(4, city);
			ptmt.setString(5, tel);
			ptmt.setString(6, dist);
			ptmt.setString(7, mob);
			ptmt.setString(8, pass);
			ptmt.setString(9, optime);
			ptmt.setString(10, cltime);
			ptmt.setString(11, latu);
			ptmt.setString(12, longi);
			ptmt.setString(13, cng_kg);
			ptmt.setString(14, status);
			
			int i = ptmt.executeUpdate();
			
			if(i>0)
			{
				response.sendRedirect("CNGLogin.html");
			}
			else
			{
				response.sendRedirect("404.html");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
