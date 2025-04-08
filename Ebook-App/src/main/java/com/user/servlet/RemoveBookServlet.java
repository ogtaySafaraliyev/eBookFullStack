package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

@WebServlet("/removeBook")
public class RemoveBookServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int bid = Integer.parseInt(req.getParameter("bid"));
		int uid = Integer.parseInt(req.getParameter("uid"));
		int cid = Integer.parseInt(req.getParameter("cid"));
		
		CartDAOImpl cartDAO = new CartDAOImpl(DBConnect.getConn());
		boolean f = cartDAO.deleteBookById(bid, uid, cid);
		
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("succMsg", "Book Successfully Deleted From Cart");
			resp.sendRedirect("checkout.jsp");
		}
		else {
			session.setAttribute("failMsg", "Something Wrong On Server");
			resp.sendRedirect("checkout.jsp");
		}

	}
		

}
