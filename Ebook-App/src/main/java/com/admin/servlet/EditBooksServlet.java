package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;

@WebServlet("/editbooks")
public class EditBooksServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {			
			int id = Integer.parseInt(req.getParameter("id"));			
			String bookName = req.getParameter("bookName");
			String author = req.getParameter("author");			
			Double price = Double.parseDouble(req.getParameter("price"));			
			String categories = req.getParameter("bookType");
			String status = req.getParameter("bookStatus");

//			Part part = req.getPart("bookImg");
//			String fileName = part.getSubmittedFileName();
			
			BookDetails bookDetails = new BookDetails();
			bookDetails.setBookId(id);
			bookDetails.setBookName(bookName);
			bookDetails.setAuthor(author);
			bookDetails.setPrice(price);
			bookDetails.setBookCategory(categories);
			bookDetails.setStatus(status);
//			bookDetails.setPhotoName(fileName);
			bookDetails.setUserEmail("admin@gmail.com");
			
			BookDAOImpl bookDAOImpl = new BookDAOImpl(DBConnect.getConn());
			boolean f = bookDAOImpl.updateBooks(bookDetails);
			
			HttpSession session = req.getSession();
			
			if(f) {
//				String path = getServletContext().getRealPath("") + "book";
//				System.out.println(path);
//				File file = new File(path);
//				part.write(path + File.separator + fileName);
				
				session.setAttribute("succMsg", "Book Successfully Updated");
				resp.sendRedirect("admin/all_books.jsp");
			}
			else {
				session.setAttribute("failMsg", "Sometging Wrong On Server");
				resp.sendRedirect("admin/all_books.jsp");
			}
						
		} catch (Exception e) {
			e.printStackTrace();
		}
				
	}
	
	

}
