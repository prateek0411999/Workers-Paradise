<%@page import="java.util.Iterator"%>
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
   
              
	
	 <title></title>
</head>
<body>
<%	HttpSession session1 = request.getSession(false);
      if(session1.getAttribute("uid")==null)
      {
    	  response.sendRedirect("signin2.jsp");
      }
      else{
%>
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

<%String id=request.getParameter("id");
ArrayList l1=new ArrayList();

ResultSet rset=null;
PreparedStatement stmt=null;
DBhandler obj=new DBhandler();

String strname=null,stroccupation=null,straddress=null,strimg=null,stravailtiming=null,strcontactno=null,strexp=null,strperhourprice=null,struid=null;
int q=Integer.parseInt(id);
if(q==1){
	Connection con=null;
	con= obj.getDBconnection();
	stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='plumber'");
	rset=stmt.executeQuery();
	while(rset.next())
	{
		l1.add(rset.getInt("spperhourprice"));
	}
	Collections.sort(l1);
	Iterator itr=l1.iterator(); 
	int x[]=new int[100];
	int i=0;
	
	while(itr.hasNext()){ 
			
		x[i]=(int)itr.next();
		System.out.println(x[i]);
	i++;
	}
	System.out.println("length="+x.length);
	for(i=0;x[i]!=0;i++){
	
		if(x[i+1]==x[i]){
			continue;
		}
		else{
			System.out.println("!!!!!!!!!!!loop1");
			stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='plumber' and spperhourprice="+x[i]+"");
			System.out.println(x[i]);
			rset=stmt.executeQuery();
			
		
			while(rset.next())
			{
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!loop2");
				strname = rset.getString("spname");
				stroccupation = rset.getString("spoccupation");
				straddress = rset.getString("address");
				strimg = rset.getString("spimg");
				stravailtiming=rset.getString("spavailtimings");
				strcontactno=rset.getString("spcontactno");
				strexp=rset.getString("experience");
				strperhourprice=rset.getString("spperhourprice");
				struid = rset.getString("spuid");
			
				
%>
<br><br>
<a href='SpDesc.jsp?spuid=<%=struid%>'>
<div class="container">
    <div class="row">
   
        <div class="col-sm-2 col-md-2">
            <img src="face.jpg"
            alt="" class="img-rounded img-responsive" height=180px, width=180px /></a>
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
			}			
		}
	}
	con.close();
	}
if(q==2){
	Connection con=null;
	con= obj.getDBconnection();

	stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='plumber'");
	rset=stmt.executeQuery();
	while(rset.next())
	{
		l1.add(rset.getInt("spperhourprice"));
	}
	Collections.sort(l1,Collections.reverseOrder());
	Iterator itr=l1.iterator(); 
	int x[]=new int[100];
	int i=0;
	
	while(itr.hasNext()){ 
			
		x[i]=(int)itr.next();
		System.out.println(x[i]);
	i++;
	}
	System.out.println("length="+x.length);
	for(i=0;x[i]!=0;i++){
	
		if(x[i+1]==x[i]){
			continue;
		}
		else{
			System.out.println("!!!!!!!!!!!loop1");
			stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='plumber' and spperhourprice="+x[i]);
			System.out.println(x[i]);
			rset=stmt.executeQuery();
			
		
			while(rset.next())
			{
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!loop2");
				strname = rset.getString("spname");
				stroccupation = rset.getString("spoccupation");
				straddress = rset.getString("address");
				strimg = rset.getString("spimg");
				stravailtiming=rset.getString("spavailtimings");
				strcontactno=rset.getString("spcontactno");
				strexp=rset.getString("experience");
				struid = rset.getString("spuid");
				strperhourprice=rset.getString("spperhourprice");
				
				%>
				<br><br>
				<a href='SpDesc.jsp?spuid=<%=struid%>'>
				<div class="container">
				    <div class="row">
				        <div class="col-sm-2 col-md-2">
				            <img src="face.jpg"
				            alt="" class="img-rounded img-responsive" height=180px, width=180px /></a>
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
				
	<%	}
			
	}
		
	
}
	con.close();
}
if(q==3)
{
	Connection con=null;
	con= obj.getDBconnection();

	stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='plumber'");
	rset=stmt.executeQuery();
	while(rset.next())
	{
		l1.add(rset.getInt("experience"));
	}
	Collections.sort(l1,Collections.reverseOrder());
	Iterator itr=l1.iterator(); 
	int x[]=new int[100];
	int i=0;
	
	while(itr.hasNext()){ 
			
		x[i]=(int)itr.next();
		System.out.println(x[i]);
	i++;
	}
	System.out.println("length="+x.length);
	for(i=0;x[i]!=0;i++){
	
		if(x[i+1]==x[i]){
			continue;
		}
		else{
			System.out.println("!!!!!!!!!!!loop1");
			stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='plumber' and experience="+x[i]+"");
			System.out.println(x[i]);
			rset=stmt.executeQuery();
			
		
			while(rset.next())
			{
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!loop2");
				strname = rset.getString("spname");
				stroccupation = rset.getString("spoccupation");
				straddress = rset.getString("address");
				strimg = rset.getString("spimg");
				stravailtiming=rset.getString("spavailtimings");
				strcontactno=rset.getString("spcontactno");
				strexp=rset.getString("experience");
				struid = rset.getString("spuid");
				System.out.println("Exp - "+strexp);
				strperhourprice=rset.getString("spperhourprice");
				
				
				%>
				<br><br>
				<a href='SpDesc.jsp?spuid=<%=struid%>'>
				<div class="container">
				    <div class="row">
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
		}
	}
	}
	con.close();
}






if(q==4){
	Connection con=null;
	con= obj.getDBconnection();

	stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='carpainter'");
	rset=stmt.executeQuery();
	while(rset.next())
	{
		l1.add(rset.getInt("spperhourprice"));
	}
	Collections.sort(l1);
	Iterator itr=l1.iterator(); 
	int x[]=new int[100];
	int i=0;
	
	while(itr.hasNext()){ 
			
		x[i]=(int)itr.next();
		System.out.println(x[i]);
	i++;
	}
	System.out.println("length="+x.length);
	for(i=0;x[i]!=0;i++){
	
		if(x[i+1]==x[i]){
			continue;
		}
		else{
			System.out.println("!!!!!!!!!!!loop1");
			stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='carpainter' and spperhourprice="+x[i]+"");
			System.out.println(x[i]);
			rset=stmt.executeQuery();
			
		
			while(rset.next())
			{
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!loop2");
				strname = rset.getString("spname");
				stroccupation = rset.getString("spoccupation");
				straddress = rset.getString("address");
				strimg = rset.getString("spimg");
				stravailtiming=rset.getString("spavailtimings");
				strcontactno=rset.getString("spcontactno");
				strexp=rset.getString("experience");
				struid = rset.getString("spuid");
				strperhourprice=rset.getString("spperhourprice");
				
				%>
				<br><br>
				<a href='SpDesc.jsp?spuid=<%=struid%>'>
				<div class="container">
				    <div class="row">
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
			}			
		}
	}
	con.close();
	}
if(q==5){
	Connection con=null;
	con= obj.getDBconnection();

	stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='carpainter'");
	rset=stmt.executeQuery();
	while(rset.next())
	{
		l1.add(rset.getInt("spperhourprice"));
	}
	Collections.sort(l1,Collections.reverseOrder());
	Iterator itr=l1.iterator(); 
	int x[]=new int[100];
	int i=0;
	
	while(itr.hasNext()){ 
			
		x[i]=(int)itr.next();
		System.out.println(x[i]);
	i++;
	}
	System.out.println("length="+x.length);
	for(i=0;x[i]!=0;i++){
	
		if(x[i+1]==x[i]){
			continue;
		}
		else{
			System.out.println("!!!!!!!!!!!loop1");
			stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='carpainter' and spperhourprice="+x[i]+"");
			System.out.println(x[i]);
			rset=stmt.executeQuery();
			
		
			while(rset.next())
			{
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!loop2");
				strname = rset.getString("spname");
				stroccupation = rset.getString("spoccupation");
				straddress = rset.getString("address");
				strimg = rset.getString("spimg");
				struid = rset.getString("spuid");
				stravailtiming=rset.getString("spavailtimings");
				strcontactno=rset.getString("spcontactno");
				strexp=rset.getString("experience");
				strperhourprice=rset.getString("spperhourprice");
				%>%>
				<br><br>
				<a href='SpDesc.jsp?spuid=<%=struid%>'>
				<div class="container">
				    <div class="row">
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
				
	<%}			
		}
	}
	con.close();
}
if(q==6)
{
	Connection con=null;
	con= obj.getDBconnection();

	stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='carpainter'");
	rset=stmt.executeQuery();
	while(rset.next())
	{
		l1.add(rset.getInt("experience"));
	}
	Collections.sort(l1,Collections.reverseOrder());
	Iterator itr=l1.iterator(); 
	int x[]=new int[100];
	int i=0;
	
	while(itr.hasNext()){ 
			
		x[i]=(int)itr.next();
		System.out.println(x[i]);
	i++;
	}
	System.out.println("length="+x.length);
	for(i=0;x[i]!=0;i++){
	
		if(x[i+1]==x[i]){
			continue;
		}
		else{
			System.out.println("!!!!!!!!!!!loop1");
			stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='carpainter' and experience="+x[i]+"");
			System.out.println(x[i]);
			rset=stmt.executeQuery();
			
		
			while(rset.next())
			{
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!loop2");
				strname = rset.getString("spname");
				stroccupation = rset.getString("spoccupation");
				straddress = rset.getString("address");
				strimg = rset.getString("spimg");
				struid = rset.getString("spuid");
				stravailtiming=rset.getString("spavailtimings");
				strcontactno=rset.getString("spcontactno");
				strexp=rset.getString("experience");
				System.out.println("Exp - "+strexp);
				strperhourprice=rset.getString("spperhourprice");
				%>
				<br><br>
				<a href='SpDesc.jsp?spuid=<%=struid%>'>
				<div class="container">
				    <div class="row">
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
				
	<%}			
		}
	}
	con.close();
}




if(q==7){

	Connection con=null;
	con= obj.getDBconnection();

	stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='electrician'");
	rset=stmt.executeQuery();
	while(rset.next())
	{
		l1.add(rset.getInt("spperhourprice"));
	}
	Collections.sort(l1);
	Iterator itr=l1.iterator(); 
	int x[]=new int[100];
	int i=0;
	
	while(itr.hasNext()){ 
			
		x[i]=(int)itr.next();
		System.out.println(x[i]);
	i++;
	}
	System.out.println("length="+x.length);
	for(i=0;x[i]!=0;i++){
	
		if(x[i+1]==x[i]){
			continue;
		}
		else{
			System.out.println("!!!!!!!!!!!loop1");
			stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='electrician' and spperhourprice="+x[i]+"");
			System.out.println(x[i]);
			rset=stmt.executeQuery();
			
		
			while(rset.next())
			{
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!loop2");
				strname = rset.getString("spname");
				stroccupation = rset.getString("spoccupation");
				straddress = rset.getString("address");
				strimg = rset.getString("spimg");
				struid = rset.getString("spuid");
				stravailtiming=rset.getString("spavailtimings");
				strcontactno=rset.getString("spcontactno");
				strexp=rset.getString("experience");
				strperhourprice=rset.getString("spperhourprice");
				%>
				<br><br>
				<a href='SpDesc.jsp?spuid=<%=struid%>'>
				<div class="container">
				    <div class="row">
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
				
	<%}			
		}
	}
	con.close();
	}
if(q==8){
	Connection con=null;
	con= obj.getDBconnection();

	stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='electrician'");
	rset=stmt.executeQuery();
	while(rset.next())
	{
		l1.add(rset.getInt("spperhourprice"));
	}
	Collections.sort(l1,Collections.reverseOrder());
	Iterator itr=l1.iterator(); 
	int x[]=new int[100];
	int i=0;
	
	while(itr.hasNext()){ 
			
		x[i]=(int)itr.next();
		System.out.println(x[i]);
	i++;
	}
	System.out.println("length="+x.length);
	for(i=0;x[i]!=0;i++){
	
		if(x[i+1]==x[i]){
			continue;
		}
		else{
			System.out.println("!!!!!!!!!!!loop1");
			stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='electrician' and spperhourprice="+x[i]+"");
			System.out.println(x[i]);
			rset=stmt.executeQuery();
			
		
			while(rset.next())
			{
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!loop2");
				strname = rset.getString("spname");
				stroccupation = rset.getString("spoccupation");
				straddress = rset.getString("address");
				strimg = rset.getString("spimg");
				struid = rset.getString("spuid");
				stravailtiming=rset.getString("spavailtimings");
				strcontactno=rset.getString("spcontactno");
				strexp=rset.getString("experience");
				strperhourprice=rset.getString("spperhourprice");
				%>
				<br><br>
				<a href='SpDesc.jsp?spuid=<%=struid%>'>
				<div class="container">
				    <div class="row">
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
				
	<%}			
		}
	}
	con.close();
}
if(q==9)
{
	Connection con=null;
	con= obj.getDBconnection();

	stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='electrician'");
	rset=stmt.executeQuery();
	while(rset.next())
	{
		l1.add(rset.getInt("experience"));
	}
	Collections.sort(l1,Collections.reverseOrder());
	Iterator itr=l1.iterator(); 
	int x[]=new int[100];
	int i=0;
	
	while(itr.hasNext()){ 
			
		x[i]=(int)itr.next();
		System.out.println(x[i]);
	i++;
	}
	System.out.println("length="+x.length);
	for(i=0;x[i]!=0;i++){
	
		if(x[i+1]==x[i]){
			continue;
		}
		else{
			System.out.println("!!!!!!!!!!!loop1");
			stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='electrician' and experience="+x[i]+"");
			System.out.println(x[i]);
			rset=stmt.executeQuery();
			
		
			while(rset.next())
			{
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!loop2");
				strname = rset.getString("spname");
				stroccupation = rset.getString("spoccupation");
				straddress = rset.getString("address");
				strimg = rset.getString("spimg");
				struid = rset.getString("spuid");
				stravailtiming=rset.getString("spavailtimings");
				strcontactno=rset.getString("spcontactno");
				strexp=rset.getString("experience");
				System.out.println("Exp - "+strexp);
				strperhourprice=rset.getString("spperhourprice");
				%>
				<br><br>
				<a href='SpDesc.jsp?spuid=<%=struid%>'>
				<div class="container">
				    <div class="row">
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
				
	<%}			
		}
	}
	con.close();
}





if(q==10)
{
	Connection con=null;
	con= obj.getDBconnection();

	stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='driver'");
	rset=stmt.executeQuery();
	while(rset.next())
	{
		l1.add(rset.getInt("spperhourprice"));
	}
	Collections.sort(l1);
	Iterator itr=l1.iterator(); 
	int x[]=new int[100];
	int i=0;
	
	while(itr.hasNext()){ 
			
		x[i]=(int)itr.next();
		System.out.println(x[i]);
	i++;
	}
	System.out.println("length="+x.length);
	for(i=0;x[i]!=0;i++){
	
		if(x[i+1]==x[i]){
			continue;
		}
		else{
			System.out.println("!!!!!!!!!!!loop1");
			stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='driver' and spperhourprice="+x[i]+"");
			System.out.println(x[i]);
			rset=stmt.executeQuery();
			
		
			while(rset.next())
			{
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!loop2");
				strname = rset.getString("spname");
				stroccupation = rset.getString("spoccupation");
				straddress = rset.getString("address");
				strimg = rset.getString("spimg");
				struid = rset.getString("spuid");
				stravailtiming=rset.getString("spavailtimings");
				strcontactno=rset.getString("spcontactno");
				strexp=rset.getString("experience");
				strperhourprice=rset.getString("spperhourprice");
				%>
				<br><br>
				<a href='SpDesc.jsp?spuid=<%=struid%>'>
				<div class="container">
				    <div class="row">
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
				
	<%}			
		}
	}
	con.close();
	}
if(q==11){
	Connection con=null;
	con= obj.getDBconnection();

	stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='driver'");
	rset=stmt.executeQuery();
	while(rset.next())
	{
		l1.add(rset.getInt("spperhourprice"));
	}
	Collections.sort(l1,Collections.reverseOrder());
	Iterator itr=l1.iterator(); 
	int x[]=new int[100];
	int i=0;
	
	while(itr.hasNext()){ 
			
		x[i]=(int)itr.next();
		System.out.println(x[i]);
	i++;
	}
	System.out.println("length="+x.length);
	for(i=0;x[i]!=0;i++){
	
		if(x[i+1]==x[i]){
			continue;
		}
		else{
			System.out.println("!!!!!!!!!!!loop1");
			stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='driver' and spperhourprice="+x[i]+"");
			System.out.println(x[i]);
			rset=stmt.executeQuery();
			
		
			while(rset.next())
			{
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!loop2");
				strname = rset.getString("spname");
				stroccupation = rset.getString("spoccupation");
				straddress = rset.getString("address");
				strimg = rset.getString("spimg");
				struid = rset.getString("spuid");
				stravailtiming=rset.getString("spavailtimings");
				strcontactno=rset.getString("spcontactno");
				strexp=rset.getString("experience");
				strperhourprice=rset.getString("spperhourprice");
				%>
				<br><br>
				<a href='SpDesc.jsp?spuid=<%=struid%>'>
				<div class="container">
				    <div class="row">
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
				
	<%}			
		}
	}
	con.close();
}
if(q==12)
{
	Connection con=null;
	con= obj.getDBconnection();

	stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='driver'");
	rset=stmt.executeQuery();
	while(rset.next())
	{
		l1.add(rset.getInt("experience"));
	}
	Collections.sort(l1,Collections.reverseOrder());
	Iterator itr=l1.iterator(); 
	int x[]=new int[100];
	int i=0;
	
	while(itr.hasNext()){ 
			
		x[i]=(int)itr.next();
		System.out.println(x[i]);
	i++;
	}
	System.out.println("length="+x.length);
	for(i=0;x[i]!=0;i++){
	
		if(x[i+1]==x[i]){
			continue;
		}
		else{
			System.out.println("!!!!!!!!!!!loop1");
			stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='driver' and experience="+x[i]+"");
			System.out.println(x[i]);
			rset=stmt.executeQuery();
			
		
			while(rset.next())
			{
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!loop2");
				strname = rset.getString("spname");
				stroccupation = rset.getString("spoccupation");
				straddress = rset.getString("address");
				strimg = rset.getString("spimg");
				struid = rset.getString("spuid");
				stravailtiming=rset.getString("spavailtimings");
				strcontactno=rset.getString("spcontactno");
				strexp=rset.getString("experience");
				System.out.println("Exp - "+strexp);
				strperhourprice=rset.getString("spperhourprice");
				%>
				<br><br>
				<a href='SpDesc.jsp?spuid=<%=struid%>'>
				<div class="container">
				    <div class="row">
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
				
	<%}			
		}
	}
	con.close();
}




if(q==13){
	Connection con=null;
	con= obj.getDBconnection();

	stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='tutior'");
	rset=stmt.executeQuery();
	while(rset.next())
	{
		l1.add(rset.getInt("spperhourprice"));
	}
	Collections.sort(l1);
	Iterator itr=l1.iterator(); 
	int x[]=new int[100];
	int i=0;
	
	while(itr.hasNext()){ 
			
		x[i]=(int)itr.next();
		System.out.println(x[i]);
	i++;
	}
	System.out.println("length="+x.length);
	for(i=0;x[i]!=0;i++){
	
		if(x[i+1]==x[i]){
			continue;
		}
		else{
			System.out.println("!!!!!!!!!!!loop1");
			stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='tutior' and spperhourprice="+x[i]+"");
			System.out.println(x[i]);
			rset=stmt.executeQuery();
			
		
			while(rset.next())
			{
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!loop2");
				strname = rset.getString("spname");
				stroccupation = rset.getString("spoccupation");
				straddress = rset.getString("address");
				strimg = rset.getString("spimg");
				stravailtiming=rset.getString("spavailtimings");
				strcontactno=rset.getString("spcontactno");
				strexp=rset.getString("experience");
				struid = rset.getString("spuid");
				System.out.println(struid);
				strperhourprice=rset.getString("spperhourprice");
				%>
				<br><br>
				<a href='SpDesc.jsp?spuid=<%=struid%>'>
				<div class="container">
				    <div class="row">
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
				
	<%}			
		}
	}
	con.close();
	}
if(q==14){
	Connection con=null;
	con= obj.getDBconnection();

	stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='tutior'");
	rset=stmt.executeQuery();
	while(rset.next())
	{
		l1.add(rset.getInt("spperhourprice"));
	}
	Collections.sort(l1,Collections.reverseOrder());
	Iterator itr=l1.iterator(); 
	int x[]=new int[100];
	int i=0;
	
	while(itr.hasNext()){ 
			
		x[i]=(int)itr.next();
		System.out.println(x[i]);
	i++;
	}
	System.out.println("length="+x.length);
	for(i=0;x[i]!=0;i++){
	
		if(x[i+1]==x[i]){
			continue;
		}
		else{
			System.out.println("!!!!!!!!!!!loop1");
			stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='tutior' and spperhourprice="+x[i]+"");
			System.out.println(x[i]);
			rset=stmt.executeQuery();
			
		
			while(rset.next())
			{
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!loop2");
				strname = rset.getString("spname");
				stroccupation = rset.getString("spoccupation");
				straddress = rset.getString("address");
				strimg = rset.getString("spimg");
				stravailtiming=rset.getString("spavailtimings");
				strcontactno=rset.getString("spcontactno");
				strexp=rset.getString("experience");
				struid = rset.getString("spuid");
				strperhourprice=rset.getString("spperhourprice");
				%>
				<br><br>
				<a href='SpDesc.jsp?spuid=<%=struid%>'>
				<div class="container">
				    <div class="row">
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
				
	<%}			
		}
	}
	con.close();
}
if(q==15)
{
	Connection con=null;
	con= obj.getDBconnection();

	stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='tutior'");
	rset=stmt.executeQuery();
	while(rset.next())
	{
		l1.add(rset.getInt("experience"));
	}
	Collections.sort(l1,Collections.reverseOrder());
	Iterator itr=l1.iterator(); 
	int x[]=new int[100];
	int i=0;
	
	while(itr.hasNext()){ 
			
		x[i]=(int)itr.next();
		System.out.println(x[i]);
	i++;
	}
	System.out.println("length="+x.length);
	for(i=0;x[i]!=0;i++){
	
		if(x[i+1]==x[i]){
			continue;
		}
		else{
			System.out.println("!!!!!!!!!!!loop1");
			stmt=con.prepareStatement("select * from tblserviceprovider where spoccupation='tutior' and experience="+x[i]+"");
			System.out.println(x[i]);
			rset=stmt.executeQuery();
			
		
			while(rset.next())
			{
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!loop2");
				strname = rset.getString("spname");
				stroccupation = rset.getString("spoccupation");
				straddress = rset.getString("address");
				strimg = rset.getString("spimg");
				stravailtiming=rset.getString("spavailtimings");
				strcontactno=rset.getString("spcontactno");
				strexp=rset.getString("experience");
				struid = rset.getString("spuid");
				System.out.println("Exp - "+strexp);
				strperhourprice=rset.getString("spperhourprice");
				%>
				<br><br>
				<a href='SpDesc.jsp?spuid=<%=struid%>'>
				<div class="container">
				    <div class="row">
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
				
	<%}			
		}
	}
	con.close();
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

   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
  





</body>
</html>