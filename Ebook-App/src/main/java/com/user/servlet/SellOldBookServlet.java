package com.user.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;

@WebServlet("/sell_old_book")
@MultipartConfig
public class SellOldBookServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String bookName = req.getParameter("bookName");
			String author = req.getParameter("author");
			Double price = Double.parseDouble(req.getParameter("price"));
			String categories = "Old";
			String status = "Active";
			String email = req.getParameter("userEmail");

			Part part = req.getPart("bookImg");
			String fileName = part.getSubmittedFileName();

			BookDetails bookdtls = new BookDetails(bookName, author, price, categories, status, fileName,
					email);
			System.out.println(bookdtls);

			BookDAOImpl daoimpl = new BookDAOImpl(DBConnect.getConn());
			boolean f = daoimpl.addBooks(bookdtls);

			HttpSession session = req.getSession();

			if (f) {
//				for open file in folder
				String path = getServletContext().getRealPath("") + "book";
//				System.out.println(path);
				File file = new File(path);
				part.write(path + File.separator + fileName);
//

				session.setAttribute("succMsg", "Book Successfully Sold");
				resp.sendRedirect("sell_old_book.jsp");
			} else {
				session.setAttribute("failMsg", "Something Wrong On Server");
				resp.sendRedirect("sell_old_book.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}


}
