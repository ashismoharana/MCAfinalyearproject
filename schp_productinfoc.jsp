<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
		Connection conn;
		Statement stmtRoll,stmtArray,stmtcreate;
		ResultSet rs1,rs2;
		String cname,pcname;
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
		<title>Product Information client page</title>
		<script language="javascript">
		function gofind(){
			window.location="schp_productfc.jsp";
		}
		</script>
		<style type="text/css">
		.btn{
	background-color:cyan;
	color:black;
	padding:1px;
	cursor:pointer;
	width:120px;
	height:50px;
	border-color:red;
	border-radius:10px;
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
  i{
	  font-size:22px;
  }
  </style>
	</head>
		
	<body background="photo.jpg">
	<h1 align="center">Product Information</h1>
	<hr width="100%" color="black">
		<center>
			
			<form name="f1" action="schp_productinfos.jsp" action="post">
				
			<table border="0">
				<tr>
					<td>Company name:</td>
					<td><select name="cmbcname" onchange="showcompany()" class="input1">
					<option value=" ">--Select--</option>
					
					<%
					doConnect();
					  try{
						  
						  stmtcreate=conn.createStatement();
						  rs1=stmtcreate.executeQuery("select * from schp_tblcompany");
						  while(rs1.next()){
							  cname=rs1.getString("cname");
							  
					%>
					<option value="<%=cname%>"><%=cname%></option>
					<%
						  }
					  }
					  catch(SQLException ex2){
						  out.println("unable to create combo");
					  }
					%>


						
					</select></td>
					</tr>
				<tr>
					<td>Product category name:</td>
					<td><select name="cmbpcat" onchange="prodetails()" class="input1">
					<option value=" ">--Select--</option>
					<%
					doConnect();
					  try{
						  
						  stmtcreate=conn.createStatement();
						  rs1=stmtcreate.executeQuery("select * from schp_tblprodcatg");
						  while(rs1.next()){
							  pcname=rs1.getString("prodcname");
							  
					%>
					<option value="<%=pcname%>"><%=pcname%></option>
					
					<%
						  }
					  }
					  catch(SQLException ex2){
						  out.println("unable to create combo");
					  }
					%>

					</select></td>
					</tr>
				<tr>
					<td>Product code:</td>
					<td><input type="text" name="txtpcode" class="input1"></td>
				</tr>
				<tr>
					<td>Product name:</td>
					<td><input type="text" name="txtpname" class="input1"></td>
				</tr>
				<tr>
					<td>Price:</td>
					<td><input type="text" name="txtprice" class="input1"></td>
				</tr>
				<tr>
					<td>Stock:</td>
					<td><input type="text" name="txtstock" class="input1"></td>
				</tr>
				<tr>
					<td>G.S.T %ge</td>
					<td>
					<select name="cmbgper" class="input1">
					<option value=" " >--select--</option>
					<option value="8">8</option>
					<option value="12">12</option>
					<option value="20">20</option>
					<option value="28">28</option>
					  </select>
				</tr>
				
			</table><br>
			<input type="submit" name="btnsub" value="Submit" class="btn">
			<input type="button" name="btnsub" value="Find" onclick="gofind()" class="btn">
			<input type="reset" name="btnres" value="Reset" class="btn"><br><br>
			<hr width="100%"color="red">
			&copy;<i>Senior citizen helpline portal,providing helping hand<br>
			Bidyadharpur,cuttack odisha phn no:-8327797329.</i>
				</form>
		</center>
	</body>
</html>