<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<html>
	<head>
		<title>Company Information Server page</title>
	</head>
<body bgcolor="cyan">
<%!
  Connection conn;
  Statement stmtsave;
  String compcode,compname,cont,loc,ct,st,pno,email,gstno,dt;
  public void doConnect(){
	  try{
		  Class.forName("com.mysql.jdbc.Driver");
	  }
	  catch(ClassNotFoundException ex){
		  System.out.println("unable to load driver");
	  }
	  try{
		  conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/schpdb2023","root","root");
	  }
	  catch(SQLException ex2){
		  System.out.println("Unable to connect"+ex2);
	  }
  }
  %>
  <%
   compcode=request.getParameter("txtccode");
   compname=request.getParameter("txtcname");
   cont=request.getParameter("txtcperson");
   loc=request.getParameter("txtloc");
   ct=request.getParameter("txtcity");
   st=request.getParameter("cmbstate");
   pno=request.getParameter("txtpno");
   email=request.getParameter("txtemail");
   gstno=request.getParameter("txtgstno");
   dt=request.getParameter("txtdt");
   
   %>
   <%
   doConnect();
   try{
	   stmtsave=conn.createStatement();
	   stmtsave.executeUpdate("insert into schp_tblcompany values('"+compcode+"','"+compname+"','"+cont+"','"+loc+"','"+ct+"','"+st+"','"+pno+"','"+email+"','"+gstno+"','"+dt+"')");
	   out.println("your data submitted succesfully");
   }
   catch(SQLException ex1){
		 out.println("Unable to save try again");
   }

   %>
	</body>
</html>