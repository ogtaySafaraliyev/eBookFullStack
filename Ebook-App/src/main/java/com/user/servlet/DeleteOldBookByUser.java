package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

@WebServlet("/delete_old_book_by_user")
public class DeleteOldBookByUser extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int bookId = Integer.parseInt(req.getParameter("bookId"));
			String email = req.getParameter("email");
//			String category = req.getParameter("category");			

			BookDAOImpl bookDAO = new BookDAOImpl(DBConnect.getConn());
			boolean f = bookDAO.oldBookDeleteByUser(bookId, email, "Old");

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succMsg", "Book Successfully Deleted from Your List");
				resp.sendRedirect("user_old_book.jsp");
			} else {
				session.setAttribute("failMsg", "Something Is Wrong on Server");
				resp.sendRedirect("user_old_book.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
