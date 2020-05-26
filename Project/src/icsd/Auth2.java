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

@WebServlet("/Auth2")
public class Auth2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Auth2() {
        super();

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
		System.out.println(uid+pwd);
		
		try {
			stmt=con.prepareStatement("select * from tblserviceseeker where skuid=? and skpwd=?");
			stmt.setString(1, uid);
			stmt.setString(2, pwd);
			rset=stmt.executeQuery();
			if(rset.next())
			{
				HttpSession session = request.getSession();
				session.setAttribute("uid", uid);
				response.sendRedirect(request.getContextPath()+"/FrontPage.jsp");
			}
			else
			{
				response.sendRedirect(request.getContextPath()+"/signin2.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		}
	}


