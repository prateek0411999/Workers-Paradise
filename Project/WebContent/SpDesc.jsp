<%@page import="java.util.Iterator"%>
<%@page import="java.time.*"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="icsd.DBhandler"%>
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
   
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	
	 
	 
	 
	 
	 
	 
	 <title>Description</title>
</head>
<body>
	
<header>
	
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark pt-0">
  <a class="navbar-brand" href="#"><h1></h1></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="FrontPage.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">List A Buisness</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Payment guidelines</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Contact Us</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">About Us</a>
      </li>
     
    </ul>
  </div>
</nav>
</header>

<%
HttpSession session3=request.getSession(false);
Connection con=null;
ResultSet rset=null;
PreparedStatement stmt=null;
DBhandler obj=new DBhandler();
String strname=null,stroccupation=null,straddress=null,strimg=null,stravailtiming=null,strcontactno=null,strexp=null,strperhourprice=null,struid=null,strdesc=null;
con=obj.getDBconnection();
 struid=request.getParameter("spuid");
stmt=con.prepareStatement("select * from tblserviceprovider where spuid=?");
stmt.setString(1, struid);
rset=stmt.executeQuery();
while(rset.next()){
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!loop2");
	strname = rset.getString("spname");
	stroccupation = rset.getString("spoccupation");
	straddress = rset.getString("address");
	strimg = rset.getString("spimg");
	stravailtiming=rset.getString("spavailtimings");
	strcontactno=rset.getString("spcontactno");
	strexp=rset.getString("experience");
	strperhourprice=rset.getString("spperhourprice");
	strdesc=rset.getString("spdesc");
}
con.close();
session3.setAttribute("curspid", struid);
%>





<br>
<br><br>
<br><br>
<div class="container">
    <div class="row">
        <div class="col-sm-2 col-md-2">
            <img src="c1.jpg"
            alt="" class="img-rounded img-responsive" />
        </div>
        <div class="col-sm-2 col-md-2">
        </div>
        <div class="col-sm-5 col-md-5">
            <blockquote>
                <p><%=strname%></p> <small><cite title="Source Title"><%=straddress%>  <i class="glyphicon glyphicon-map-marker"></i></cite></small>
            </blockquote>
            <p> <i class="glyphicon glyphicon-envelope"></i> <h4>Contact Number:</h4> <%=strcontactno %>
                <br
                /> <i class="glyphicon glyphicon-globe"></i> <h4>Available timings:</h4> <%=stravailtiming %>
                <br /> <i class="glyphicon glyphicon-gift"></i> <h5>Per Hour Price:</h4> <%=strperhourprice %></p>
                <p> <h4>Experience:</h4> <%=strexp %></p>
                <p><h4>Description</h4><%=strdesc%></p>
        </div>
        
        </div></div>
        <p>
<!-- Trigger the modal with a button -->

<div class="col-lg-12">
    <div class="row">
        <div class="col-xs-3">
        </div>
        <div class="col-xs-3">
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">BOOK NOW</button>
        </div>
        <div class="col-xs-3">
        </div>
    </div>
</div>





<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">ENTER DETAILS</h4>
      </div>
      <div class="modal-body">
      
      
      
 <form action="tblbooking.jsp" name=<%=struid%>>
 
 <div class="container">
 <% LocalDate date = LocalDate.now();   %>
  BOOKING DATE:
  <input type="date" name="strdate" min='<%=date%>' required>
 
<br><br>

    BOOKING TIME:
  <input type="time" name="strtime" required>
 <br> <br>
  
  <input type="submit" class="btn btn-primary">
  </div>
</form>
</div>



      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
  


<br><br><br>
<br>




  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
  
</body>
</html>