<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
Connection conn;
Statement stmtselect;
ResultSet rscode;
String sno,sname,pby,gend,loc,ct,state,cno,mid1,sfrom,sto;
int slno;
public void doconnect(){
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
<center>
<table width="99%"  border="0" >
<tr height="55">
<td align="center" bgcolor="black">
<font color="white" size="6">
<sub>
 <img src="back.png" title="Go Back" width="35" height="35" align="left" onclick="window.close()">
 </sub>
 Service Information</font>
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
<td><font color="white">Service No</td>
<td><font color="white">Service Name</td>
<td><font color="white">Provided By</td>
<td><font color="white">Gender</td>
<td><font color="white">Locality</td>
<td><font color="white">City</td>
<td><font color="white">State</td>
<td><font color="white">Contact No</td>
<td><font color="white">e-Mail Id</td>
<td><font color="white">Service Time-From</td>
<td><font color="white">To</td>
</tr>
<%
 doconnect();
 try{ 
  stmtselect=conn.createStatement();
  rscode=stmtselect.executeQuery("select * from schp_tblservice");
  slno=1;
  
  while(rscode.next()){
  sno=rscode.getString("serno");
  sname=rscode.getString("servtypname");
  pby=rscode.getString("provided");
  gend=rscode.getString("gender");
  loc=rscode.getString("loc");
  ct=rscode.getString("city");
  state=rscode.getString("state");
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
 <td><%=gend%></td>
 <td><%=loc%></td>
 <td><%=ct%></td>
 <td><%=state%></td>
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