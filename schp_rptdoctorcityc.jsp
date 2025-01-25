<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<%!
String city;
Connection conn;
Statement stmtFill;
ResultSet rsFill;
int i;
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
 doConnect();
%>
  
<html>
<head>
<link rel="stylesheet" type="text/css" href="mycssbuttons.css">
<title>SCHP</title>
</head>

<body background="awbg.jpg">

<center>
<table width="98%"  border="0" >
<tr height="70">
<td align="center" valign="middle" background="image5.jpeg">
<font face="copperplate gothic" color="yellow" size="4.5">
<sub>
 <img src="back1.png" title="Go Back" width="35" height="35" align="left" onclick="window.close()">
 </sub>
 <b>Senior Citizen Help Portal</b>
</font>
</td>
</tr></table></center>
<br>

<center><font color="black" size="5" >Doctor's Information [Any City]</center>
<br>

<form name="f1" action="schp_rptdoctorcitys.jsp" method="get"><center>

<br><br>
<center>
<table width="400" border="0">
<tr>
<td> City :</td>
<td>
<select name="cmbcity">
<option value=" ">-Select-</option>
<%
doConnect();
try{
stmtFill=conn.createStatement();
rsFill=stmtFill.executeQuery("select * from schp_tbldoctor");
while(rsFill.next()) {
city=rsFill.getString("city");
%>
<option value="<%=city%>"><%=city%></option>
<%
}//while ends
}//try ends
catch(SQLException se){
out.println("Error in Fill"+se);
}
%>
</select> <br>

</td>
</tr>
</table>
</center>
<br><br>

<center>
<input class="button2" type="submit" name="btnSub" value=" Submit ">&nbsp;
<input class="button2" type="reset" name="btnRes" value=" Reset ">&nbsp;
</center>
<br><br><br>

<center><hr width="98%" size="2" color="red"></center>

<center>
<table width="98%"  border="0" >
<tr height="50"><td align="middle" bgcolor="black" background=image5.jpeg">
<font color="white" size="4" ><b>&copy; Help Age Care Center</b></td>
</tr></table></center>


</form>
</body>
</html>