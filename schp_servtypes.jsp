<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<html>
	<head>
		<title>Service type info server page</title>
	</head>
<body>
<%!
		Connection conn;
		Statement stmtsave;
		String servcode,servname;
		public void doConnect(){
			try{
				Class.forName("com.mysql.jdbc.Driver");
			}
			catch(ClassNotFoundException ex){
				System.out.println("Unable to load driver");
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
		servcode=request.getParameter("txtservcode");
		servname=request.getParameter("txtservname");
	%>
	<%
	doConnect();
	try{
	   stmtsave=conn.createStatement();
	   stmtsave.executeUpdate("insert into schp_tblservtype values('"+servcode+"','"+servname+"')");
	   out.println("your data submitted succesfully");
	}
	catch(SQLException ex1)
	{
		out.println("Unable to save try again");
	}
	%>
	</body>
 </html>