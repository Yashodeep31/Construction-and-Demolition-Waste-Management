

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddVehicle
 */
public class AddVehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddVehicle() {
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
		String latitude = request.getParameter("latitude");
		String longitude = request.getParameter("longitude");
		System.out.println(vnum);
		System.out.println(dname);
		System.out.println(dcontact);
		System.out.println(latitude);
		System.out.println(longitude);
		try {
			
			String sql = "insert into vehicle values(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			
			pstmt.setInt(1,0);
			pstmt.setInt(2,vnum);
			pstmt.setString(3,dname);
			pstmt.setString(4,dcontact);
			pstmt.setString(5,latitude);
			pstmt.setString(6,longitude);
			
			int i=pstmt.executeUpdate();
			
			System.out.println("Vehicle Added");
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
