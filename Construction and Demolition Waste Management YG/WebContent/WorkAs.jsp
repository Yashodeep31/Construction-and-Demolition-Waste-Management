<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "wastemanagement";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

%>
<%
String id = request.getParameter("id");
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
try
{
String completed="completed";
Class.forName(driverName);
con = DriverManager.getConnection(connectionUrl+database, userid, password);
String sql="Update cnd set status=? where id="+id;
ps = con.prepareStatement(sql);
ps.setString(1,completed);

int i = ps.executeUpdate();
if(i > 0)
{
response.sendRedirect("ApproveCNDadmin.jsp");
	
//out.print("Process completed Successfully");

}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>