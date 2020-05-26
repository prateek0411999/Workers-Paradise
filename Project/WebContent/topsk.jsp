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
   
	 <title>TOPsk</title>
	
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
</nav>
</header>
<br><br><br>
<h2 class="text-center">TOP 5 SERVICE SEEKERS</h2>
<hr>
<br><br>
<%
String strskid,strskname,strskaddress,strskconno,strskemail;
int totalorder;
Connection con=null,con1=null;
ResultSet rset=null,rset1=null;
PreparedStatement stmt=null,stmt1=null;
DBhandler obj=new DBhandler();
DBhandler obj1=new DBhandler();
try{
	con=obj.getDBconnection();
	stmt=con.prepareStatement("select   skuid,cntbid   from (select   skuid,count(bid) as cntbid  from tblbooking group by (skuid)  ) order by cntbid desc");
    rset=stmt.executeQuery();
    System.out.println("???????????????????????????????????????????????");
    for(int i=0;i<5;i++){
    	rset.next();
    	strskid=rset.getString("skuid");
        totalorder=rset.getInt("cntbid");
        con1=obj1.getDBconnection();
        System.out.println(strskid);
        stmt1=con1.prepareStatement("select * from tblserviceseeker where skuid=?");
        stmt1.setString(1, strskid);
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        rset1=stmt1.executeQuery();
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!");
        while(rset1.next())
        {
        	strskname=rset1.getString("skname");
        	strskaddress=rset1.getString("skaddress");
        	strskconno=rset1.getString("skmobileno");
        	strskemail=rset1.getString("skemailid");
        	
        	%>
        	

        	<br><br>
        <center>
        	<div class="container-fluid well span6">
        		<div class="row-fluid">
        	        <div class="span2" >
        			    <img src="face.jpg" class="img-circle" height=150px,width=150px/>
        	        </div>
        	        
        	        <div class="span8">
        	            <h3><%=strskname %></h3>
        	             <h6>ID: <%=strskid %></h6>
        	              <h6>TOTAL ORDERS: <%=totalorder %></h6>
        	            <h6>ADDRESS: <%=strskaddress %></h6>
        	            <h6>CONTACT NO: <%=strskconno %></h6>
        	            <h6>EMAIL ID: <%=strskemail %></h6>
        	        </div>
        	        
        	      
        	</div>
        	</div>
        	</center>
        	<br><br>
       <% }con1.close();
        
    }
con.close();
}catch(SQLException e11){
	
}
%>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
  
</body>
</html>