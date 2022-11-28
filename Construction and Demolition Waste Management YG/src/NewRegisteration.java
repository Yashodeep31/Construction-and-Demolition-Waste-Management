

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NewRegisteration
 */
public class NewRegisteration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewRegisteration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con=DBconnecter.connect();
		
		 try{
			 
			 String uname=request.getParameter("name");
			 String ucontact= request.getParameter("contact");
			 String uemail=request.getParameter("email");
			 String upass=request.getParameter("password");
			 String uprofession=request.getParameter("profession");
			 String uaddress=request.getParameter("address");
			 String sql="insert into user values(?,?,?,?,?,?,?)";
			 PreparedStatement pstmt = con.prepareStatement(sql);			 
			 pstmt.setInt(1,0); 
			 pstmt.setString(2,uname);
		     pstmt.setString(3,ucontact);
			 pstmt.setString(4,uemail);
			 pstmt.setString(5, upass);
			 pstmt.setString(6,uprofession);
			 pstmt.setString(7,uaddress);
			 
			 int i =pstmt.executeUpdate();
				if(i>0)
				{
//				System.out.println("New account is Registered...!");
				response.sendRedirect("#");
				}else
					response.sendRedirect("index.html");	
		 }catch(Exception e)
		 {
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
