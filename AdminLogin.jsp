<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Railway Reservation System</title>
<meta name="keywords" content="Home" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.ennui.contentslider.css" rel="stylesheet" type="text/css" media="screen,projection" />
</head>
<body>

<div id="templatemo_wrapper">

	<div id="templatemo_header">
    
    	<div id="site_title">
            <h1><a href="home.jsp">
                <img src="./images/train_logo.PNG" alt="Business Template" width="494" height="110" />
             
            </a></h1>
        </div>
 
        <div id="templatemo_menu">
    
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="SearchTrain.jsp">Trains</a></li>
                
            </ul>    	
    
    	</div> <!-- end of templatemo_menu -->
        
        <div class="cleaner"></div>
	</div> <!-- end of header -->
    
    <div id="templatemo_content">


	<!-- Form Body -->

<div align="center">
<form>
<h1> <em> Online Railway Reservation Operator Login</em> </h1>

<table>
<tr>
	<td> <label> User Id </label> </td> 
	<td> <input type="text" id="userid" /> </td>
</tr>
<tr>
	<td> <label>Password </label> </td> 
	<td> <input type="password" id="password" /> </td>
</tr>
<tr>
	<td align="center"> <input type="button" value="SignIn" id="signin" onclick="parent.location='./OppHome.jsp'"/> </td> 
	<td align="center"> <input type="button" value="Cancel" id="cancel" onclick="parent.location='./home.jsp'" /> </td>
</tr>
</table>
</form>
</div>

	<!-- Form Body -->

    </div> <!-- end of templatemo_content -->
    
    
   

</body>
</html>
