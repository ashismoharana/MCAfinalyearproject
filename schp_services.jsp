<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
		Connection conn;
		Statement stmtsave;
		String srno,servtname,provide,gd,loc,ct,st,phn,email,fro,t;
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
		srno=request.getParameter("txtsno");
		servtname=request.getParameter("cmbservtypec");
		provide=request.getParameter("txtprovide");
		gd=request.getParameter("rbgender");
		loc=request.getParameter("txtloc");
		ct=request.getParameter("txtcity");
		st=request.getParameter("txtstate");
		phn=request.getParameter("txtpno");
		email=request.getParameter("txtmail");
		fro=request.getParameter("txtfrom");
		t=request.getParameter("txtto");
	%>
<%
	doConnect();
	try{
	   stmtsave=conn.createStatement();
	   stmtsave.executeUpdate("insert into schp_tblservice values('"+srno+"','"+servtname+"','"+provide+"','"+gd+"','"+loc+"','"+ct+"','"+st+"','"+phn+"','"+email+"','"+fro+"','"+t+"')");
	   out.println("your data submitted succesfully");
	}
	catch(SQLException ex1)
	{
		out.println("Unable to save try again");
	}
	%>
