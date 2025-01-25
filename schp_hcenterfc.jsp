<%@ page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title> SCHP </title>
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
</head>
<%!
   String cname,sno,hname[],cper[],loc[],city[],sname[],phn[],mail[];
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
	   	<%
	hname=new String[20];
	cper=new String[20];
	loc=new String[20];
	city=new String[20];
	sname=new String[20];
	phn=new String[20];
	mail=new String[20];
	doConnect();
	try{
	stmtShow=conn.createStatement();
    rsShow=stmtShow.executeQuery("select * from schp_tblhcenter");
	i=0;
	while(rsShow.next())
	{
	hname[i]=rsShow.getString("hname");
	cper[i]=rsShow.getString("cper");
	loc[i]=rsShow.getString("loc");
	city[i]=rsShow.getString("city");
	sname[i]=rsShow.getString("sname");
	phn[i]=rsShow.getString("phn");
	mail[i]=rsShow.getString("mail");
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
<script language="javaScript">
function showData(){
var jhname=new Array();
var jcper=new Array();
var jloc=new Array();
var jcity=new Array();
var jsname=new Array();
var jphn=new Array();
var jmail=new Array();
var j,k;
j=0;
<%
i=0;
while(i<hname.length){
%>
jhname[j]="<%=hname[i]%>";
jcper[j]="<%=cper[i]%>";
jloc[j]="<%=loc[i]%>";
jcity[j]="<%=city[i]%>";
jsname[j]="<%=sname[i]%>";
jphn[j]="<%=phn[i]%>";
jmail[j]="<%=mail[i]%>";
j=j+1;
<%
 i=i+1;
} //while ends
%>
k=document.f1.cmbsno.selectedIndex;
document.f1.txthname.value=jhname[k-1];
document.f1.txtcper.value=jcper[k-1];
document.f1.txtloc.value=jloc[k-1];
document.f1.txtcity.value=jcity[k-1];
document.f1.txtsname.value=jsname[k-1];
document.f1.txtphn.value=jphn[k-1];
document.f1.txtmail.value=jmail[k-1];
} 
function goback(){
	window.location="schp_hcenterc.jsp";
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

<form name="f1" action="schp_hcenterfs.jsp" method="GET">
<br>
<center>
<table width="600" ><br>
<tr>
<td> Serial No. : </td>
<td>
<select name="cmbsno" onchange="showData()">
<option value=" ">-Select-</option>
<%
doConnect();
try{
stmtFill=conn.createStatement();
rsFill=stmtFill.executeQuery("select * from schp_tblhcenter");
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
</select> 
</td>

</td>
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
<input  class="btn" type="Submit" name="btnupdate" value="Update">
<input class="btn"  type="submit" name="btndelete" value="Delete">
<input class="btn"  type="button" name="btnback" value="Back">
</center>
<br>
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