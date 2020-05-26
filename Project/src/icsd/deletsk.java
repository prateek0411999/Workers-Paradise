package icsd;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class deletsk
 */
@WebServlet("/deletsk")
public class deletsk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deletsk() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
	  String strskid;
	  strskid=request.getParameter("skid");
	  
	  Connection con=null;
	  int rset1=0,rset2=0,rset3 =0;
	  PreparedStatement stmt=null;
	  DBhandler obj=new DBhandler();
	  con=obj.getDBconnection();
	  try {
		  
		stmt=con.prepareStatement("delete from tblfeedback where skuid=?");
	    stmt.setString(1, strskid);

	    rset1=stmt.executeUpdate();
	    
	    stmt=con.prepareStatement("delete from tblbooking where skuid=?");
	    stmt.setString(1, strskid);

	    rset2=stmt.executeUpdate();

	    stmt=con.prepareStatement("delete from tblserviceseeker where skuid=?");
	    stmt.setString(1, strskid);

	    rset3=stmt.executeUpdate();

	    if(rset1==0&&rset2==0&&rset3==0)
	    {
	    	out.println("<html><head></head><body><br><br><br><h2>SORRY NO SUCH USER EXIST  :-(</h2><br><a href='AdminPage.jsp'>GO BACK</a></body></html>");
	    }
	    else
	    {
	    	out.println("<html><head></head><body><br><br><br><h2>SERVICE SEEKER DELETED  :-)</h2><br><a href='AdminPage.jsp'>GO BACK</a></body></html>");
	    }
	    
	  } catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	}
	}


