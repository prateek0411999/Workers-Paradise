<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="icsd.DBhandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	 <meta charset="utf-8"> 
     <meta name="viewport" content="width=device-width, initial-scale=1"> 
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	 <title>Feedback</title>
</head>
<%
int counter=0;
      HttpSession session1 = request.getSession(false);
      String spuid=(String)session1.getAttribute("spuid");
      if(spuid==null){
      %>
     
      <br><br><br>
      <h2>SORRY YOU NEED TO SIGN IN FIRST :-(</h2>
      <br>
      <a href='signin.jsp'>Sign in Now</a>
     <%}
        else{
      %>
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
     <li class="nav-item">
         <a class="nav-link" href="spfeedback.jsp">Feedbacks</a>
      </li>
         <li class="nav-item">
         <a class="nav-link" href="signout">sign out</a>
      </li>
      </ul>
  </div>
</nav>
</header>


<center>
<br><br>
<h1><i>FEEDBACKS</i></h1>
<hr>
</center>


<%
String strskuid=null,strreview=null;
int intrating=0,intbid=0,intfid=0;
HttpSession session10=request.getSession(false);
String spuid2=(String)session10.getAttribute("spuid");
Connection con=null;
ResultSet rset=null;
PreparedStatement stmt=null;
DBhandler obj=new DBhandler();
try{
con=obj.getDBconnection();
stmt=con.prepareStatement("select * from tblfeedback where spuid=?");
stmt.setString(1, spuid2);
rset=stmt.executeQuery();
while(rset.next())
{
	counter++;
	strskuid=rset.getString("skuid");
	strreview=rset.getString("freview");
	intfid=rset.getInt("fid");
	intrating=rset.getInt("rating");
	intbid=rset.getInt("bid");

	%>
	
	
	

	
	
<style>

.card-inner{
    margin-left: 4rem;
}
</style>
	<div class="container">
	
		
		<div class="card">
		    <div class="card-body">
		        <div class="row">
	        	    <div class="col-md-2">
	        	        <img src="https://image.ibb.co/jw55Ex/def_face.jpg" class="img img-rounded img-fluid"/>
	        	        
	        	    </div>
	        	    <div class="col-md-10">
	        	        <p>
	        	            <a class="float-left" ><strong>USER ID: <%=strskuid %></strong></a>
	        	           <%if(intrating==1){ %>
	        	            <span class="float-right"><i class="text-warning fa fa-star"></i></span>
	        	            <%} %>
	        	               <%if(intrating==2){ %>
	        	            <span class="float-right"><i class="text-warning fa fa-star"></i></span>
	        	            <span class="float-right"><i class="text-warning fa fa-star"></i></span>
	        	            <%} %>
	                    <%if(intrating==3){ %>
	        	            <span class="float-right"><i class="text-warning fa fa-star"></i></span>
	        	            <span class="float-right"><i class="text-warning fa fa-star"></i></span>
	        	                <span class="float-right"><i class="text-warning fa fa-star"></i></span>
	        	            <%} %>
	                    <%if(intrating==4){ %>
	        	            <span class="float-right"><i class="text-warning fa fa-star"></i></span>
	        	            <span class="float-right"><i class="text-warning fa fa-star"></i></span>
	        	            <span class="float-right"><i class="text-warning fa fa-star"></i></span>
	                        <span class="float-right"><i class="text-warning fa fa-star"></i></span>
	        	            <%} %>
	                   
	                   <%if(intrating==5){ %>
	        	            <span class="float-right"><i class="text-warning fa fa-star"></i></span>
	        	            <span class="float-right"><i class="text-warning fa fa-star"></i></span>
	        	            <span class="float-right"><i class="text-warning fa fa-star"></i></span>
	        	            <span class="float-right"><i class="text-warning fa fa-star"></i></span>
	        	            <span class="float-right"><i class="text-warning fa fa-star"></i></span>
	        	            <%} %>
	                   
		        	       </p>
	        	       <div class="clearfix"></div>
	        	        <p><%=strreview %></p>
	        	    </div>
	        	    <br><br>
	        	      <div class=""></div>
	        	        <p><b>                           BOOOKING ID :  </b><%=intbid %></p>
	        	    </div>
		        </div>
		        	</div>
		        	</div>
		        <br><br><br>
		        

<%} %>
<%}catch(SQLException w){
	
} 
con.close();
if(counter==0)
{
	%>
	<h2>SORRY YOU HAVE NO FEEDBACK TILL NOW :-(</h2>
	<% 
}
}
      %>
      
      
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
      
</body>
</html>
