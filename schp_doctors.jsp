<%@ page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title> Inventory control system</title>
</head>
<%!
   String sno,dname,gen,dept,loc,city,sname,hcare,phn,mail,time1,time2;
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
		 dname=request.getParameter("txtdname");
		 gen=request.getParameter("rbgen");
		 dept=request.getParameter("cmbdept");
		 loc=request.getParameter("txtloc");
		 city=request.getParameter("cmbcname");
		 sname=request.getParameter("txtsname");
		 hcare=request.getParameter("cmbhname");
		 phn=request.getParameter("txtphn");
		 mail=request.getParameter("txtmail");
		 time1=request.getParameter("txttfrom");
		 time2=request.getParameter("txttto");
		 doConnect();
		 try{
		 stmtsave=conn.createStatement();
		 stmtsave.executeUpdate("insert into schp_tbldoctor values('"+sno+"','"+dname+"','"+gen+"','"+dept+"','"+loc+"','"+city+"','"+sname+"','"+hcare+"','"+phn+"','"+mail+"','"+time1+"','"+time2+"')");
out.println("<script language=\"javascript\">");
	out.println("alert(\"Your Data Saved Successfully\")");
	out.println("setTimeout(function(){window.location.href='schp_doctorc.jsp'},100);");
	out.println("</script>");		 }
		 catch(SQLException se){
		 out.println("Registration fails!Try again");
		 }
		 %>
		 </body>
		 </html>