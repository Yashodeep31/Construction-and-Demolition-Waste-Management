

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateVehicle
 */
public class UpdateVehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateVehicle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = DBconnecter.connect();
		int vnum = Integer.parseInt(request.getParameter("vnum"));
		String dname = request.getParameter("dname");
		String dcontact = request.getParameter("dcontact");	
		System.out.println(vnum);
		System.out.println(dname);
		System.out.println(dcontact);
        try {
			
			String sql = "update vehicle set dname=?,dcontact=? where vnum=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			
			pstmt.setString(1,dname);
			pstmt.setString(2,dcontact);
			pstmt.setInt(3,vnum);
						
			int i=pstmt.executeUpdate();
			
			System.out.println("Vehicle details updated");
			//response.getWriter().append("Employee Added ");
			
			if (i>0){
			
			response.sendRedirect("AdminDashboard.html");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
