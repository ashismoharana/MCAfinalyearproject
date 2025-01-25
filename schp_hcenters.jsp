<%@ page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title> Inventory control system</title>
</head>
<%!
   String sno,hname,cper,loc,city,sname,phn,mail;
   Connection conn;
   Statement stmtsave;
   public void doConnect(){
   try{
       Class.forName("com.mysql.jdbc.Driver");
	   }
	catch(ClassNotFoundException cnfe){
	    System.out.println("Error1"+cnfe);
		}
	try{
	    conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/schpdb2023","root","root");
		}
	catch(SQLException se){
	   System.out.println("Error2");
	   }
	   }
	   %>
	   <%
	     sno=request.getParameter("txtsno");
		 hname=request.getParameter("txthname");
		 cper=request.getParameter("txtcper");
		 loc=request.getParameter("txtloc");
		 city=request.getParameter("txtcity");
		 sname=request.getParameter("txtsname");
		 phn=request.getParameter("txtphn");
		 mail=request.getParameter("txtmail");
		 doConnect();
		 try{
		 stmtsave=conn.createStatement();
		 stmtsave.executeUpdate("insert into schp_tblhcenter values('"+sno+"','"+hname+"','"+cper+"','"+loc+"','"+city+"','"+sname+"','"+phn+"','"+mail+"')");
out.println("<script language=\"javascript\">");
	out.println("alert(\"Your Data Saved Successfully\")");
	out.println("setTimeout(function(){window.location.href='schp_hcenterc.jsp'},100);");
	out.println("</script>");		 }
		 catch(SQLException se){
		 out.println("Registration fails!Try again");
		 }
		 %>
		 </body>
		 </html>