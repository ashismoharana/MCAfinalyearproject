<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
		Connection conn;
		Statement stmtRoll,stmtArray;
		ResultSet rs1,rs2;
		String regdno,dates[],onames[],headorg[],loc[],ct[],state[],phn[],mail[],gst[],gstdate[];
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
	 dates=new String[20];
	 onames=new String[20];
	 headorg=new String[20];
	 loc=new String[20]; 
	 ct=new String[20];
	 state=new String[20];
	 phn=new String[20];
	 mail=new String[20];
	 gst=new String[20];
	 gstdate=new String[20];
	 	 try{
		 stmtArray=conn.createStatement();
		 rs2=stmtArray.executeQuery("select * from schp_tblorgn");
		 i=0;
		 while(rs2.next()){
			 onames[i]=rs2.getString("orgname");
			 dates[i]=rs2.getString("regddate");
			 headorg[i]=rs2.getString("horg");
			 loc[i]=rs2.getString("locality"); 
			 ct[i]=rs2.getString("city");
			 state[i]=rs2.getString("state");
			 phn[i]=rs2.getString("pno");
			 mail[i]=rs2.getString("email");
			 gst[i]=rs2.getString("gstno");
			 gstdate[i]=rs2.getString("gdate");
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
	function showorgns(){
		
		var jsonames=new Array();
		var jsdates=new Array();
		var jsheadorg=new Array();
		var jsloc=new Array(); 
		var jscity=new Array();
		var jsstate=new Array(); 
		var	jsphn=new Array();
		var jsmail=new Array();	
		var jsgstno=new Array(); 	
		var jsgstdate=new Array();		
		var j,k;
		j=0;
		<%
		 i=0;
		 while(i<onames.length){
		%>
		jsonames[j]="<%=onames[i]%>";  
		jsdates[j]="<%=dates[i]%>";
		jsheadorg[j]="<%=headorg[i]%>";     
		jsloc[j]="<%=loc[i]%>";
		jscity[j]="<%=ct[i]%>";
		jsstate[j]="<%=state[i]%>";
		jsphn[j]="<%=phn[i]%>";
		jsmail[j]="<%=mail[i]%>";
		jsgstno[j]="<%=gst[i]%>";
		jsgstdate[j]="<%=gstdate[i]%>";
				j=j+1;
		<%
		i=i+1;
		 }
		%>
		k=document.f1.cmbregdno.selectedIndex;
		document.f1.txtOname.value=jsonames[k-1];
		document.f1.txtDt1.value=jsdates[k-1];
		document.f1.txtHead.value=jsheadorg[k-1];    
		document.f1.txtLoc.value=jsloc[k-1]; 
		document.f1.txtCity.value=jscity[k-1];	
		document.f1.cmbstate.value=jsstate[k-1];
		document.f1.txtPno.value=jsphn[k-1];
		document.f1.txtemail.value=jsmail[k-1];
		document.f1.txtGSTNo.value=jsgstno[k-1];
		document.f1.txtDt2.value=jsgstdate[k-1];
	}
	function goback(){
			window.location="schp_orgnc.html";
		}

	</script>
	<style>
	td{
	  font-size:20px;
	}
	.btn{
		background-color:cyan;
		font-size:19px;
		border-radius:10px;
		padding:1px;
		cursor:pointer;
		width:120px;
		height:50px;
		border-color:green;
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
	.quote{
		font-size:20px;
		font-face:Times new roman;
		border-style:solid;
		border-color:green;
		color:black;
	}
	
	</style>
	</head>
	<body background="photo1.jpg">
	<center>
	<table border="1" width="100%">

<td bgcolor="white" align="center" valign="middle">
<h2><u>SENIOR CITIZEN UPDATED DATA ENTRY INTERFACE</u></h1>
</td>
			<form name="f1" action="schp_fs.jsp" method="post">
			<table class="tborder"><br>
				<tr>
					<td>Registration no:</td>
					 <td><select name="cmbregdno" onchange="showorgns()" class="input1">
					    <option value=" ">--select--</option>
					<%
					doConnect();
					  try{
						  
						  stmtRoll=conn.createStatement();
						  rs1=stmtRoll.executeQuery("select * from schp_tblorgn");
						  while(rs1.next()){
							  regdno=rs1.getString("Rno");
							  
					%>
					<option value="<%=regdno%>"><%=regdno%></option>
					
					<%
						  }
					  }
					  catch(SQLException ex2){
						  out.println("unable to create combo");
					  }
					%>
					
					 </select>
					</td>
									
					<td>Date:</td>
					<td><input type="date" name="txtDt1" autocomplete="on" class="input1"></td>
				</tr>
				<tr>
				
				
				<td>Organisation Name:</td>
				<td><input type="text" name="txtOname"  class="input1"></td>
		</tr>
		<tr>
	<td nowrap>Head Of Organisation:</td>
<td><input type="text" name="txtHead" class="input1" ></td>
</tr>
<tr>
<td align="center" nowrap>Address:</td><br>
</tr>
<tr>
<td nowrap>Locality:</td>
<td><input type="text" name="txtLoc" class="input1"></td>
</tr>
<tr>
<td nowrap>City:</td>
<td><input type="text" name="txtCity" class="input1"></td>
</tr>
<tr>
<td nowrap>State/UTerritory:</td>
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
<td><input type="text" name="txtPno" class="input1"></td>
<td>e-mail id:</td>
<td><input type="text" name="txtemail" class="input1"></td>
<tr>
</tr>
<td>GST No:</td>
<td><input type="text" name="txtGSTNo" class="input1"></td>
<td>Date:</td>
<td><input type="date" name="txtDt2" class="input1"></td>
<tr>
</tr>
</table><br>
<input type="submit" name="btnUpdate" value="Update" class="btn">
<input type="submit"  name="btnDelete" value="Delete" class="btn">
<input type="button" name="btnback" value="back" class="btn" onclick="goback()">
<br><br>
<h1 class="quote" align="center" >Never left your parents alone at thier old age always be with them everytime.</font></h1>
<br><br>
<table border="1" width="100%">
<tr height="80">
<td bgcolor="pink" align="center" valign="middle">
&copy;Help Age Care center-Providing helping hand<br>
Bidyadharpur Cuttack,Odisha Pin-753004
Ph no:-8327797329
				</table>
			</center>
		</form>
    </body>
</html>