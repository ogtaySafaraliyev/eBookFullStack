package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));

			String userName = req.getParameter("userName");

			BookDAOImpl bookDAO = new BookDAOImpl(DBConnect.getConn());
			BookDetails bookDtls = bookDAO.getBookById(bid);

			Cart cart = new Cart();
			cart.setBookId(bid);
			cart.setUserId(uid);
			cart.setBookName(bookDtls.getBookName());
			cart.setAuthor(bookDtls.getAuthor());
			cart.setPrice(bookDtls.getPrice());
			cart.setTotalPrice(bookDtls.getPrice());

			HttpSession session = req.getSession();

			CartDAOImpl cartDAO = new CartDAOImpl(DBConnect.getConn());
			boolean f = cartDAO.addCart(cart);

			if (f) {
				session.setAttribute("succMsg", "Book added to cart");
				resp.sendRedirect("all_new_book.jsp");
//					System.out.println("book added to cart");
			} else {
				session.setAttribute("failMsg", "Book did not added to cart");
				resp.sendRedirect("all_new_book.jsp");
//					System.out.println("book did not added to cart");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
