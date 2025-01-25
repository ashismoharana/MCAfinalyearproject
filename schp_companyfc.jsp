<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
		Connection conn;
		Statement stmtRoll,stmtArray;
		ResultSet rs1,rs2;
		String ccode,cname[],cper[],loc[],city[],state[],phnno[],email[],gno[],dt[];
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
	 cname=new String[20];
	 cper=new String[20];
	 loc=new String[20];
	 city=new String[20]; 
	 state=new String[20];
	 phnno=new String[20];
	 email=new String[20];
	 gno=new String[20];
	 dt=new String[20];
	 	 try{
		 stmtArray=conn.createStatement();
		 rs2=stmtArray.executeQuery("select * from schp_tblcompany");
		 i=0;
		 while(rs2.next()){
			 cname[i]=rs2.getString("cname");
			 cper[i]=rs2.getString("cperson");
			 loc[i]=rs2.getString("locality");
			 city[i]=rs2.getString("city"); 
			 state[i]=rs2.getString("state");
			 phnno[i]=rs2.getString("phoneno");
			 email[i]=rs2.getString("mail");
			 gno[i]=rs2.getString("gno");
			 dt[i]=rs2.getString("dt");
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
	function showcompany(){
		
		var jscname=new Array();
		var jscper=new Array();
		var jsloc=new Array();
		var jscity=new Array(); 
		var jsst=new Array();
		var jspno=new Array(); 
		var	jsemail=new Array();
		var jsgno=new Array();	
		var jsdt=new Array(); 	
		var j,k;
		j=0;
		<%
		 i=0;
		 while(i<cname.length){
		%>
		jscname[j]="<%=cname[i]%>";  
		jscper[j]="<%=cper[i]%>";
		jsloc[j]="<%=loc[i]%>";     
		jscity[j]="<%=city[i]%>";
		jsst[j]="<%=state[i]%>";
		jspno[j]="<%=phnno[i]%>";
		jsemail[j]="<%=email[i]%>";
		jsgno[j]="<%=gno[i]%>";
		jsdt[j]="<%=dt[i]%>";
				j=j+1;
		<%
		i=i+1;
		 }
		%>
		k=document.f1.cmbccode.selectedIndex;
		document.f1.txtcname.value=jscname[k-1];
		document.f1.txtcperson.value=jscper[k-1];
		document.f1.txtloc.value=jsloc[k-1];
		document.f1.txtcity.value=jscity[k-1];
		document.f1.cmbstate.value=jsst[k-1];
		document.f1.txtpno.value=jspno[k-1];
		document.f1.txtemail.value=jsemail[k-1];
		document.f1.txtgstno.value=jsgno[k-1];
		document.f1.txtdt.value=jsdt[k-1];
	}
	function goback(){
			window.location="schp_companyc.html";
		}

		</script>
		<style>
	td{
	  font-size:22px;
	}
	.btn{
		background-color:orange;
		cursor:pointer;
		color:white;
		border-radius:10px;
		width:120px;
		height:50px;
		padding:1px;
		border-color:red;
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
	<body background="bgphoto2.jpg">
	<center>
	<h2><u>COMPANY NEW INFORMATION DATA ENTRY INTERFACE</u></h1>
</td>
			<form name="f1" action="schp_companyfs.jsp" method="post">
			<table><br>
				<tr>
					<td>Company code:</td>
					 <td><select name="cmbccode" onchange="showcompany()" class="input1">
					    <option value=" ">--select--</option>
					<%
					doConnect();
					  try{
						  
						  stmtRoll=conn.createStatement();
						  rs1=stmtRoll.executeQuery("select * from schp_tblcompany");
						  while(rs1.next()){
							  ccode=rs1.getString("ccode");
							  
					%>
					<option value="<%=ccode%>"><%=ccode%></option>
					
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
					<td>Company name:</td>
					<td><input type="text" name="txtcname" autocomplete="off" class="input1"></td>
				</tr>
				<tr>
				
				
				<td>Contact person:</td>
				<td><input type="text" name="txtcperson" autocomplete="off"  class="input1"></td>
		</tr>
		<tr>
	<td nowrap>Locality:</td>
<td><input type="text" name="txtloc" autocomplete="off" class="input1" ></td>
</tr>
<tr>
<td nowrap>city:</td><br>
<td><input type="text" name="txtcity" autocomplete="off" class="input1"></td>
</tr>
<td nowrap>State/U-Territory:</td>
<td>
<select name="cmbstate"  class="input1">
<option value=" ">--select--</option>
<option value="Andhra Pradesh">Andhra Pradesh</option>
<option value="Arunachal Pradesh">Arunachal Pradesh</option>
<option value="Assam">Assam</option>
<option value="Bihar">Bihar</option>
<option value="Chhattisgarh">Chhattisgarh</option>
<option value="Goa">Goa</option>
<option value="Gujarat">Gujarat</option>
<option value="Haryana">Haryana</option>
<option value="Himachal Pradesh">Himachal Pradesh</option>
<option value="Jharkhand">Jharkhand</option>
<option value="Karnataka">Karnataka</option>
<option value="Kerela">Kerela</option>
<option value="Madhya Pradesh">Madhya Pradesh</option>
<option value="Maharastra">Maharastra</option>
<option value="Manipur">Manipur</option>
<option value="Meghalaya">Meghalaya</option>
<option value="Mizoram">Mizoram</option>
<option value="Nagaland">Nagaland</option>
<option value="Odisha">Odisha</option>
<option value="Punjab">Punjab</option>
<option value="Rajastan">Rajastan</option>
<option value="Sikkim">Sikkim</option>
<option value="Tamil Nadu">Tamil Nadu</option>
<option value="Telengana">Telengana</option>
<option value="Tripura">Tripura</option>
<option value="Uttar Pradesh">Uttar Pradesh</option>
<option value="Uttrakhand">Uttrakhand</option>
<option value="West Bengal">West Bengal</option>
<option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
<option value="Chandigarh">Chandigarh</option>
<option value="Dadra and Nagar Haveli and Daman and Diu">Dadra and Nagar Haveli and Daman and Diu</option>
<option value="Jammu & Kashmir">Jammu & Kashmir</option>
<option value="Ladakh">Ladakh</option>
<option value="Lakshwadeep">Lakshwadeep</option>
<option value="Puducheery">Puducheery</option>
</select>
</td>
</tr>
<td>Phone No:</td>
<td><input type="text" name="txtpno" autocomplete="off" class="input1"></td>
<td>e-mail id:</td>
<td><input type="text" name="txtemail" autocomplete="off" class="input1"></td>
<tr>
</tr>
<td>GST No:</td>
<td><input type="text" name="txtgstno" autocomplete="off" class="input1"></td>
<td>Date:</td>
<td><input type="date" name="txtdt" autocomplete="off" class="input1"></td>
<tr>
</tr>
</table><br>
<input type="submit" name="btnUpdate" value="Update" class="btn">
<input type="submit"  name="btnDelete" value="Delete" class="btn">
<input type="button" name="btnback" value="Back" class="btn" onclick="goback()">
<br><br>
<table border="1" width="100%">
<tr height="80">
<td bgcolor="pink" align="center" valign="middle">
&copy;Help Age Care center-Providing helping hand<br>
Bidyadharpur Cuttack,Odisha Pin-753004
Ph no:-8327797329<br>
<i>Senior citizen help-line portal</i>
				</table>
			</center>
		</form>
    </body>
</html>