<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="icsd.DBhandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
   
              
	 <title>FrontPage</title>
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
      
      <%  HttpSession session1 = request.getSession(false);
      if(session1.getAttribute("spuid")==null)
    	  {%>
      <li class="nav-item">
        <a class="nav-link" href="listabusiness.jsp">List A Business</a>
      </li>
      <%}else{ %>
      <li class="nav-item">
        <a class="nav-link" href="WelcomePage.jsp">List A Business</a>
      </li>
        <%} %>
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
       if(session1.getAttribute("adminid")==null&&session1.getAttribute("uid")==null)
    	  {%>
      <li class="nav-item">
        <a class="nav-link" href="adminSignIn.jsp">Admin Login</a>
      </li>
      <%}%>
      <%
    
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
        <a class="nav-link" href="UserOrders.jsp">Your Orders</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href='signout2'>sign out</a>
      </li>
         <li class="nav-item">
        <a class="nav-link text-bold text-secondary">Hello <%=str %></a>
      </li>
  
      <%} %>
    </ul>
  </div>
</nav>
</header>




 <style>
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 1500px;
    height: 530px;
  }
  </style>
<div id="demo" class="carousel slide" data-ride="carousel">
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="plumber3.jpg" alt="Los Angeles" width="1100" height="500">
      <div class="carousel-caption">
        <h3>Plumber</h3>
        <p>a person who installs and repairs piping, fixtures, appliances, and appurtenances in connection with the water supply, drainage systems, etc.</p>
      </div>   
    </div>
    <div class="carousel-item">
      <img src="carpainter3.jpg" alt="Chicago" width="1100" height="500">
      <div class="carousel-caption">
        <h3>Carpenter</h3>
        <p>A carpenter is a person who works with wood. They can make cabinets, build houses, or do other things with wood.</p>
      </div>   
    </div>
    <div class="carousel-item">
      <img src="electritian3.jpg" alt="New York" width="1100" height="500">
      <div class="carousel-caption">
        <h3>Electrician</h3>
        <p>An electrician is a tradesman specializing in electrical wiring of buildings, transmission lines, stationary machines, and related equipment.</p>
      </div>   
    </div>
  </div>
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>



