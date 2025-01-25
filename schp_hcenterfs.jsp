<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title>SCHP</title>
</head>
<body>
<%!
   String sno,hname,cper,loc,city,sname,phn,mail,btnUp,btnDel;
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
		 hname=request.getParameter("txthname");
		 cper=request.getParameter("txtcper");
		 loc=request.getParameter("txtloc");
		 city=request.getParameter("txtcity");
		 sname=request.getParameter("txtsname");
		 phn=request.getParameter("txtphn");
		 mail=request.getParameter("txtmail");
		 btnUp=request.getParameter("btnupdate");
		 btnDel=request.getParameter("btndelete");
		 doConnect();
		 try{
		 stmtUpDel=conn.createStatement();
		 if(btnDel!=null){
		 stmtUpDel.executeUpdate("Delete from schp_tblhcenter where sno='"+sno+"'");
		 out.println("<script language=\"javascript\">");
	out.println("alert(\"Your Data Deleted Successfully\")");
	out.println("setTimeout(function(){window.location.href='schp_hcenterfc.jsp'},100);");
	out.println("</script>");
		 }
		 else
		 if(btnUp!=null){
		 stmtUpDel.executeUpdate("Update schp_tblhcenter set hname='"+hname+"',cper='"+cper+"',loc='"+loc+"',city='"+city+"',sname='"+sname+"',phn='"+phn+"',mail='"+mail+"' where sno='"+sno+"'");
out.println("<script language=\"javascript\">");
	out.println("alert(\"Your Data Updated Successfully\")");
	out.println("setTimeout(function(){window.location.href='schp_hcenterfc.jsp'},100);");
	out.println("</script>");		 }
		 }
		 catch(SQLException se){
		 out.println("operation failed!!!!!!!"+se);
		 }
		 %>
		 </body>
		 </html>