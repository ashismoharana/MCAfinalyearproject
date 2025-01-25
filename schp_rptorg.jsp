<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
Connection conn;
Statement stmtselect;
ResultSet rscode;
String registration,regdate,organisation,contact,locality,city,state,phone,mail,gstno,gstdt;
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
 Organisation Information</font>
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
<td><font color="white">Reg.No</td>
<td><font color="white">Date</td>
<td><font color="white">Organisation</td>
<td><font color="white">Contact</td>
<td><font color="white">Locality</td>
<td><font color="white">City</td>
<td><font color="white">State</td>
<td><font color="white">Phone</td>
<td><font color="white">Email</td>
<td><font color="white">GST No</td>
<td><font color="white">GST Date</td>
</tr>
<%
 doconnect();
 try{ 
  stmtselect=conn.createStatement();
  rscode=stmtselect.executeQuery("select * from schp_tblorgn");
  slno=1;
  
  while(rscode.next()){
  registration=rscode.getString("rno");
  regdate=rscode.getString("regddate");
  organisation=rscode.getString("orgname");
  contact=rscode.getString("horg");
  locality=rscode.getString("locality");
  city=rscode.getString("city");
  state=rscode.getString("state");
  phone=rscode.getString("pno");
  mail=rscode.getString("email");
  gstno=rscode.getString("gstno");
  gstdt=rscode.getString("gdate");
 if(slno % 2 == 1)
	   out.println("<tr bgcolor=\"orange\">");
   else
	   out.println("</tr>");
 %>
 
 <td><%=slno%></td>
 <td><%=registration%></td>
 <td><%=regdate%></td>
 <td><%=organisation%></td>
 <td><%=contact%></td>
 <td><%=locality%></td>
 <td><%=city%></td>
 <td><%=state%></td>
 <td><%=phone%></td>
 <td><%=mail%></td>
 <td><%=gstno%></td>
 <td><%=gstdt%></td>
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