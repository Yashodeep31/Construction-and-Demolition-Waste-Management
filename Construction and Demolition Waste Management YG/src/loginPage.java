import yashodeep.Credential;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class loginPage
 */
public class loginPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = DBconnecter.connect();
		String Username=request.getParameter("email");
		Credential.setEmail(Username);
		String Password=request.getParameter ("password");
		String role=request.getParameter ("role");
		System.out.println(role);
		 try {
			 switch(role)
			 {
			 case "User":
			 {				
			    
				System.out.println("i am in user");
				String sql1="select*from user where email=? and password=?";
				PreparedStatement pstmt = con.prepareStatement(sql1);
				pstmt.setString(1,Username);
				pstmt.setString(2,Password);
				ResultSet rs=pstmt.executeQuery();
			    if(rs.next())
			    {			    	
			    	System.out.println("Login sucessfully..!");
			    	response.sendRedirect("UserDashboard.html");
			     }else
			       {
			    	System.out.println("Enter valid email and password ..!");
			    	 
			    	response.sendRedirect("#");
			    	}
				
				
			  }
		 	 case "Admin":
			  {
				System.out.println("i am in admin");
				String sql1="select* from admin where email=? and password=?";
				PreparedStatement pstmt = con.prepareStatement(sql1);
				pstmt.setString(1,Username);
				pstmt.setString(2,Password);
				ResultSet rs=pstmt.executeQuery();
			    if(rs.next())
			    {			    	
			    	System.out.println("Login sucessfully..!");
			    	response.sendRedirect("AdminDashboard.html");
			     }else
			       {
			    	System.out.println("Enter valid email and password ..!");
			         response.sendRedirect("#");
			    	}
			  }
			 }
		
		
		}catch(Exception e){
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
