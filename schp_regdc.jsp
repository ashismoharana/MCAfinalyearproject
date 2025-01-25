<%@ page language="java" import="java.sql.*" contentType="text/html"%>
<%!
   
   String hname,cname,sname[],fname[],snrec;
   Connection conn;
   Statement stmtFill,stmtFillhname,stmtShow,stmtShowc;
   ResultSet rsFill,rsFillhname,rsShow,rsShowc;
   int i,nrec;
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
	   doConnect();
	   try{
	   stmtShowc=conn.createStatement();
       rsShowc=stmtShowc.executeQuery("select COUNT(*) as norec from schp_tblregd");
	   if(rsShowc.next())
	      nrec=rsShowc.getInt("norec");
	  
	   }
       catch(SQLException se){
        out.println("Error" +se);
        }
	   %>
	   
<html>
<head>
<link rel="stylesheet" type="text/css" href="cssbuttons.css">

<title>SCHP</title>
<script language="javascript">
   function find(){
   window.location="schp_regdfc.jsp";
   }
</script> 
<script language="javascript">
   function regd(){
   alert("First give your Date Of Birth..");
   }
</script> 

<script language="javaScript">
function showage()
{
	var dt1;
	var dt=new Date();
    dd=dt.getDate();
	mm=dt.getMonth()+1;
	yy=dt.getFullYear();
	cdt=dd+"-"+mm+"-"+yy;
	dyy=365*yy;
	dmm=30*mm;
	ddd=dd;
	tcdt=dyy+dmm+ddd;
																																													;
	dt1=document.f1.dtdob.value;
	dtyy=0;
	dtmm=0;
	dtdd=0;
	dtyy=parseInt(dt1.substr(0,dt1.indexOf("-")));
	dtmm=parseInt(dt1.substr(dt1.indexOf("-")+1));
	dtdd=parseInt(dt1.substr(dt1.indexOf("-")+4));
	dyy1=365*dtyy;
	dmm1=30*dtmm;
	ddd1=dtdd;
	tcdt1=dyy1+dmm1+ddd1;
	
	aged=tcdt-tcdt1;
	
	agedy=aged/365;
	agedyq=aged%365;
	agedyp=parseInt(agedy);

	
	agedm=agedyq/30;
	agedmp=parseInt(agedm);
	agedd=agedyq%30;
	ageddp=parseInt(agedd);
	
	abt=agedyp+"y  "+agedmp+"m  "+ageddp+"d";
	
	if(agedyp>59){
	document.f1.txtage.value=abt;
	}
	else{
		alert("SORRY !! You Are Not A Senior Citizen, You Can't Register..")
		window.location='schp_regdc.jsp';
		}
// collect gender into a var i.e. gen
gen=document.f1.rbgen.value;		
regdno=gen+agedyp+""+agedmp+""+ageddp+"<%=nrec+1%>";
document.f1.txtregd.value=regdno;
	
}

</script> 
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
<br><center><b><font size="5" ><b>Registration Form</b></font></b></center>

<br>
<form name="f1" action="schp_regds.jsp" method="GET">

<center>
<table width="600" border="0">

<td> Registration No </td>
<td> <input type = "text" name = "txtregd" size="30" readonly onclick="regd()">
</td>
</tr>
<tr>
<td> Full Name </td>
<td> <input type = "text" name = "txtfname" size="30"> </td>
</tr>
<tr>
<td nowrap>Gender :</td>
<td><input type="radio" name="rbgen" value="M">Male</font><br>
	<input type="radio" name="rbgen" value="F">Female</font><br>
</td>
</tr>
<tr>
<td> Date Of Birth : </td>
<td> <input type = "date" name = "dtdob" size="30" onblur="showage()" > </td>
</tr>
<tr>
<td> Age(By Today) : </td>
<td> <input type = "text" name = "txtage" size="30" > </td>
</tr>
<tr>
<td> House Name/Plot No : </td>
<td> <input type = "text" name = "txtpno" size="30"> </td>
</tr>
<tr>
<td> Locality </td>
<td> <input type = "text" name = "txtloc" size="30"> </td>
</tr>
<tr>
<td> City/District Name : </td>
<td><input type="text" name="cmbcname" size="30"></td>
</tr>
<tr>
	<td nowrap>State/Union Teritory :</td>
	<td>	
<select name="cmbstate">
<option value="select">-select-</option>
<option value="Andhra Pradesh">Andhra pradesh</option>
<option value="Arunchala pradesh">Arunchala pradesh</option>
<option value="Assam">Assam</option>
<option value="Bihar">Bihar</option>
<option value="Chhatisgarh">Chhatishgarh</option>
<option value="Goa">Goa</option>
<option value="Gujurat">Gujurat</option>
<option value="Haryana">Haryana</option>
<option value="Himachal pradesh">Himachal Pradesh</option>
<option value="Jammu and kashmir">Jammu And Kashmir</option>
<option value="Jharkhanda">Jharkhanda</option>
<option value="Karnataka">Karnataka</option>
<option value="Kerala">Kerala</option>
<option value="Madhya pradesh">Madhya Pradesh</option>
<option value="Maharashtra">Maharashtra</option>
<option value="Manipur">Manipur</option>
<option value="Meghalaya">Meghalaya</option>
<option value="Mizoram">Mizoram</option>
<option value="Nagaland">Nagaland</option>
<option value="Odisha">Odisha</option>
<option value="Punjab">Punjab</option>
<option value="Rajasthan">Rajasthan</option>
<option value="Sikkim">Sikkim</option>
<option value="Tamilnadu">Tamilnadu</option>
<option value="Telangana">Telengana</option>
<option value="Tripura">Tripura</option>
<option value="Uttar pradesh">Uttar Pradesh</option>
<option value="Uttarakhand">Uttarakhand</option>
<option value="West bengal">West Bengal</option>
<option value="Andaman And Nicobar">Andaman And Nicobar</option>
<option value="Chandigarh">Chandigarh</option>
<option value="Dadar And Nagar Haveli">Dadar And Nagar Haveli</option>
<option value="Delhi">Delhi</option>
<option value="Lakshadweep">Lakshadweep</option>
<option value="Pondicherry">Pondicherry</option>
</select>
	</td>
</tr>
<tr>
<td> Phone No </td>
<td> <input type = "text" name = "txtphn" size="30"> <font color="red"> * </font> </td>
</tr>
</table>
<br>
<center>
<input  class="btn" type="Submit" name="btnsub" value="Register">

<input class="btn" type="Reset" name="btnRes" value="Cancel">
</center>
<br><br><br>

<center><hr width="98%" size="2" color="black"></center>

<center>
<table width="98%"  border="0" >
<tr height="50"><td align="middle" bgcolor="black" background=image5.jpeg">
<font color="white" size="4" ><b>&copy; Help Age Care Center</b></td>
</tr></table></center>

</form>
</body>
</html>		
		