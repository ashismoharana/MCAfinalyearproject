<%@ page language="java" import="java.sql.*" %>
<%!
 Connection conn;
 Statement stmtUpdate,stmtDelete;
 String servtcode,servtname,btnup,btndel;
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
servtcode=request.getParameter("cmbservtypec");
servtname=request.getParameter("txtservname");
btnup=request.getParameter("btnUpdate");
btndel=request.getParameter("btnDelete");
doConnect();
try{
	if(btnup!=null)
	{
		stmtUpdate=conn.createStatement();
		stmtUpdate.executeUpdate("update schp_tblservtype set servtypename='"+servtname+"' where servtypecode='"+servtcode+"'");
		out.println("your data updated succesfully");
	}
	else if(btndel!=null){
		stmtDelete=conn.createStatement();
		stmtDelete.executeUpdate("delete from schp_tblservtype where servtypecode='"+servtcode+"'");
		out.println("your data deleted succesfully");
	}
}
catch(SQLException se){
	out.println("error occured try again"+se);
}
%>