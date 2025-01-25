<%@page language="java" contentType="text/html" import="java.sql.*" %>
<%!
		Connection conn;
		Statement stmtcreate,stmtArray ;
		ResultSet rs1,rs2;
		String servcode,servtname[]; 
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
	 servtname=new String[20];
	 	 try{
		 stmtArray=conn.createStatement();
		 rs2=stmtArray.executeQuery("select * from schp_tblservtype");
		 i=0;
		 while(rs2.next()){
			 servtname[i]=rs2.getString("servtypename");
			 i++;
		 }
	 }
		 catch(SQLException se){
			 out.println("unable to create array");
		 }
	 
		%>
	
<html>
	<head>
		<title>Search page</title>
	<script language="javascript">
	function services(){
		
		var jsservnames=new Array();
		var j,k;
		j=0;
		<%
		 i=0;
		 while(i<servtname.length){
		%>
		jsservnames[j]="<%=servtname[i]%>";  
		j=j+1;
		<%
		i=i+1;
		 }
		%>
		k=document.f1.cmbservtypec.selectedIndex;
		document.f1.txtservname.value=jsservnames[k-1];
			}
	

	</script>
	<style>
	td{
	  font-size:20px;
	}
	.btup{
		background-color:cyan;
		font-size:19px;
		border-radius:10px;
		padding:9px;
	}
	.btdel{
		background-color:orange;
		font-size:19px;
		border-radius:10px;
		padding:9px;
	}
	.btback{
		background-color:cream;
		font-size:19px;
		border-radius:10px;
		padding:9px;
	}
	h2{
		color:blue;
	}
	.input1{
		width:200px;
		border-style:dotted;
		border-radius:10px;
		height:30px;
	}
	
	
	</style>
	</head>
	<body bgcolor="grey">
	<center>
	<table border="1" width="100%">

<td bgcolor="yellow" align="center" valign="middle">
<h2><u>SERVICE UPDATE DATA ENTRY INTERFACE</u></h1>
</td>
			<form name="f1" action="schp_servtypefs.jsp" method="post">
			<table><br>
				<tr>
					<td>Service type code:</td>
					 <td><select name="cmbservtypec" onchange="services()" class="input1">
					    <option value=" ">--select--</option>
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
					<tr>				
					<td>Service type Name:</td>
					<td><input type="text" required name="txtservname" autocomplete="on" class="input1"></td>
				</tr>
				
</table><br>
<input type="submit" name="btnUpdate" value="Update" class="btup">
<input type="submit"  name="btnDelete" value="Delete" class="btdel">
<input type="button" name="btnback" value="back" class="btback" onclick="goback()">
<br><br><br>
<table border="1" width="100%">
<tr height="80">
<td bgcolor="pink" align="center" valign="middle">
&copy;Help Age Care center-Providing helping hand<br>
Bidyadharpur Cuttack,Odisha,Pin-753004
Ph no:-8327797329.
</table>
</center>
</form>
</body>
</html>