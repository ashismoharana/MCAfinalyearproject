<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
		Connection conn;
		Statement stmtsave;
		String cname,pcname,pcode,pname,pri,stk,grate;
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
		cname=request.getParameter("cmbcname");
		pcname=request.getParameter("cmbpcat");
		pcode=request.getParameter("txtpcode");
		pname=request.getParameter("txtpname");
		pri=request.getParameter("txtprice");
		stk=request.getParameter("txtstock");
		grate=request.getParameter("cmbgper");
	%>
<%
	doConnect();
	try{
	   stmtsave=conn.createStatement();
	   stmtsave.executeUpdate("insert into schp_tblproductinfo values('"+cname+"','"+pcname+"','"+pcode+"','"+pname+"','"+pri+"','"+stk+"','"+grate+"')");
	   out.println("your data submitted succesfully");
	}
	catch(SQLException ex1)
	{
		out.println("Unable to save try again"+ex1);
	}
	%>
