<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
Connection conn;
Statement stmtselect;
ResultSet rscode;
String sno,dname,gen,dept,loc,city,sname,hcare,phn,mail,time1,time2;
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
  dept=request.getParameter("cmbdept");
%>
<center>
<table width="99%"  border="0" >
<tr height="55">
<td align="center" bgcolor="black">
<font color="white" size="6">
<sub>
 <img src="back.png" title="Go Back" width="35" height="35" align="left" onclick="window.close()">
 </sub>
 Doctor's Information [ <%=dept%> ]</font>
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
<td><font color="white">Doctor's Name</td>
<td><font color="white">Gender</td>
<td><font color="white">Department</td>
<td><font color="white">Locality</td>
<td><font color="white">City</td>
<td><font color="white">State</td>
<td><font color="white">Health Care Center</td>
<td><font color="white">Phone</td>
<td><font color="white">Mail</td>
<td><font color="white">Time1</td>
<td><font color="white">Time2</td>
</tr>
<%
 doconnect();
 try{ 
  stmtselect=conn.createStatement();
  rscode=stmtselect.executeQuery("select * from schp_tbldoctor where dept='"+dept+"'");
  slno=1;
  
  while(rscode.next()){
  sno=rscode.getString("sno");
  dname=rscode.getString("dname");
  gen=rscode.getString("gen");
  dept=rscode.getString("dept");
  loc=rscode.getString("loc");
  city=rscode.getString("city");
  sname=rscode.getString("sname");
  hcare=rscode.getString("hcare");
  phn=rscode.getString("phn");
  mail=rscode.getString("mail");
  time1=rscode.getString("time1");
  time2=rscode.getString("time2");
 if(slno % 2 == 1)
	   out.println("<tr bgcolor=\"orange\">");
   else
	   out.println("</tr>");
 %>
 
 <td><%=slno%></td>
 <td><%=sno%></td>
 <td><%=dname%></td>
 <td><%=gen%></td>
 <td><%=dept%></td>
 <td><%=loc%></td>
 <td><%=city%></td>
 <td><%=sname%></td>
 <td><%=hcare%></td>
 <td><%=phn%></td>
 <td><%=mail%></td>
 <td><%=time1%></td>
 <td><%=time2%></td>
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