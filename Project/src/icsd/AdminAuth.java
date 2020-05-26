package icsd;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminAuth
 */
@WebServlet("/AdminAuth")
public class AdminAuth extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAuth() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con=null;
		PreparedStatement stmt=null;
		ResultSet rset=null;
		DBhandler obj=new DBhandler();
		con=obj.getDBconnection();
		String id=request.getParameter("struid");
		String pwd=request.getParameter("strpwd");
		
		
		try {
			stmt=con.prepareStatement("select * from tbladmin where adminid=? and adminpwd=?");
			stmt.setString(1, id);
			stmt.setString(2, pwd);
			rset=stmt.executeQuery();
			if(rset.next())
			{
				HttpSession session4=request.getSession(false);
				session4.setAttribute("adminid", id);
				response.sendRedirect(request.getContextPath()+"/AdminPage.jsp");
			}
			else
			{
				response.sendRedirect(request.getContextPath()+"/adminSignIn.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
