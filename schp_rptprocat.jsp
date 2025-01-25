<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
Connection conn;
Statement stmtselect;
ResultSet rscode;
String ProdCatCode,ProdCatName;
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
<body background="schpbg.jpg">
<center>
<table width="99%"  border="0" >
<tr height="55">
<td align="center" bgcolor="black">
<font color="white" size="6">
<sub>
 <img src="back.png" title="Go Back" width="35" height="35" align="left" onclick="window.close()">
 </sub>
 Product Catagory Information</font>
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
<td><font color="white">Product Cat.Code</td>
<td><font color="white">Product Cat.Name</td>
</tr>
<%
 doconnect();
 try{ 
  stmtselect=conn.createStatement();
  rscode=stmtselect.executeQuery("select * from schp_tblprodcatg");
  slno=1;
  
  while(rscode.next()){
  ProdCatCode=rscode.getString("ProdCCode");
  ProdCatName=rscode.getString("ProdCName");
 if(slno % 2 == 1)
	   out.println("<tr bgcolor=\"orange\">");
   else
	   out.println("</tr>");
 %>
 
 <td><%=slno%></td>
 <td><%=ProdCatCode%></td>
 <td><%=ProdCatName%></td>

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