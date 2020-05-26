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
   
              
	 <title>Registered</title>
</head>
<body>
	

<%
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
Connection con = null;
ResultSet rset = null;
PreparedStatement stmt=null;

DBhandler obj = new DBhandler();
con=obj.getDBconnection();
String count1=null;
stmt=con.prepareStatement("select * from tblserviceseeker");
rset=stmt.executeQuery();
while(rset.next())
{
	count1=rset.getString("skuid");
	}
con.close();
int xy=Integer.parseInt(count1);
xy++;

System.out.println("!!!!!!!!!!");

System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
	
String strname,straddress,strcontactno,strpwd,strgender,strage,strimg,stremailid;
strname=request.getParameter("strname");
System.out.println(strname);
straddress=request.getParameter("straddress");
strcontactno=request.getParameter("strphoneno");
strpwd=request.getParameter("strpassword");
strage=request.getParameter("strage");
strgender=request.getParameter("strgender");
strimg=request.getParameter("strimg");
stremailid=request.getParameter("stremail");
System.out.println(stremailid);
con=obj.getDBconnection();
stmt=con.prepareStatement("insert into tblserviceseeker values(?,?,?,?,?,?,?,?,?)");
stmt.setString(1,Integer.toString(xy));
stmt.setString(2,strname);
stmt.setString(3, strage);
stmt.setString(4,strgender);
stmt.setString(5,straddress);
stmt.setString(6,strcontactno);
stmt.setString(7,strpwd);
stmt.setString(8,strimg);
stmt.setString(9,stremailid);


int x=stmt.executeUpdate();
con.close();
System.out.println(x);


%>
<br><br><br><br>
<style>

.h2{
text-align:center;
}
</style>
<h2>        Congratulations you are successfully registered your unique id is <%=xy%></h2>
<h2>        Sign in now </h2><br>

<button type="button" class="btn btn-primary text-secondary"><a href='signin2.jsp'>SignIn</a></button>
<!-- Footer -->
<br><br><br><br><script>
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