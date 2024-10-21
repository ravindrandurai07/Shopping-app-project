

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;

@WebServlet("/login")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserDao userDao = UserDao.getUser(username, password);
		
		try {
			
			if (userDao != null && userDao.getPassword().equals(password)) {	
				response.sendRedirect("home.jsp");
			}
			else {
				request.setAttribute("errorMessage", "enter correct username and password");
				RequestDispatcher rd = request.getRequestDispatcher("user-login.jsp");
				rd.forward(request, response);
			}
		}
		catch (ServletException | IOException e) {
			System.out.println(e.getMessage());
		}

	}

}