<% if(str==null)
{%>
<div class="container-fluid">
<h1 class="text-center text-capitalize pt-5">CATEGORIES</h1>
<hr class="w-25 mx-auto pt-5">

<div class="row text-center">
<div class="col-lg-4 col-md-4 col-12">
<div class="card" style="width:400px">
  <a href='signin2.jsp'><img class="card-img-top" src="catp.jpg" alt="Card image" ></a>
  <div class="card-body">
    <h4 class="card-title">PLUMBER</h4>
    <p class="card-text"></p>
  </div>
</div>
</div>

<div class="col-lg-4 col-md-4 col-12">
<div class="card" style="width:400px">
  <a href='signin2.jsp'><img class="card-img-top" src="catc.jpg" alt="Card image" ></a>
  <div class="card-body">
    <h4 class="card-title">CARPAINTER</h4>
    <p class="card-text"></p>
  </div>
</div>
</div>

<div class="col-lg-4 col-md-4 col-12">
<div class="card" style="width:400px">
  <a href='signin2.jsp'><img class="card-img-top" src="cate.jpg" alt="Card image" ></a>
  <div class="card-body">
    <h4 class="card-title">ELECTRITIAN</h4>
    <p class="card-text"></p>
  </div>
</div>
<br>
</div>

<div class="col-lg-4 col-md-4 col-12">
<div class="card" style="width:400px">
  <a href='signin2.jsp'><img class="card-img-top" src="catd.jpg" alt="Card image"></a>
  <div class="card-body">
    <h4 class="card-title">DRIVER</h4>
    <p class="card-text"></p>
  </div>
</div>
</div>


<div class="col-lg-4 col-md-4 col-12">
<div class="card" style="width:400px">
  <a href='signin2.jsp'><img class="card-img-top" src="catt.jpg" alt="Card image"></a>
  <div class="card-body">
    <h4 class="card-title">TUTIOR</h4>
    <p class="card-text"></p>
  </div>
</div>
</div>
</div>
</section>
<br>

<style>
	.a{
		background-color: #2d2a3b;
	}
	.a pre img{
	width:300px;
	height:200px;
	}
</style>
<div class="a">
	<h1 class="text-center text-capitalize pt-5">POPULAR IN YOUR AREAS</h1><br><br>
	<% 
	String strname=null,stroccupation=null,straddress=null,strimg=null,strcontactno=null,stravailtiming=null,strperhourprice=null,strexp=null;
	int uid=1001;
	ResultSet rset = null;
	PreparedStatement stmt =null;
	Connection con = null;
	try{
	DBhandler obj=new DBhandler();
	con = obj.getDBconnection();
	stmt = con.prepareStatement("select * from tblserviceprovider where spuid='1001'or spuid='1002'or spuid='1003'");
	rset = stmt.executeQuery();%>
	<center>
	<% while(rset.next())%><% {%>
		<% 
		
		strname = rset.getString("spname");
		stroccupation = rset.getString("spoccupation");
		straddress = rset.getString("address");
		strimg = rset.getString("spimg");
		stravailtiming=rset.getString("spavailtimings");
		strcontactno=rset.getString("spcontactno");
		strexp=rset.getString("experience");
		System.out.println("Exp - "+strexp);
		strperhourprice=rset.getString("spperhourprice");
		System.out.println(strimg);
		%>
		
		
			<br><br>
			 <div class="container">
				    <div class="row">
				    
				    
				     <div class="col-sm-2 col-md-2">
				     </div>
				<a href='signin2.jsp'>
				
				        <div class="col-sm-2 col-md-2">
				            <img src="face.jpg"
				            alt="" class="img-rounded img-responsive" height=180px, width=180px />	</a>
				        </div>
				        <div class="col-sm-4 col-md-4">
				            <blockquote>
				                <p><b><%=strname %></b></p> <small><cite title="Source Title"><%=straddress %>  <i class="glyphicon glyphicon-map-marker"></i></cite></small>
				            </blockquote>
				            <p> <i class="glyphicon glyphicon-envelope"></i> <%=stroccupation %>
				                <br
				                /> <i class="glyphicon glyphicon-globe"></i> Contact: <%=strcontactno %>
				                <br /> <i class="glyphicon glyphicon-gift"></i> Avail timings: <%=stravailtiming %> </p>
				                <i class="glyphicon glyphicon-globe"></i> Per Hour Price: <%=strperhourprice %>
				                <br /> 
				                 <i class="glyphicon glyphicon-globe"></i> Experience: <%=strexp %>
				                <br /> 
				        </div>
				       
				  </div>
		</div>
				<hr>
		
	<%
	uid++;
	}	
	%>
	  </center>
	<%con.close();
	}catch(SQLException e)
	{
	
}%>

</div>
</div>


<%}else{%>



<section>
<div class="container-fluid">
<h1 class="text-center text-capitalize pt-5">CATEGORIES</h1>
<hr class="w-25 mx-auto pt-5">

<div class="row text-center">
<div class="col-lg-4 col-md-4 col-12">
<div class="card" style="width:400px">
  <a href='category.jsp?catid=1'><img class="card-img-top" src="catp.jpg" alt="Card image" ></a>
  <div class="card-body">
    <h4 class="card-title">PLUMBER</h4>
    <p class="card-text"></p>
  </div>
</div>
</div>

<div class="col-lg-4 col-md-4 col-12">
<div class="card" style="width:400px">
  <a href='category.jsp?catid=2'><img class="card-img-top" src="catc.jpg" alt="Card image" ></a>
  <div class="card-body">
    <h4 class="card-title">CARPAINTER</h4>
    <p class="card-text"></p>
  </div>
</div>
</div>

<div class="col-lg-4 col-md-4 col-12">
<div class="card" style="width:400px">
  <a href='category.jsp?catid=3'><img class="card-img-top" src="cate.jpg" alt="Card image" ></a>
  <div class="card-body">
    <h4 class="card-title">ELECTRITIAN</h4>
    <p class="card-text"></p>
  </div>
</div>
<br>
</div>

<div class="col-lg-4 col-md-4 col-12">
<div class="card" style="width:400px">
  <a href='category.jsp?catid=4'><img class="card-img-top" src="catd.jpg" alt="Card image"></a>
  <div class="card-body">
    <h4 class="card-title">DRIVER</h4>
    <p class="card-text"></p>
  </div>
</div>
</div>


<div class="col-lg-4 col-md-4 col-12">
<div class="card" style="width:400px">
  <a href='category.jsp?catid=5'><img class="card-img-top" src="catt.jpg" alt="Card image"></a>
  <div class="card-body">
    <h4 class="card-title">TUTIOR</h4>
    <p class="card-text"></p>
  </div>
</div>
</div>
</div>
</section>
<br>

<style>
	.a{
		background-color: #2d2a3b;
	}
	.a pre img{
	width:300px;
	
	height:200px;
	}
	#p{
	text-color: white;
	}
	
