<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<html>
	<head>
		<title>Server page</title>
	</head>
<body>
<%!
  Connection conn;
  Statement stmtsave;
  String regdno,regdate,oname,headorg,loc,ct,state,phn,mail,gst,gstdate;
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
   regdno=request.getParameter("txtRno");
   regdate=request.getParameter("txtDt1");
   oname=request.getParameter("txtOname");
   headorg=request.getParameter("txtHead");
   loc=request.getParameter("txtLoc");
   ct=request.getParameter("txtCity");
   state=request.getParameter("cmbstate");
   phn=request.getParameter("txtPno");
   mail=request.getParameter("txtemail");
   gst=request.getParameter("txtGSTNo");
   gstdate=request.getParameter("txtDt2");
   %>
   <%
   doConnect();
   try{
	   stmtsave=conn.createStatement();
	   stmtsave.executeUpdate("insert into schp_tblorgn values('"+regdno+"','"+regdate+"','"+oname+"','"+headorg+"','"+loc+"','"+ct+"','"+state+"','"+phn+"','"+mail+"','"+gst+"','"+gstdate+"')");
	   out.println("your data submitted succesfully");
   }
   catch(SQLException ex1){
		 out.println("Unable to save try again");
   }

   %>
	</body>
</html>