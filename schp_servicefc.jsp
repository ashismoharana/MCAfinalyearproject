<%@page language="java" contentType="text/html" import="java.sql.*" %>
<%!
		Connection conn;
		Statement stmtcreate,stmtArray ;
		ResultSet rs1,rs2;
		String srno,serv[],proby[],gd[],loc[],ct[],st[],phn[],email[],fr[],t[]; 
		String  servtname;
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
	 serv=new String[20];
	 proby=new String[20];
	 gd=new String[20];
	 loc=new String[20];
	 ct=new String[20];
	 st=new String[20];
	 phn=new String[20];
	 email=new String[20];
	 fr=new String[20];
	 t=new String[20];
	 	 try{
		 stmtArray=conn.createStatement();
		 rs2=stmtArray.executeQuery("select * from schp_tblservice");
		 i=0;
		 while(rs2.next()){
			 serv[i]=rs2.getString("servtypname");
			 proby[i]=rs2.getString("provided");
			 gd[i]=rs2.getString("gender");
			 loc[i]=rs2.getString("loc");
			 ct[i]=rs2.getString("city");
			 st[i]=rs2.getString("state");
			 phn[i]=rs2.getString("phoneno");
			 email[i]=rs2.getString("email");
			 fr[i]=rs2.getString("from1");
			 t[i]=rs2.getString("to1");
			 i++;
		 }
	 }
		 catch(SQLException se){
			 out.println("unable to create array"+se);
		 }
	 
		%>
	
<html>
	<head>
		<title>Search page</title>
	<script language="javascript">
	function Services(){
		var jsserv=new Array();
		var jsproby=new Array();
		var jsgd=new Array();
		var jsloc=new Array();
		var jsct=new Array();
		var jsst=new Array();
		var jsphn=new Array();
		var jsemail=new Array();
		var jsfr=new Array();
		var jst=new Array();
		var j,k;
		j=0;
		<%
		 i=0;
		 while(i<serv.length){
		%>
		jsserv[j]="<%=serv[i]%>";
		jsproby[j]="<%=proby[i]%>";  
		jsgd[j]="<%=gd[i]%>";
		jsloc[j]="<%=loc[i]%>";
		jsct[j]="<%=ct[i]%>";
		jsst[j]="<%=st[i]%>";
		jsphn[j]="<%=phn[i]%>";
		jsemail[j]="<%=email[i]%>";
		jsfr[j]="<%=fr[i]%>";
		jst[j]="<%=t[i]%>";
		j=j+1;
		<%
		i=i+1;
		 }
		%>
		k=document.f1.cmbsrno.selectedIndex;
		document.f1.cmbservtypec.value=jsserv[k-1];
		
		document.f1.txtprovide.value=jsproby[k-1];
		alert(jsgd[k-1]);
		document.f1.rbgender.value=jsgd[k-1];
		document.f1.txtloc.value=jsloc[k-1];
		document.f1.txtcity.value=jsct[k-1];
		document.f1.txtstate.value=jsst[k-1];
		document.f1.txtstate.value=jsphn[k-1];
		document.f1.txtpno.value=jsphn[k-1];
		document.f1.txtmail.value=jsemail[k-1];
		document.f1.txtfrom.value=jsfr[k-1];
		document.f1.txtto.value=jst[k-1];
			}
		function goback(){
			window.location="schp_servicec.jsp";
		}
		
	

	</script>
	<style type="text/css">
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
	<body background="photo.jpg">
	<center>
	<table border="0" width="100%">

<td bgcolor="yellow" align="center" valign="middle">
<h2><u>SERVICE INFORMATION UPDATE DATA ENTRY INTERFACE</u></h1>
</td>
			<form name="f1" action="schp_servicefs.jsp" method="post">
			<table><br>
				<tr>
					<td>Serial no:</td>
					 <td><select name="cmbsrno" onchange="Services()" class="input1">
					    <option value=" ">--select--</option>
					<%
					doConnect();
					  try{
						  
						  stmtcreate=conn.createStatement();
						  rs1=stmtcreate.executeQuery("select * from schp_tblservice");
						  while(rs1.next()){
							  srno=rs1.getString("serno");
							  
					%>
					<option value="<%=srno%>"><%=srno%></option>
					
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
					<td>
						<select name="cmbservtypec" class="input1" onchange="services()">
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
				<td>Provided By:</td>
				<td><input type="text" name="txtprovide" required autocomplete="off"></td>
				</tr>
				<td>Gender:</td>
				<td>
				<input type="radio" name="rbgender" value="M" class="input1">Male
				<input type="radio" name="rbgender" value="F" class="input1">Female
				</td>
				</tr>
				<tr>
				<td>Locality:</td>
				<td><input type="text" name="txtloc" class="input1"></td>
				</tr>
				<tr>
				<td>City.District:</td>
				<td><input type="text" name="txtcity" class="input1"></td>
				</tr>
				<tr>
				<td>State/U.territory:</td>
				<td><input type="text" name="txtstate" class="input1"></td>
				</tr>
				<tr>
				<td>Phn no:</td>
				<td><input type="text" name="txtpno" class="input1"></td>
				</tr>
				<tr>
				<td>e-mail:</td>
				<td><input type="text" name="txtmail" class="input1"></td>
				</tr>
				<td>Timing:</td>
				<td>From:
				<input type="text" name="txtfrom" class="input1" autocomplete="off">
				<td>To:
				<input type="text" name="txtto" class="input1" autocomplete="off">
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