package CngBooking;

import java.io.IOException;
import java.sql.*;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DbConnection.DBConnection;
import com.DbConnection.GetSet;

/**
 * Servlet implementation class UserBooking
 */
public class UserBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserBooking() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		int id = 0;
		   int Pid = GetSet.getId();
		   String name = GetSet.getN();
		   String mobile = GetSet.getMobile();
		   String cng_kg = request.getParameter("cng_kg");
		
			   try
				{
					Connection con = DBConnection.connect();
					PreparedStatement ptmt1 = con.prepareStatement("select * from cng_pump where cng_id=?");
					ptmt1.setInt(1, Pid);
					ResultSet rs = ptmt1.executeQuery();
					if(rs.next())
					{ 
						int pcng = Integer.parseInt(rs.getString("cng_kg"));
						int ncng = pcng-Integer.parseInt(cng_kg);
						if(pcng>=ncng)
						{
							PreparedStatement ptmt2 = con.prepareStatement("update cng_pump set cng_kg=? where cng_id=?");
							ptmt2.setInt(1, ncng);
							ptmt2.setInt(2, Pid);
							ptmt2.executeUpdate();
							
							PreparedStatement ptmt3 = con.prepareStatement("insert into booking values(?,?,?,?,?)");
							ptmt3.setInt(1, 0);
							ptmt3.setInt(2, Pid);
							ptmt3.setString(3, name);
							ptmt3.setString(4, mobile);
							ptmt3.setString(5, cng_kg);
					
							int i = ptmt3.executeUpdate();
							if(i>0)
							{
								response.sendRedirect("UserView.jsp");
							}
							else
							{
								
								response.sendRedirect("404.html");
							}
						}
						
					}
						  
			    }
			   catch(Exception e)
				{
				   e.printStackTrace();
				}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
	}

}
