<%@ page language="java" import="java.sql.*" %>
<%!
 Connection conn;
 Statement stmtUpdate,stmtDelete;
 String srno,servtname,proby,gd,loc,city,state,phn,email,fr,t,btnup,btndel;
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
srno=request.getParameter("cmbsrno");
servtname=request.getParameter("cmbservtypec");
proby=request.getParameter("txtprovide");
gd=request.getParameter("rbgender");
loc=request.getParameter("txtloc");
city=request.getParameter("txtcity");
state=request.getParameter("txtstate");
phn=request.getParameter("txtpno");
email=request.getParameter("txtmail");
fr=request.getParameter("txtfrom");
t=request.getParameter("txtto");
btnup=request.getParameter("btnUpdate");
btndel=request.getParameter("btnDelete");
doConnect();
try{
	if(btnup!=null)
	{
		stmtUpdate=conn.createStatement();
		stmtUpdate.executeUpdate("update schp_tblservice set servtypname='"+servtname+"',provided='"+proby+"',gender='"+gd+"',loc='"+loc+"',city='"+city+"',state='"+state+"',phoneno='"+phn+"',email='"+email+"',from1='"+fr+"',to1='"+t+"' where serno='"+srno+"'");
		out.println("your data updated succesfully");
	}
	else if(btndel!=null){
		stmtDelete=conn.createStatement();
		stmtDelete.executeUpdate("delete from schp_tblservice where serno='"+srno+"'");
		out.println("your data deleted succesfully");
	}
}
catch(SQLException se){
	out.println("error occured try again"+se);
}
%>