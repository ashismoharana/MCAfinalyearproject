<%@page language="java" contentType="text/html" import="java.sql.*" %>
<%!
Connection conn;
		Statement stmtcreate,stmtArray;
		ResultSet rs1,rs2;
		String servtname; 
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
<html>
<head>
<title>Information</title>
<script language="javascript">
function gofind(){
	window.location="schp_servicefc.jsp";
	}
</script>
<style>
.btn{
	background-color:yellow;
	font-size:19px;
	border-radius:10px;
	padding:1px;
	cursor:pointer;
	width:120px;
	height:50px;
	}

	.input1{
		width:200px;
		border-radius:10px;
		height:30px;
		border-style:dotted;
		border-color:red;
	}
	td{
  font-size:22px;
  }
 .itsize{
	 font-size:21px;
 }
 .input1{
	width:200px;
	border-radius:10px;
	width:200px;
	height:30px;
	border-style:dotted;
	}
	
	</style>
</head>
<body background="photo.jpg">
<center><br>
<hr width="100%" color="black">
<h1><u>SERVICE INFORMATION</u></h1>
<form name="f1" action="schp_services.jsp" method="post" autocomplete="off">
<table border="0">
<tr>
<td>Serial No:</td>
<td><input type="text" name="txtsno" class="input1" autocomplete="off"></td>
</tr>
<tr>
<td>Service Type name:</td>
<td><select name="cmbservtypec" class="input1" onchange="Services()">
<option value=" ">--Select--</option>
<%
					doConnect();
					  try{
						  
						  stmtcreate=conn.createStatement();
						  rs1=stmtcreate.executeQuery("select * from schp_tblservtype");
						  while(rs1.next()){
							  servtname=rs1.getString("servtypename");
							  
					%>
					<option value="<%=servtname%>"><%=servtname%></option>
					<%
						  }
					  }
					  catch(SQLException ex2){
						  out.println("unable to create combo");
					  }
					%>

</select>
</td>
</tr>
<tr>
<td>Provided by:</td>
<td><input type="text" name="txtprovide"  class="input1" autocomplete="off"></td>
</tr>
<tr>
<td>Gender:</td>
<td>
<input type="radio" name="rbgender" value="M" class="input1">Male
<input type="radio" name="rbgender" value="F" class="input1">Female
</td>
</tr>
<tr>
<td>Locality:</td>
<td><input type="text" name="txtloc" class="input1" autocomplete="off"></td>
</tr>
<tr>
<td>City/District:</td>
<td><input type="text" name="txtcity" class="input1" autocomplete="off"></td>
</tr>
<tr>
<td>State/U.territory</td>
<td><input type="text" name="txtstate" class="input1" autocomplete="off"></td>
</tr>
<tr>
<td>Phn no:</td>
<td><input type="text" name="txtpno" class="input1" autocomplete="off"></td>
</tr>
<td>e-mailid:</td>
<td><input type="text" name="txtmail" class="input1" autocomplete="off"></td>
<tr>
<td>Timing:</td>
<td>From:
<input type="text" name="txtfrom" class="input1" autocomplete="off">
<td>To:
<td><input type="text" name="txtto" class="input1" autocomplete="off"></td>
</tr>
</table><br><br>
<input type="submit" name="btnsub" value="Submit" class="btn">
<input type="button" name="btnfind" value="Find" class="btn" onclick="gofind()">
<input type="reset" name="btnres" value="Reset" class="btn"><br><br>
<hr width="100%" color="red"><br>
&copy;<i class="itsize">Senior citizen help-line portal</i><br>
<h2>Designed and developed by Ashis Moharana</h2>
BCA,MCA(contd) Bidyadharpur,Cuttack Odisha pin-753004</i>
</center>
</form>
</body>
</html>