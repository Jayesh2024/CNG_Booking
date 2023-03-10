package CngBooking;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DbConnection.DBConnection;

/**
 * Servlet implementation class CngPumpLogin
 */
public class CngPumpLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CngPumpLogin() {
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
		
		String mob = request.getParameter("mobile");
		String pass = request.getParameter("pwd");
		
		try
		{
			Connection con = DBConnection.connect();
			PreparedStatement ptmt = con.prepareStatement("select * from cng_pump where mobileNo=? and 	password=?");
			ptmt.setString(1, mob);
			ptmt.setString(2, pass);
			ResultSet rs= ptmt.executeQuery();
			if(rs.next())
			{
				response.sendRedirect("CNGDash.html");
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
