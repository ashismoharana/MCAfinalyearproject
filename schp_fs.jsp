<%@ page language="java" import="java.sql.*" %>
<%!
 Connection conn;
 Statement stmtUpdate,stmtDelete;
 String regdno,regdate,oname,headorg,loc,ct,state,phn,mail,gstno,gstdate,btnup,btndel;
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
regdno=request.getParameter("cmbregdno");
regdate=request.getParameter("txtDt1");
oname=request.getParameter("txtOname");
headorg=request.getParameter("txtHead");
loc=request.getParameter("txtLoc");
ct=request.getParameter("txtCity");
state=request.getParameter("cmbstate");
phn=request.getParameter("txtPno");
mail=request.getParameter("txtemail");
gstno=request.getParameter("txtGSTNo");
gstdate=request.getParameter("txtDt2");
btnup=request.getParameter("btnUpdate");
btndel=request.getParameter("btnDelete");
doConnect();
try{
	if(btnup!=null)
	{
		stmtUpdate=conn.createStatement();
		stmtUpdate.executeUpdate("update schp_tblorgn set regddate='"+regdate+"',orgname='"+oname+"',horg='"+headorg+"',locality='"+loc+"',city='"+ct+"',state='"+state+"',pno='"+phn+"',email='"+mail+"',gstno='"+gstno+"',gdate='"+gstdate+"'where Rno='"+regdno+"'");
		out.println("your data updated succesfully");
	}
	else if(btndel!=null){
		stmtDelete=conn.createStatement();
		stmtDelete.executeUpdate("delete from schp_tblorgn where Rno='"+regdno+"'");
		out.println("your data deleted succesfully");
	}
}
catch(SQLException se){
	out.println("error occured try again"+se);
}
%>