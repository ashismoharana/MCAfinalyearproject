<%@ page language="java" import="java.sql.*" contentType="text/html"%>
<%!
   String cname,sname[];
   Connection conn;
   Statement stmtFill,stmtShow;
   ResultSet rsFill,rsShow;
   int i;
   public void doConnect(){
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
	   
<html>
<head>
<link rel="stylesheet" type="text/css" href="cssbuttons.css">

<title>SCHP</title>
<style type="text/css">
.btn{
	background-color:yellow;
	font-size:19px;
	border-radius:10px;
	padding:1px;
	cursor:pointer;
	width:120px;
	height:50px;
	}

	input{
	width:200px;
	border-radius:10px;
	width:200px;
	height:30px;
	border-style:dotted;
	}
	td{
  font-size:22px;
  }
  
	
	</style>
<script language="javascript">
   function find(){
   window.location="schp_hcenterfc.jsp";
   }

   </script> 
   
   
</head>
<body background="photo.jpg"><br>
<hr width="100%" color="red" size="6"><br>
<h2 align="center"><u>HEALTH CARE CENTER</u></font>
<center>

  <center>
</center>
  
<br><center><b><font size="5" ><b>Health Care Center Information</b></font></b></center>

<form name="f1" action="schp_hcenters.jsp" method="GET">
<br>
<center>
<table width="600" ><br>
<tr>
<td> Serial No. : </td>
<td> <input type = "text" name = "txtsno" > </td>
</tr>
<tr>
<td> Health Care Center Name : </td>
<td> <input type = "text" name = "txthname" size="30"> </td>
</tr>
<tr>
<td> Contact Person : </td>
<td> <input type = "text" name = "txtcper" > </td>
</tr>
<tr>
<td> Locality : </td>
<td> <input type = "text" name = "txtloc" size="30"> </td>
</tr>
<tr>
<td> City/District Name : </td>
<td><input type="text" name="txtcity" size="30"> 
</td>
</tr>
<tr>
<td> State : </td>
<td> <input type = "text" name = "txtsname" size="30"> </td>
</tr><tr>
<td> Phone No. : </td>
<td> <input type = "text" name = "txtphn" size="30"> </td>
</tr><tr>
<td> e-Mail Id : </td>
<td> <input type = "text" name = "txtmail" size="30"> </td>
</tr>

</table>
<br>
<center>
<input  class="btn" type="Submit" name="btnsub" value="Submit">
<input class="btn" type="button" name="btnfind" value="Find" onClick="find()">
<input class="btn" type="Reset" name="btnRes" value="Reset">
</center>
<br><br>
</td>
</tr>
</table>
<center><hr width="98%" size="2" color="black"></center>

<center>
<hr width="100%" color="red" size="6">
&copy;Senior citizen helpline portal-providing helping hand<br>
Bidyadharpur,cuttack-753004.
</center></center>

</form>
</body>
</html>