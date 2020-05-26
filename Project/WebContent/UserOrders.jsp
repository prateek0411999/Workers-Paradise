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
   
	 <title>USER ORDERS</title>
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
      String spuid=(String)session1.getAttribute("spuid");
      if(spuid==null)
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
        <a class="nav-link text-bold text-secondary">Hello <%=str %></a>
      </li>
     
      <%} %>
    </ul>
  </div>
</nav>
</header>


<%
String strspname=null,strspcontact=null,strbookingtiming=null,strbookingdate=null,strbookingstatus=null,spperhourprice=null,spoccupation=null,spemailid=null,strexp=null;
int bid;
Connection con=null;
ResultSet rset =null;
PreparedStatement stmt= null;
DBhandler obj=new DBhandler();
con=obj.getDBconnection();
stmt=con.prepareStatement("select spname,spperhourprice,spoccupation,spemailid,spcontactno,experience,bid,bookingtiming,bookingdate,bookingstatus from tblserviceprovider, tblbooking where tblserviceprovider.spuid=tblbooking.spuid and skuid=?");
stmt.setString(1,str);
rset=stmt.executeQuery();
%>
<style>
body{
    background: -webkit-linear-gradient(left, #3931af, #00c6ff);
}
.emp-profile{
    padding: 3%;
    margin-top: 3%;
    margin-bottom: 3%;
    border-radius: 0.5rem;
    background: #fff;
}
.profile-img{
    text-align: center;
}
.profile-img img{
    width: 70%;
    height: 100%;
}
.profile-img .file {
    position: relative;
    overflow: hidden;
    margin-top: -20%;
    width: 70%;
    border: none;
    border-radius: 0;
    font-size: 15px;
    background: #212529b8;
}
.profile-img .file input {
    position: absolute;
    opacity: 0;
    right: 0;
    top: 0;
}
.profile-head h5{
    color: #333;
}
.profile-head h6{
    color: #0062cc;
}
.profile-edit-btn{
    border: none;
    border-radius: 1.5rem;
    width: 70%;
    padding: 2%;
    font-weight: 600;
    color: #6c757d;
    cursor: pointer;
}
.proile-rating{
    font-size: 12px;
    color: #818182;
    margin-top: 5%;
}
.proile-rating span{
    color: #495057;
    font-size: 15px;
    font-weight: 600;
}
.profile-head .nav-tabs{
    margin-bottom:5%;
}
.profile-head .nav-tabs .nav-link{
    font-weight:600;
    border: none;
}
.profile-head .nav-tabs .nav-link.active{
    border: none;
    border-bottom:2px solid #0062cc;
}
.profile-work{
    padding: 14%;
    margin-top: -15%;
}
.profile-work p{
    font-size: 12px;
    color: #818182;
    font-weight: 600;
    margin-top: 10%;
}
.profile-work a{
    text-decoration: none;
    color: #495057;
    font-weight: 600;
    font-size: 14px;
}
.profile-work ul{
    list-style: none;
}
.profile-tab label{
    font-weight: 600;
}
.profile-tab p{
    font-weight: 600;
    color: #0062cc;
}
</style>
<%
while(rset.next())
{
  	strspname=rset.getString("spname");
  	strspcontact=rset.getString("spcontactno");
  	bid=rset.getInt("bid");
  	strbookingtiming=rset.getString("bookingtiming");
  	strbookingdate=rset.getString("bookingdate");
  	strbookingstatus=rset.getString("bookingstatus");
  	spoccupation=rset.getString("spoccupation");
  	spperhourprice=rset.getString("spperhourprice");
  	spemailid=rset.getString("spemailid");
  	strexp=rset.getString("experience");
  	
  	%><br><br>
  	<div class="container emp-profile">
        <div class="row">
            
            <div class="col-md-6">
                <div class="profile-head">
                            <h5>
                                <%=strspname %>
                            </h5>
                            <h6>
                                <%=spoccupation %>
                            </h6>
                            <p class="proile-rating">Booking Status : <span><%=strbookingstatus %></span></p>
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">About</a>
                        </li>
                        
                    </ul>
                </div>
            </div>
            <% 
            if(strbookingstatus.equals("Completed"))
            {%>
            
            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">
    FEEDBACK
  </button>
 
  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">FILL DETAILS</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
       
 <form action="feedback.jsp">
 <div class="container">
  <input type="hidden" name="bid" value="<%=bid %>">
  REVIEW:
  <input type="text" style="height:200px" name="review" required>
 
<br><br>

    RATING:
  <input type="text" name="rating" required>
 <br> <br>
  
<input type="submit" class="btn btn-primary">
       
        </div>
        </form> 
  
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
      
        
      </div>
    </div>
  </div>
 
     </div>  
     
          <%  }
            %>
                    </div>
        <div class="row">
            <div class="col-md-8">
                <div class="tab-content profile-tab" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Booking ID</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p><%=bid %></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>SP Name</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p><%=strspname %></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Booking Date</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p><%=strbookingdate %></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Booking Time</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p><%=strbookingtiming %></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Phone</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p><%=strspcontact %></p>
                                    </div>
                                </div>
                    </div>
                                              
                </div>
            </div>
        </div>
    </form>           
</div><br>
<%}
con.close();
%>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
 
 


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