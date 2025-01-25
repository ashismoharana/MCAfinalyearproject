<%@ page language="java" import="java.sql.*" contentType="text/html"%>
<%!
   String hname,cname,sname[];
   Connection conn;
   Statement stmtFill,stmtFillhname,stmtShow;
   ResultSet rsFill,rsFillhname,rsShow;
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
<link rel="stylesheet" type="text/css" href="cssbuttons.css">

<title>SCHP</title>
<script language="javascript">
   function find(){
   window.location="schp_doctorfc.jsp";
   }

   </script> 
   
   <script language="javaScript">

</script>
</head>
<body background="photo.jpg">

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
  
<br><center><b><font size="5" ><b>Doctor's Information</b></font></b></center>


<form name="f1" action="schp_doctors.jsp" method="GET">

<center>
<table width="700" ><br>
<tr>
<td> Serial No. : </td>
<td> <input type = "text" name = "txtsno" size="30"> </td>
</tr>
<tr>
<td> Doctor's Name : </td>
<td> <input type = "text" name = "txtdname" size="30"> </td>
</tr>
<tr>
<td nowrap>Gender :</td>
<td nowrap align="left"><input type="radio" name="rbgen" value="Male">Male</font><br>
	<input type="radio" name="rbgen" value="Female">Female</font>
</td>
</tr>
<tr>
<td> Department : </td>
<td> <select name = "cmbdept">
     <option value="null">--Select--</option>
	 <option value="Aneasthetics">Aneasthetics</option>
	 <option value="Casualty">Casualty</option>
	 <option value="Ear,Nose And Throat">Ear,Nose And Throat </option>
	  <option value="Geriatrics">Geriatrics</option>
	 <option value="Gastroenterology">Gastroenterology</option>
	 <option value="General Surgery">General Surgery</option>
	 <option value="Gynaecology">Gynaecology </option>
	 <option value="Maternity/Neonatal/Paediatrics">Maternity/Neonatal/Paediatrics </option>
	 <option value="Neurology">Neurology </option>
	 <option value="Oncology">Oncology </option>
	 <option value="Opthalmology">Opthalmology </option>
	 <option value="Orthopedics">Orthopedics </option>
	 <option value="Urology">Urology </option>
</select>
</td>	 
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
</tr>
<tr>
<td> Health Care Name : </td>
<td>
<select name="cmbhname">
<option value=" ">-Select-</option>
<%
doConnect();
try{
stmtFillhname=conn.createStatement();
rsFillhname=stmtFillhname.executeQuery("select * from schp_tblhcenter");
while(rsFillhname.next()) {
hname=rsFillhname.getString("hname");
%>
<option value="<%=hname%>"><%=hname%></option>
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

<tr>
<td> Phone No. : </td>
<td> <input type = "text" name = "txtphn" size="30"> </td>
</tr><tr>
<td> e-Mail Id : </td>
<td> <input type = "text" name = "txtmail" size="30"> </td>
</tr>
<tr>
<td> Time : From :</td>
<td> <input type = "text" name = "txttfrom" size="30"> </td>
<td> To :</td>
<td> <input type = "text" name = "txttto" size="30"> </td>
</tr>
</table>
<br>
<center>
<input  class="btn" type="Submit" name="btnsub" value="Submit">
<input class="btn" type="button" name="btnfind" value="Find" onClick="find()">
<input class="btn" type="Reset" name="btnRes" value="Reset">
</center>

</td>
</tr>
</table>
<center><hr width="98%" size="2" color="black"></center>

<center>
<table width="98%"  border="0" >
<tr height="50"><td align="middle" bgcolor="black" background=image5.jpeg">
<font color="white" size="4" ><b>&copy; Help Age Care Center</b></td>
</tr></table></center>

</form>
</body>
</html>