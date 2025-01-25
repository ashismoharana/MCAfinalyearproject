<%@ page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title>SCHP</title>
</head>
<%!
   String rno,fname,gen,dob,abt,pno,loc,city,state,phn;
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
	     rno=request.getParameter("txtregd");
		 fname=request.getParameter("txtfname");
		 gen=request.getParameter("rbgen");
		 dob=request.getParameter("dtdob");
		 abt=request.getParameter("txtage");
		 pno=request.getParameter("txtpno");
		 loc=request.getParameter("txtloc");
         city=request.getParameter("cmbcname");
         state=request.getParameter("cmbstate");
         phn=request.getParameter("txtphn");
		 doConnect();
		 try{
		 stmtsave=conn.createStatement();
		 stmtsave.executeUpdate("insert into schp_tblregd values('"+rno+"','"+fname+"','"+gen+"','"+dob+"','"+abt+"','"+pno+"','"+loc+"','"+city+"','"+state+"','"+phn+"')");
		 out.println("<script language=\"javascript\">");
	out.println("alert(\"Your Data Saved Successfully\")");
	out.println("setTimeout(function(){window.location.href='schp_regdc.jsp'},100);");
	out.println("</script>");
		 }
		 catch(SQLException se){
		 out.println("Registration fails!Try again"+se);
		 }
		 %>
		 </body>
		 </html>
        