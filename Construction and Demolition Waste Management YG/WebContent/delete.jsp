<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager" %>

<%
String id=request.getParameter("srno");
try
{
	
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wastemanagement", "root", "");	
	
Statement st=con.createStatement();
int i=st.executeUpdate("delete from vehicle where srno="+id);
if(i>0){
	 response.sendRedirect("DeleteVehicle.jsp");
	}
//out.println("Data Deleted Successfully!");

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>