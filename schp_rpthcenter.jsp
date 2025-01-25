<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
Connection conn;
Statement stmtselect;
ResultSet rscode;
String sno,hname,cper,loc,city,sname,phn,mail;
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
 Health Center Information</font>
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
<td><font color="white">Health Center Name</td>
<td><font color="white">Contact Person</td>
<td><font color="white">Locality</td>
<td><font color="white">City</td>
<td><font color="white">State Name</td>
<td><font color="white">Phone</td>
<td><font color="white">Mail</td>
</tr>
<%
 doconnect();
 try{ 
  stmtselect=conn.createStatement();
  rscode=stmtselect.executeQuery("select * from schp_tblhcenter");
  slno=1;
  
  while(rscode.next()){
  sno=rscode.getString("sno");
  hname=rscode.getString("hname");
  cper=rscode.getString("cper");
  loc=rscode.getString("loc");
  city=rscode.getString("city");
  sname=rscode.getString("sname");
  phn=rscode.getString("phn");
  mail=rscode.getString("mail");
 if(slno % 2 == 1)
	   out.println("<tr bgcolor=\"orange\">");
   else
	   out.println("</tr>");
 %>
 
 <td><%=slno%></td>
 <td><%=sno%></td>
 <td><%=hname%></td>
 <td><%=cper%></td>
 <td><%=loc%></td>
 <td><%=city%></td>
 <td><%=sname%></td>
 <td><%=phn%></td>
 <td><%=mail%></td>
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