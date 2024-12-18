

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Product;
import dao.ProductDao;

/**
 * Servlet implementation class DisplayProduct
 */
@WebServlet("/user-protected/displayProduct")
public class DisplayProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("productId"));
		System.out.println(id);
		Product product = ProductDao.getProductById(id);
		request.setAttribute("product", product);
		RequestDispatcher rd = request.getRequestDispatcher("productInfo.jsp");
		rd.forward(request, response);
	}
}
