<%@ page language="java" import="java.sql.*" contentType="text/html"%>
<%!
   String cname,sno,hname,dname[],gen[],dept[],loc[],city[],sname[],hcare[],phn[],mail[],time1[],time2[];
   Connection conn;
   Statement stmtFillcname,stmtFillhname,stmtFill,stmtShow;
   ResultSet rsFillcname,rsFillhname,rsFill,rsShow;
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
	   	<%
	dname=new String[20];
	gen=new String[20];
	dept=new String[20];
	loc=new String[20];
	city=new String[20];
	sname=new String[20];
	hcare=new String[20];
	phn=new String[20];
	mail=new String[20];
	time1=new String[20];
	time2=new String[20];
	doConnect();
	try{
	stmtShow=conn.createStatement();
    rsShow=stmtShow.executeQuery("select * from schp_tbldoctor");
	i=0;
	while(rsShow.next())
	{
	dname[i]=rsShow.getString("dname");
	gen[i]=rsShow.getString("gen");
	dept[i]=rsShow.getString("dept");
	loc[i]=rsShow.getString("loc");
	city[i]=rsShow.getString("city");
	sname[i]=rsShow.getString("sname");
	hcare[i]=rsShow.getString("hcare");
	phn[i]=rsShow.getString("phn");
	mail[i]=rsShow.getString("mail");
	time1[i]=rsShow.getString("time1");
	time2[i]=rsShow.getString("time2");
	i=i+1;
	}
	}
catch(SQLException se){
out.println("Error" +se);
}
	%>
<html>
<head>
<title>SCHP</title>
<link rel="stylesheet" type="text/css" href="cssbuttons.css">
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
<script language="javaScript">
function showData(){
var jdname=new Array();
var jgen=new Array();
var jdept=new Array();
var jloc=new Array();
var jcity=new Array();
var jsname=new Array();
var jhcare=new Array();
var jphn=new Array();
var jmail=new Array();
var jtime1=new Array();
var jtime2=new Array();
var j,k;
j=0;
<%
i=0;
while(i<dname.length){
%>
jdname[j]="<%=dname[i]%>";
jgen[j]="<%=gen[i]%>";
jdept[j]="<%=dept[i]%>";
jloc[j]="<%=loc[i]%>";
jcity[j]="<%=city[i]%>";
jsname[j]="<%=sname[i]%>";
jhcare[j]="<%=hcare[i]%>";
jphn[j]="<%=phn[i]%>";
jmail[j]="<%=mail[i]%>";
jtime1[j]="<%=time1[i]%>";
jtime2[j]="<%=time2[i]%>";
j=j+1;
<%
 i=i+1;
} //while ends
%>
k=document.f1.cmbsno.selectedIndex;
document.f1.txtdname.value=jdname[k-1];
document.f1.rbgen.value=jgen[k-1];
document.f1.cmbdept.value=jdept[k-1];
document.f1.txtloc.value=jloc[k-1];
document.f1.txtcity.value=jcity[k-1];
document.f1.txtsname.value=jsname[k-1];
document.f1.cmbhname.value=jhcare[k-1];
document.f1.txtphn.value=jphn[k-1];
document.f1.txtmail.value=jmail[k-1];
document.f1.txttfrom.value=jtime1[k-1];
document.f1.txttto.value=jtime2[k-1];
} 
function goback(){
	window.location="schp_doctorc.jsp";
	}
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

<form name="f1" action="schp_doctorfs.jsp" method="GET">

<center>
<table width="700" ><br>
<tr>
<td> Serial No. : </td>
<td>
<select name="cmbsno" onchange="showData()">
<option value=" ">-Select-</option>
<%
doConnect();
try{
stmtFill=conn.createStatement();
rsFill=stmtFill.executeQuery("select * from schp_tbldoctor");
while(rsFill.next()) {
sno=rsFill.getString("sno");
%>
<option value="<%=sno%>"><%=sno%></option>
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
<td> Doctor's Name : </td>
<td> <input type = "text" name = "txtdname" size="30"> </td>
</tr>
<tr>
<td nowrap>Gender :</td>
<td><input type="radio" name="rbgen" value="Male">Male</font><br>
	<input type="radio" name="rbgen" value="Female">Female</font><br>
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
<td>
<input type="text" name="txtcity" size="30">

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
<input class="btn" type="Submit" name="btnUpdate" value="Update">
<input class="btn" type="Submit" name="btnDelete" value="Delete">
<input class="btn" type="button" name="btnBack" value="Back" onClick="goback()">
</center>
<br><br>
<center><hr width="98%" size="2" color="black"></center>

<center>
<table width="98%"  border="0" >
<tr height="50"><td align="middle" bgcolor="black" background=image5.jpeg">
<font color="white" size="4" ><b>&copy; Help Age Care Center</b></td>
</tr></table></center>

</form>
</body>
</html>

   
   
		