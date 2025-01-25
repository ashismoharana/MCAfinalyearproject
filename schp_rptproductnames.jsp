<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
Connection conn;
Statement stmtselect;
ResultSet rscode;
String cname,procat,pcode,pname,unit,pprice,sprice,tslab,ostock,mstock;
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
  pname=request.getParameter("cmbpname");
%>
<center>
<table width="99%"  border="0" >
<tr height="55">
<td align="center" bgcolor="black">
<font color="white" size="6">
<sub>
 <img src="back.png" title="Go Back" width="35" height="35" align="left" onclick="window.close()">
 </sub>
 Product Information [ <%=pname%> ]</font>
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
<td><font color="white">Company Name</td>
<td><font color="white">Product Cat.Code</td>
<td><font color="white">Product Code</td>
<td><font color="white">Product Name</td>
<td><font color="white">Price</td>
<td><font color="white">G.S.T.</td>
<td><font color="white">Stock</td>
</tr>
<%
 doconnect();
 try{ 
  stmtselect=conn.createStatement();
  rscode=stmtselect.executeQuery("select * from schp_tblproductinfo where pname='"+pname+"'");
  slno=1;
  
  while(rscode.next()){
  cname=rscode.getString("comname");
  procat=rscode.getString("prodcat");
  pcode=rscode.getString("pcode");
  pname=rscode.getString("pname");
  pprice=rscode.getString("pri");
  tslab=rscode.getString("gper");
  ostock=rscode.getString("stock");
 if(slno % 2 == 1)
	   out.println("<tr bgcolor=\"orange\">");
   else
	   out.println("</tr>");
 %>
 
 <td><%=slno%></td>
 <td><%=cname%></td>
 <td><%=procat%></td>
 <td><%=pcode%></td>
 <td><%=pname%></td>
 <td><%=pprice%></td>
 <td><%=tslab%></td>
 <td><%=ostock%></td>

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