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
import com.DbConnection.GetSet;

/**
 * Servlet implementation class ULogin
 */
public class ULogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ULogin() {
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
		
		String email = request.getParameter("email");
		String pass = request.getParameter("pwd");
		
		try
		{
			Connection con = DBConnection.connect();
			PreparedStatement ptmt = con.prepareStatement("select * from user where email=? and password=?");
			ptmt.setString(1, email);
			ptmt.setString(2, pass);
			ResultSet rs= ptmt.executeQuery();
			String name=null,mob=null;
			if(rs.next())
			{
				name=rs.getString(2);
				GetSet.setN(name);
				mob=rs.getString(4);
				GetSet.setMobile(mob);
				response.sendRedirect("UserDash.html");
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
