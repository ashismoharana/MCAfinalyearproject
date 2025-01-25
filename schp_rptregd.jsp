<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
Connection conn;
Statement stmtselect;
ResultSet rscode;
String rno,fname,gen,dob,abt,pno,loc,city,state,phn;
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
<center>
<table width="99%"  border="0" >
<tr height="55">
<td align="center" bgcolor="black">
<font color="white" size="6">
<sub>
 <img src="back.png" title="Go Back" width="35" height="35" align="left" onclick="window.close()">
 </sub>
 Registration Information</font>
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
<td><font color="white">Registration No</td>
<td><font color="white">Full Name</td>
<td><font color="white">Gender</td>
<td><font color="white">Date Of Birth</td>
<td><font color="white">Age By Today</td>
<td><font color="white">Plot No</td>
<td><font color="white">Locality</td>
<td><font color="white">City</td>
<td><font color="white">State</td>
<td><font color="white">Phone</td>

</tr>
<%
 doconnect();
 try{ 
  stmtselect=conn.createStatement();
  rscode=stmtselect.executeQuery("select * from schp_tblregd");
  slno=1;
  
  while(rscode.next()){
  rno=rscode.getString("regdno");
  fname=rscode.getString("fname");
  gen=rscode.getString("gender");
  dob=rscode.getString("dbirth");
  abt=rscode.getString("age");
  pno=rscode.getString("plotno");
  loc=rscode.getString("locality");
  city=rscode.getString("city");
  state=rscode.getString("state");
  phn=rscode.getString("phone");
  
 if(slno % 2 == 1)
	   out.println("<tr bgcolor=\"orange\">");
   else
	   out.println("</tr>");
 %>
 
 <td><%=slno%></td>
 <td><%=rno%></td>
 <td><%=fname%></td>
 <td><%=gen%></td>
 <td><%=dob%></td>
 <td><%=abt%></td>
 <td><%=pno%></td>
 <td><%=loc%></td>
 <td><%=city%></td>
 <td><%=state%></td>
 <td><%=phn%></td>
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