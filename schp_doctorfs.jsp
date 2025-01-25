<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title>SCHP</title>
</head>
<body>
<%!
   String sno,dname,gen,dept,loc,city,sname,hcare,phn,mail,time1,time2,btnUp,btnDel;
   Connection conn;
   Statement stmtUpDel;
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
	     sno=request.getParameter("cmbsno");
		 dname=request.getParameter("txtdname");
		 gen=request.getParameter("rbgen");
		 dept=request.getParameter("txtdept");
		 loc=request.getParameter("txtloc");
		 city=request.getParameter("cmbcname");
		 sname=request.getParameter("txtsname");
		 hcare=request.getParameter("cmbhname");
		 phn=request.getParameter("txtphn");
		 mail=request.getParameter("txtmail");
		 time1=request.getParameter("txttfrom");
		 time2=request.getParameter("txttto");
		 btnUp=request.getParameter("btnUpdate");
		 btnDel=request.getParameter("btnDelete");
		 doConnect();
		 try{
		 stmtUpDel=conn.createStatement();
		 if(btnDel!=null){
		 stmtUpDel.executeUpdate("Delete from schp_tbldoctor where sno='"+sno+"'");
		 out.println("<script language=\"javascript\">");
	out.println("alert(\"Your Data Deleted Successfully\")");
	out.println("setTimeout(function(){window.location.href='schp_doctorfc.jsp'},100);");
	out.println("</script>");
		 }
		 else
		 if(btnUp!=null){
		 stmtUpDel.executeUpdate("Update schp_tbldoctor set dname='"+dname+"',gen='"+gen+"',dept='"+dept+"',loc='"+loc+"',city='"+city+"',sname='"+sname+"',hcare='"+hcare+"',phn='"+phn+"',mail='"+mail+"',time1='"+time1+"',time2='"+time2+"' where sno='"+sno+"'");
out.println("<script language=\"javascript\">");
	out.println("alert(\"Your Data Updated Successfully\")");
	out.println("setTimeout(function(){window.location.href='schp_doctorfc.jsp'},100);");
	out.println("</script>");		 }
		 }
		 catch(SQLException se){
		 out.println("operation failed!!!!!!!"+se);
		 }
		 %>
		 </body>
		 </html>