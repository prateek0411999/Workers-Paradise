<%@page import="java.sql.SQLException"%>
<%@page import="icsd.DBhandler"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	  <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	           <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
              <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
              <meta charset="utf-8">
              <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
              <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
              <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
   
	 <title>ALLsp</title>
	
</head>
<body>
	
<header>
	
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark pt-0">
  <a class="navbar-brand" href="#"><h1>WP</h1></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="AdminPage.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
       <li class="nav-item active">
        <a class="nav-link" href="AdminSignOut">SignOut <span class="sr-only">(current)</span></a>
      </li>
     
    </ul>
   
  </div>
  <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
        <ul class="navbar-nav ml-auto">
      <form action='searchSP.jsp'  class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" name="spname" placeholder="Search by name" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
    </ul>
    </div>
    
</nav>
</header>
<%
String spname=request.getParameter("spname");

%>
<br><br><br>
<h2 class="text-center"><%=spname%></h2>
<hr>
<br>
<%
String strspid,strspname,strspaddress,strspconno,strspocc,strspaadhar;
int i=0,count=0;
Connection con1=null;
ResultSet rset1=null;
PreparedStatement stmt1=null;
DBhandler obj1=new DBhandler();
try{
	con1=obj1.getDBconnection();
	    stmt1=con1.prepareStatement("select * from tblserviceprovider where spname=?");
	    stmt1.setString(1, spname);
        rset1=stmt1.executeQuery();
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!");
        while(rset1.next())
        {
        	count++;
        	strspname=rset1.getString("spname");
        	strspaddress=rset1.getString("address");
        	strspconno=rset1.getString("spcontactno");
        	strspocc=rset1.getString("spoccupation");
        	strspaadhar=rset1.getString("spaadharcardno");
        	strspid=rset1.getString("spuid");
        	
        	%>
        	

        	<br><br><br>
        	<h3><%=++i %></h3>
        <center>
        	<div class="container-fluid well span6">
        		<div class="row-fluid">
        	        <div class="span2" >
        			    <img src="face.jpg" class="img-circle" height=150px,width=150px/>
        	        </div>
        	        
        	        <div class="span8">
        	            <h3><%=strspname %></h3>
        	             <h6>ID: <%=strspid %></h6>
        	            <h6>ADDRESS: <%=strspaddress %></h6>
        	            <h6>OCCUPATION: <%=strspocc %></h6>
        	            <h6>AADHAR: <%=strspaadhar %></h6>
        	        </div>
        	        
        	      
        	</div>
        	</div>
        	</center>
        	<br><hr><br>
        	
       <% 
    }
con1.close();
if(count==0)
{
  %>
  <center><h2>SORRY NO SUCH SERVICE PROVIDER FOUND</h2></center>
  <%	
}
}catch(SQLException e11){
	
}
%>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
  
</body>
</html>