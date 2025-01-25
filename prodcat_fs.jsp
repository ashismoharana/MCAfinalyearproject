<%@ page language="java" import="java.sql.*" %>
<%!
 Connection conn;
 Statement stmtUpdate,stmtDelete;
 String pccode,pcatname,btnup,btndel;
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
pccode=request.getParameter("cmbpcode");
pcatname=request.getParameter("txtpcat");
btnup=request.getParameter("btnUpdate");
btndel=request.getParameter("btnDelete");
doConnect();
try{
	if(btnup!=null)
	{
		stmtUpdate=conn.createStatement();
		stmtUpdate.executeUpdate("update schp_tblprodcatg set prodcname='"+pcatname+"' where prodccode='"+pccode+"'");
		out.println("your data updated succesfully");
	}
	else if(btndel!=null){
		stmtDelete=conn.createStatement();
		stmtDelete.executeUpdate("delete from schp_tblprodcatg where prodccode='"+pccode+"'");
		out.println("your data deleted succesfully");
	}
}
catch(SQLException se){
	out.println("error occured try again"+se);
}
%>