<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
		Connection conn;
		Statement stmtcreate,stmtArray;
		ResultSet rs1,rs2,rs3,rs4;
		String cname,pcname,pcode[],company[],prodcat[],pname[],price[],stock[],gst[];
		String pcode1;
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
	pname=new String[20];
	
	
	price=new String[20];
	stock=new String[20];
	gst=new String[20];
	try{
		 stmtArray=conn.createStatement();
		 rs3=stmtArray.executeQuery("select * from schp_tblproductinfo");
		 i=0;
		 while(rs3.next())
		 {
			// pcode[i]=rs3.getString("pcode");
			 pname[i]=rs3.getString("pname");
			 
			 
			 price[i]=rs3.getString("pri");
			 stock[i]=rs3.getString("stock");
			 gst[i]=rs3.getString("gper");
			 i++;
		 }
	}
	catch(SQLException se)
	{
		out.println("unable to create array"+se);
	}
	%>
<html>
	<head>
		<title>Product Information client page</title>
		<script language="javascript">
		function gofind(){
			window.location="schp_productfc.jsp";
		}
		function productinfo(){
			
	  var jspcode=new Array();
	  var jspname=new Array();
	  
	  
	  var jsprice=new Array();
	  var jstock=new Array();
	  var jgst=new Array();
	  var j,k;
	  j=0;
	  <%
		 i=0;
		 while(i<pname.length){
		%>
		jspname[j]="<%=pname[i]%>";
		
		
		jsprice[j]="<%=price[i]%>";
		jstock[j]="<%=stock[i]%>";
		jgst[j]="<%=gst[i]%>";
		j=j+1;
		<%
		i=i+1;
		 }
		%>
		k=document.f1.cmbcode.selectedIndex;
		document.f1.txtpname.value=jspname[k-1];
		
		
		document.f1.txtprice.value=jsprice[k-1];
		document.f1.txtstock.value=jstock[k-1];
		document.f1.cmbgper.value=jgst[k-1];
  }
	function goback()
	{
		window.location="schp_productinfoc.jsp";
	}
	

		</script>
		<style type="text/css">
		.btn{
	background-color:yellow;
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
					<td>Product code:</td>
					<td><select name="cmbcode" class="input1" onchange="productinfo()">
					<option value=" ">--Select--</option>
					<%
					doConnect();
					  try{
						  
						  stmtcreate=conn.createStatement();
						  rs1=stmtcreate.executeQuery("select * from schp_tblproductinfo");
						  while(rs1.next()){
							  pcode1=rs1.getString("pcode");
							  
					%>
					<option value="<%=pcode1%>"><%=pcode1%></option>
					<%
						  }
					  }
					  catch(SQLException ex2){
						  out.println("unable to create combo"+ex2);
					  }
					%>
					</select>
					</td>
				</tr>

				<tr>
					<td>Company name:</td>
					<td><select name="cmbcname" onchange="companyname()" class="input1">
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
					<td><select name="cmbpcat" onchange="productcat()" class="input1">
					<option value=" ">--Select--</option>
					<%
					doConnect();
					  try{
						  
						  stmtcreate=conn.createStatement();
						  rs2=stmtcreate.executeQuery("select * from schp_tblprodcatg");
						  while(rs2.next()){
							  pcname=rs2.getString("prodcname");
							  
					%>
					<option value="<%=pcname%>"><%=pcname%></option>
					
					<%
						  }
					  }
					  catch(SQLException ex2){
						  out.println("unable to create combo"+ex2);
					  }
					%>

					</select></td>
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
			<input type="submit" name="btnUpdate" value="Update" class="btn">
			<input type="submit" name="btnDelete" value="Delete" class="btn">
			<input type="button" name="btnback" value="Back" onclick="goback()" class="btn"><br><br>
			<hr width="100%"color="red">
			&copy;<i>Senior citizen helpline portal,providing helping hand<br>
			Bidyadharpur,cuttack odisha phn no:-8327797329.</i>
				</form>
		</center>
	</body>
</html>