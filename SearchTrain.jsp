<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Trains</title>
<meta name="keywords" content="Home" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.ennui.contentslider.css" rel="stylesheet" type="text/css" media="screen,projection" />


<%! 
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	
	public void jspInit(){
		try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/train","root","");
		}
		catch(Exception e ){
			e.printStackTrace();
		}
		}
%>



<script type="text/javascript">


function change(){
		var sid= document.getElementById("select1").value;
		var cid=document.getElementById("select1").selectedIndex;
		var val = document.getElementById("select1").options[cid].text;
		
		var url = window.location.href;
		var urlindex = url.indexOf('?');
		var url1 = "";
		if(urlindex > -1){
			url1 = url.substring(0, urlindex);
			window.location.replace(url1+"?sid="+sid+"&value="+val);
		}
		else{
			window.location.replace(url+"?sid="+sid+"&value="+val);
		}
}

function extract(){
		var sid= document.getElementById("select1").value;
		var did= document.getElementById("select2").value;
		var id1=document.getElementById("select2").selectedIndex;
		var val1 = document.getElementById("select2").options[id1].text;

		var url = window.location.href;
		var urlindex = url.indexOf('?');
		var url1 = "";
		if(urlindex > -1){
			url1 = url.substring(0, urlindex);
			window.location.replace(url1+"?src="+sid+"&did="+did+"&des="+val1);
		}
		else{
			window.location.replace(url+"?src="+sid+"&did="+did+"&des="+val1);
		}
}

</script>

</head>
<body>

<div id="templatemo_wrapper">

	<div id="templatemo_header">
    
    	<div id="site_title">
            <h1><a href="home.jsp">
                <img src="./images/train_logo.PNG" width="494" height="110" />
             
            </a></h1>
        </div>
 
        <div id="templatemo_menu">
    
            <ul>
                <li><a href="home.jsp" >Home</a></li>
                <li><a href="SearchTrain.jsp" class="current">Trains</a></li>
                
            </ul>    	
    
    	</div> <!-- end of templatemo_menu -->
        
        <div class="cleaner"></div>
	</div> <!-- end of header -->
    
    <div id="templatemo_content">


	<!-- Form Body -->

<div align="center">
<form name="form1">
<h1> Search Trains Between Stations </h1>
<table>
			<tr>
				<td>	Source Station	</td>
				<td>

					<%
                                            int v1=0;
					String value = request.getParameter("value");
					String sql1="select * from route";
					pstmt = con.prepareStatement(sql1);
					rs = pstmt.executeQuery();
					%>
					
					<select id="select1" name="source" onchange="change();" onfocus="back()">
					<option value="0">--Please Select--</option>
					<% while(rs.next()){ %>
					<% if(rs.getString(2).equals(value)){%>
					<option value="<%= value%>" selected="selected" disabled="disabled"><%=value%></option>
					<%
					}
					else{
					%>
					<option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
					<%
					}
if(rs.getString(2).equals(value))
					
                                        v1=Integer.parseInt(rs.getString(3));
					}
					%>
					
					</select>
					
			
<!-- JavaScript To Eliminate Similar Station Names Generated From BackEnd -->
<script type="text/javascript">
function back(){
	var sel = document.form1.source;
	try{
	//alert("Start back()" + sel.length);
	
	for (var i=0; i< sel.length - 1; i++)
	{
		//alert(sel.options[i].text);		
		for (var j=i+1; j< sel.length; j++)
		{
			//alert(sel.options[j].text);
			var a = sel.options[i].text;
			var b = sel.options[j].text;
			//alert("a="+a);
			//alert("b="+b);
			if (a == b)
			 {
				sel.remove(j);
				back();
			 }			
		}
	}
	}
	catch(e){
		alert(e+"NO Route In The table");
	}
}
</script>
<!-- End JavaScript To Eliminate Similar Station Names Generated From BackEnd -->
						
				</td>

			<tr>

			<td>
				Destination Station
			</td>
			<td>
				<select id="select2" name="destid" onchange="extract()">
				<option value="0">--Please Select--</option>
				<%
                                    int v2=0;
				String s_sta=request.getParameter("value");
				String sql2 = "select * from route";
				pstmt = con.prepareStatement(sql2);
				rs = pstmt.executeQuery(); %>
                                        
				<% while(rs.next()){ %>
					
					<option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
					<%
					if(rs.getString(2).equals(s_sta))
                                        v2=Integer.parseInt(rs.getString(3));
					}

					%>
				</select>
			</td>
			</tr>
</table>

<hr />
<br />
<h1><% 
    int f=0;
    if(v2-v1<=3)
f=10;
    if(v2-v1>3)
    f=10+(((v2-v1)/3)*5);
    %></h1>
                                         <h1>Fare is<%=f%></h1>

<!-- 
<h3> Trains Between a Pair Of Stations </h3>
<br />
<table border="1">
	<tr>
		<th rowspan="2"> Train No </th>
        <th rowspan="2"> Train Name </th>
		<th rowspan="2"> Type </th>
		<th rowspan="2"> Origin </th>
        <th rowspan="2"> Destination </th>
        <th colspan="7"> Days Of Run </th>
	</tr>
	<tr>
    	<td> Mon</td>
        <td> Tue</td>
        <td> Wed</td>
        <td> Thu</td>
        <td> Fri</td>
        <td> Sat</td>
        <td> Sun</td>
	</tr>


</body>
</html>
