import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import yashodeep.Credential;

@WebServlet("/FileUploadServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)

/**
 * Servlet implementation class RaiseCnd
 */
public class RaiseCnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public static final String UPLOAD_DIR = "images";
    public String dbFileName = "";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RaiseCnd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		 
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		   response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        Part part = request.getPart("file");//
	        String fileName = extractFileName(part);//file name
	        String applicationPath = getServletContext().getRealPath("");
	        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
	        System.out.println("applicationPath:" + applicationPath);
	        File fileUploadDirectory = new File(uploadPath);
	        if (!fileUploadDirectory.exists()) {
	            fileUploadDirectory.mkdirs();
	        }
	        String savePath = uploadPath + File.separator + fileName;
	        System.out.println("savePath: " + savePath);
	        String sRootPath = new File(savePath).getAbsolutePath();
	        System.out.println("sRootPath: " + sRootPath);
	        part.write(savePath + File.separator);
	        File fileSaveDir1 = new File(savePath);
	        /*if you may have more than one files with same name then you can calculate some random characters
	         and append that characters in fileName so that it will  make your each image name identical.*/
	        dbFileName = UPLOAD_DIR + File.separator + fileName;
	        part.write(savePath + File.separator);
	        try{
				 Connection con=DBconnecter.connect();
				 String uaddress=request.getParameter("address");
				 String ucontact= request.getParameter("contact");
				 String udescription=request.getParameter("description");
				 String status="Pending";
		
				 String uemail= Credential.getEmail();
				 String sql="insert into cnd values(?,?,?,?,?,?,?,?)";
				 PreparedStatement pstmt = con.prepareStatement(sql);			 
				 pstmt.setInt(1,0); 
				 pstmt.setString(2,uemail);
				 pstmt.setString(3,uaddress);
			     pstmt.setString(4,ucontact);
				 pstmt.setString(5,udescription);
				 pstmt.setString(6,dbFileName);
				 pstmt.setString(7,savePath);
				 pstmt.setString(8,status);
				
				 
				 
				 int i =pstmt.executeUpdate();
					if(i>0)
					{
//					System.out.println("New account is Registered...!");
					response.sendRedirect("UserDashboard.html");
					}else
						response.sendRedirect("UserDashboard.html");	
			 }catch(Exception e)
			 {
				 e.printStackTrace();
			 }
	}
	        private String extractFileName(Part part) {//This method will print the file name.
	            String contentDisp = part.getHeader("content-disposition");
	            String[] items = contentDisp.split(";");
	            for (String s : items) {
	                if (s.trim().startsWith("filename")) {
	                    return s.substring(s.indexOf("=") + 2, s.length() - 1);
	                }
	            }
	            return "";


	}

}
