<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
Connection conn;
Statement stmtselect;
ResultSet rscode;
String sno,sname,pby,add1,add2,cno,mid1,sfrom,sto;
int slno;
public void doconnect(){
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
  sname=request.getParameter("cmbsname");
%>

<center>
<table width="99%"  border="0" >
<tr height="55">
<td align="center" bgcolor="black">
<font color="white" size="6">
<sub>
 <img src="back.png" title="Go Back" width="35" height="35" align="left" onclick="window.close()">
 </sub>
 Service Information [ <%=sname%> ]</font>
</td></tr></table></center>

<br>
<blockquote>
 <font color="black" size="5"><b>Help Age Care Center</b></font><br>
<font color="black" size="4">CDA, Sec-6<br>
<font color="black" size="4">Cuttack<br>
</blockquote>
<center>

<table width="99%">
<tr bgcolor="Black" height="30">
<td><font color="white">Sl No.</td>
<td><font color="white">Serial No</td>
<td><font color="white">Service Category Name</td>
<td><font color="white">Provided By</td>
<td><font color="white">Address1</td>
<td><font color="white">Address2</td>
<td><font color="white">Contact No</td>
<td><font color="white">e-Mail Id</td>
<td><font color="white">Service Time-From</td>
<td><font color="white">To</td>
</tr>
<%
 doconnect();
 try{ 
  stmtselect=conn.createStatement();
  rscode=stmtselect.executeQuery("select * from schp_tblservice where servtypname='"+sname+"'");
  slno=1;
  
  while(rscode.next()){
  sno=rscode.getString("serno");
  sname=rscode.getString("servtypname");
  pby=rscode.getString("provided");
  add1=rscode.getString("loc");
  add2=rscode.getString("city");
  cno=rscode.getString("phoneno");
  mid1=rscode.getString("email");
  sfrom=rscode.getString("from1");
  sto=rscode.getString("to1");
 if(slno % 2 == 1)
	   out.println("<tr bgcolor=\"orange\">");
   else
	   out.println("</tr>");
 %>
 
 <td><%=slno%></td>
 <td><%=sno%></td>
 <td><%=sname%></td>
 <td><%=pby%></td>
 <td><%=add1%></td>
 <td><%=add2%></td>
 <td><%=cno%></td>
 <td><%=mid1%></td>
 <td><%=sfrom%></td>
 <td><%=sto%></td>
 </tr>
 <%
 slno=slno+1;
 }   // while ends
 }   // try ends
 catch(SQLException se){
 out.println("Unable to show Data"+se);
 }
 %>
 </table>
 </center>
 </body>
 </html>