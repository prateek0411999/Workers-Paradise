<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="icsd.DBhandler"%>
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
   
              
	 <title>Bookings</title>
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
        <a class="nav-link" href="FrontPage.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="listabusiness.jsp">List A Business</a>
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
      <%
      HttpSession session1 = request.getSession(false);
      String str=(String)session1.getAttribute("uid");
      if(str==null){
      %>
      <li class="nav-item">
        <a class="nav-link" href="signin2.jsp">sign in as user</a>
      </li>
     <%}
      else{
      %>
     <li class="nav-item">
        <p class="x">Hello <%=str %></p>
      </li>
      <%} %>
    </ul>
  </div>
</nav>
</header>

<%
Connection con=null;
PreparedStatement stmt=null;
ResultSet rset=null;
DBhandler obj=new DBhandler();
int r=0;

String strskid=null,strtime=null,strdate=null,strspid=null,strbid=null;
con=obj.getDBconnection();
HttpSession session2=request.getSession(false);
strskid=(String)session2.getAttribute("uid");
strspid=(String)session2.getAttribute("curspid");
strdate=request.getParameter("strdate");
strtime=request.getParameter("strtime");
int count3=0;
stmt=con.prepareStatement("SELECT MAX(bid) FROM tblbooking");

rset=stmt.executeQuery();
System.out.println("min statement");
if(rset.next())
{
	count3=rset.getInt("MAX(bid)");
	System.out.println(count3);
	}
con.close();
System.out.println(count3);
count3++;


System.out.println(strskid+"  "+strspid+"  "+strdate+"  "+strtime);

System.out.println(strbid);


con=obj.getDBconnection();
stmt=con.prepareStatement("insert into tblbooking values(?,?,?,?,?,?)");

stmt.setString(1, strspid);
stmt.setString(2, strtime);
stmt.setString(3, strdate);
stmt.setString(4, strskid);
stmt.setString(5, "pending");
stmt.setInt(6, count3);
stmt.executeUpdate();
con.close();
%>
<br><br><br><br><br><br>
<h3>CONGRACTULATIONS YOU HAVE SUCCESSFULLY BOOKED OUR SERVICE PROVIDER</h3>
<p><p><p><p>
<h3>YOUR BOOKING ID IS <%=count3%></h3>

<% 
%>


<br><br><br><br>



 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
  
</body>
</html>