</style>
<div class="a">
	<h1 class="text-center text-white text-capitalize pt-5">POPULAR IN YOUR AREAS</h1><br><br>
	<% 
	String strname=null,stroccupation=null,straddress=null,strimg=null,strcontactno=null,stravailtiming=null,strperhourprice=null,strexp=null;
	int uid=1001;
	ResultSet rset = null;
	PreparedStatement stmt =null;
	Connection con = null;
	try{
	DBhandler obj=new DBhandler();
	con = obj.getDBconnection();
	stmt = con.prepareStatement("select * from tblserviceprovider where spuid='1001'or spuid='1002'or spuid='1003'");
	rset = stmt.executeQuery();%>
	<center>
	<% while(rset.next())%><% {%>
		<% 
		
		strname = rset.getString("spname");
		stroccupation = rset.getString("spoccupation");
		straddress = rset.getString("address");
		strimg = rset.getString("spimg");
		stravailtiming=rset.getString("spavailtimings");
		strcontactno=rset.getString("spcontactno");
		strexp=rset.getString("experience");
		System.out.println("Exp - "+strexp);
		strperhourprice=rset.getString("spperhourprice");
		System.out.println(strimg);
		%>
		
		
			<br><br>
			 <div class="container">
				    <div class="row">
				    
				    
				     <div class="col-sm-2 col-md-2">
				     </div>
				<a href='SpDesc.jsp?spuid=<%=uid%>'>
				
				        <div class="col-sm-2 col-md-2">
				            <img src="face.jpg"
				            alt="" class="img-rounded img-responsive" height=180px, width=180px />	</a>
				        </div>
				        <div class="col-sm-4 col-md-4 text-white">
				            <blockquote>
				                <p><b><%=strname %></b></p> <small><cite title="Source Title"><%=straddress %>  <i class="glyphicon glyphicon-map-marker"></i></cite></small>
				            </blockquote>
				            <p> <i class="glyphicon glyphicon-envelope"></i> <%=stroccupation %>
				                <br
				                /> <i class="glyphicon glyphicon-globe"></i> Contact: <%=strcontactno %>
				                <br /> <i class="glyphicon glyphicon-gift"></i> Avail timings: <%=stravailtiming %> </p>
				                <i class="glyphicon glyphicon-globe"></i> Per Hour Price: <%=strperhourprice %>
				                <br /> 
				                 <i class="glyphicon glyphicon-globe"></i> Experience: <%=strexp %>
				                <br /> 
				        </div>
				       
				  </div>
		</div>
				<hr>
		
	<%
	uid++;
	}	
	%>
	  </center>
	<%con.close();
	}catch(SQLException e)
	{
	
}%>

</div>
</div>

<%} %>



<script>
#contact .card:hover i,#contact .card:hover h4{
	color: #87d37c;

}

</script>

<br><br><br><br>
<section id="contact" style="background:black;padding: 60px; margin-top: -120px; 0;>
       <div class="container">
           <h3 class="text-center text-uppercase text-secondary">contact us</h3>
           <p class="text-center w-75 m-auto text-secondary">Worker Paradise Limited is a local search engine company. The Company is engaged in providing search and related services. It is also engaged in other information service activities..</p>
           <div class="row">
             <div class="col-sm-12 col-md-6 col-lg-3 my-5">
               <div class="card border-0">
                  <div class="card-body text-center">
                    <i class="fa fa-phone fa-5x mb-3" aria-hidden="true"></i>
                    <h4 class="text-uppercase mb-5">call us</h4>
                    <p>+8801683615582,+880175060340</p>
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