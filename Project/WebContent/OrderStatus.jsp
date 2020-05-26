<%@page import="com.sun.rmi.rmid.ExecPermission"%>
<%@page import="java.sql.SQLException"%>
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
   
	 <title>Order Status</title>
</head>
<body>
	
<header>
	
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark pt-0">
  <a class="navbar-brand" href="#"><>WP</h1></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="WelcomePage.jsp">Home <span class="sr-only">(current)</span></a>
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
      String spuid=(String)session1.getAttribute("spuid");
      if(spuid==null){
      %>
      <li class="nav-item">
        <a class="nav-link" href="signin2.jsp">sign in as user</a>
      </li>
     <%}
      else{
      %>
     <li class="nav-item">
        <p class="x">Hello <%=spuid %></p>
      </li>
      <%} %>
    </ul>
  </div>
</nav>
</header>


<%
String skname=null,skaddress=null,skmobileno=null,skemailid=null,bid=null,bookingtiming=null,bookingdate=null,bookingstatus=null;

Connection con=null;
ResultSet rset=null;
PreparedStatement stmt =null;

	DBhandler obj =new DBhandler();
	con=obj.getDBconnection();
String sp=request.getParameter("os");
System.out.println(sp);
String Bid=request.getParameter("bid");
System.out.println(Bid);


stmt=con.prepareStatement("update tblbooking set bookingstatus=? where bid=?");
if(sp.equals("1"))
{
	System.out.println("$$$");
    stmt.setString(1, "Progress");
    stmt.setString(2, Bid);
    stmt.executeUpdate();
}
else if(sp.equals("2")){
	System.out.println("$$$$$$$$$$$$$$$$$$");
    stmt.setString(1, "Denied");
    stmt.setString(2, Bid);
    stmt.executeUpdate();
}
con.close();
System.out.println("!!!!!!!!!!!!!!!!!!!!!");
con=obj.getDBconnection();
stmt=con.prepareStatement("select skname,skaddress,skmobileno,skemailid,bid,bookingtiming,bookingdate,bookingstatus from tblserviceseeker, tblbooking where tblserviceseeker.skuid=tblbooking.skuid and spuid=?");
stmt.setString(1,spuid);
System.out.println(spuid);
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
rset=stmt.executeQuery();
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
%>

<div class="container">
<br><br><br>
<h2 class="text-center">Your Orders</h2><br>
           
<table class="table table-hover">
<thead>
    <tr>
      <th>Booking ID</th>
      <th>Client's Name</th>
      <th>Client's Address</th>
      <th>Client's Mobile Number</th>
      <th>Client's EmailID</th>
      <th>Booking Timing</th>
      <th>Booking Date</th>
      <th>Status</th>
       <th>Is Completed</th>
    </tr>
  </thead>
<% 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
while(rset.next())
{

	skname=rset.getString("skname");
	System.out.println(skname);
	skaddress=rset.getString("skaddress");
	skmobileno=rset.getString("skmobileno");
	skemailid=rset.getString("skemailid");
	bid=rset.getString("bid");
	bookingtiming=rset.getString("bookingtiming");
	bookingdate=rset.getString("bookingdate");
	bookingstatus=rset.getString("bookingstatus");
	

	System.out.println("!!!!!!!!!!!!!!!!!!!!!");
%>

     <tr>
      <td><%=bid %></td>
      <td><%=skname %></td>
      <td><%=skaddress %></td>
      <td><%=skmobileno %></td>
      <td><%=skemailid %></td>
      <td><%=bookingtiming %></td>
      <td><%=bookingdate %></td>
      <%if(bookingstatus.equals("pending")){ %>
    
      <td>
    
     <div class="col-lg-12">
     <div class="row">
        <div class="col-xs-3">
      <a href='OrderStatus.jsp?os=1&bid=<%=bid %>'>  <button type="button" class="btn btn-success btn-sm" >Confirm</button></a> 
        </div>
         <div class="col-xs-3">
        </div>
        <div class="col-xs-3">
       <a href='OrderStatus.jsp?os=2&bid=<%=bid%>'> <button type="button" class="btn btn-danger btn-sm">Denied</button></a>
        </div>
    </div>
</div>
<%}
      else{ %>
      <td><%=bookingstatus %>
    <%} %>
  
  <td>
<%
if(bookingstatus.equals("Progress"))
{
	%> <a href='OrderCompleted.jsp?bid=<%=bid %>'>  <button type="button" class="btn btn-success btn-sm" >Completed?</button></a>
<% }
%>
</td>
 </tr>    
  </td>
   </tr>    
      
      
      
      
   

<%	
}
con.close();
%>
</table>
</div>




<script>
#contact .card:hover i,#contact .card:hover h4{
	color: #87d37c;
}
</script>

<br><br><br><br>
<section id="contact">
       <div class="container">
           <h3 class="text-center text-uppercase">contact us</h3>
           <p class="text-center w-75 m-auto">Worker Paradise Limited is a local search engine company. The Company is engaged in providing search and related services. It is also engaged in other information service activities..</p>
           <div class="row">
             <div class="col-sm-12 col-md-6 col-lg-3 my-5">
               <div class="card border-0">
                  <div class="card-body text-center">
                    <i class="fa fa-phone fa-5x mb-3" aria-hidden="true"></i>
                    <h4 class="text-uppercase mb-5">call us</h4>
                    <p>+8801683615582,+8801750603409</p>
                  </div>
                </div>
             </div>
             <div class="col-sm-12 col-md-6 col-lg-3 my-5">
               <div class="card border-0">
                  <div class="card-body text-center">
                    <i class="fa fa-map-marker fa-5x mb-3" aria-hidden="true"></i>
                    <h4 class="text-uppercase mb-5">Various locations</h4>
                   <address>palika bazar,model town panipat </address>
                  </div>
                </div>
             </div>
             <div class="col-sm-12 col-md-6 col-lg-3 my-5">
               <div class="card border-0">
                  <div class="card-body text-center">
                    <i class="fa fa-map-marker fa-5x mb-3" aria-hidden="true"></i>
                    <h4 class="text-uppercase mb-5">office location</h4>
                    <address>Suite 02, Level 12, Panipat</address>
                  </div>
                </div>
             </div>
             <div class="col-sm-12 col-md-6 col-lg-3 my-5">
               <div class="card border-0">
                  <div class="card-body text-center">
                    <i class="fa fa-globe fa-5x mb-3" aria-hidden="true"></i>
                    <h4 class="text-uppercase mb-5">email</h4>
                    <p>workersparadise@gmail.com</p>
                  </div>
                </div>
             </div>
           </div>
       </div>
    </section>

 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
   
</body>
</html>