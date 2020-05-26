package icsd;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Auth")
public class Auth extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Auth() {
        super();
       
    }

	
	public void init(ServletConfig config) throws ServletException {
		
	}

	public void destroy() {
		
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	Connection con=null;
	PreparedStatement stmt=null;
	ResultSet rset=null;
	DBhandler obj=new DBhandler();
	con=obj.getDBconnection();
	String uid=request.getParameter("struid");
	String pwd=request.getParameter("strpwd");
	
	
	try {
		stmt=con.prepareStatement("select * from tblserviceprovider where spuid=? and sppwd=?");
		stmt.setString(1, uid);
		stmt.setString(2, pwd);
		rset=stmt.executeQuery();
		if(rset.next())
		{
			HttpSession session4=request.getSession(false);
			session4.setAttribute("spuid", uid);
			response.sendRedirect(request.getContextPath()+"/WelcomePage.jsp");
		}
		else
		{
			response.sendRedirect(request.getContextPath()+"/signin.jsp");
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	}
 
}
