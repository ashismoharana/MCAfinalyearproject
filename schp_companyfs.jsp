<%@ page language="java" import="java.sql.*" %>
<%!
 Connection conn;
 Statement stmtUpdate,stmtDelete;
 String ccode,cname,cper,loc,ct,st,pno,email,gstno,dt1,btnup,btndel;
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
   ccode=request.getParameter("txtccode");
   cname=request.getParameter("txtcname");
   cper=request.getParameter("txtcperson");
   loc=request.getParameter("txtloc");
   ct=request.getParameter("txtcity");
   st=request.getParameter("cmbstate");
   pno=request.getParameter("txtpno");
   email=request.getParameter("txtemail");
   gstno=request.getParameter("txtgstno");
   dt1=request.getParameter("txtdt");
   btnup=request.getParameter("btnUpdate");
   btndel=request.getParameter("btnDelete");
   
doConnect();
try{
	if(btnup!=null)
	{
		stmtUpdate=conn.createStatement();
		stmtUpdate.executeUpdate("update schp_tblcompany set cname='"+cname+"',cperson='"+cper+"',locality='"+loc+"',city='"+ct+"',state='"+st+"',phoneno='"+pno+"',mail='"+email+"',gno='"+gstno+"',dt='"+dt1+"' where ccode='"+ccode+"'");
		out.println("your data updated succesfully");
	}
	else if(btndel!=null){
		stmtDelete=conn.createStatement();
		stmtDelete.executeUpdate("delete from schp_tblcompany where ccode='"+ccode+"'");
		out.println("your data deleted succesfully");
	}
}
catch(SQLException se){
	out.println("error occured try again"+se);
}
%>