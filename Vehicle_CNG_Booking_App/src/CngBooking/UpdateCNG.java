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
 * Servlet implementation class UpdateCNG
 */
public class UpdateCNG extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCNG() {
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
		Connection con = DBConnection.connect();
		
		String Mobile = request.getParameter("mobile");
		String pass = request.getParameter("pwd");
		System.out.println(Mobile);
		System.out.println(pass);
		int Kg = Integer.parseInt(request.getParameter("CNG_kg"));
		
		try 
		{
		
			PreparedStatement ptmt1 = con.prepareStatement("select * from cng_pump where mobileNo=? && password=? ");
			ptmt1.setString(1,Mobile);
			ptmt1.setString(2, pass);
			ResultSet rs = ptmt1.executeQuery();
			String lastCng="0";
			if(rs.next())
			{
				 lastCng=rs.getString(13);
				
			}
			
			System.out.println(lastCng);
	        int upadteCng=Integer.parseInt(lastCng) + Kg;
	        String updateCngKg = Integer.toString(upadteCng);
			
			PreparedStatement ptmt = con.prepareStatement("update cng_pump set cng_kg = ? where mobileNo = ? && password = ?");
			
			ptmt.setString(1, updateCngKg);
			ptmt.setString(2, Mobile);
			ptmt.setString(3, pass);
			
			int i = ptmt.executeUpdate();
			
			if(i>0)
			{
				System.out.println("Update Success....");
				response.sendRedirect("UpdateCng.html");
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
