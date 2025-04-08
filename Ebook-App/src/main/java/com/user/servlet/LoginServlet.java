package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			UserDAOImpl userDao = new UserDAOImpl(DBConnect.getConn());
			HttpSession session = req.getSession();

			String email = req.getParameter("email");
			String password = req.getParameter("password");

			// block for admin login
			if ("admin@gmail.com".equals(email) && "1234".equals(password)) {
				User user = new User();
				user.setName("Admin");
				session.setAttribute("userobj", user);
				resp.sendRedirect("admin/home.jsp");
//				return;    // avoids IllegalStateException 
			}
			// block for user login
			else {

				User user = userDao.login(email, password);
				if (user != null) {
					session.setAttribute("userobj", user);
					resp.sendRedirect("index.jsp");
//					return;   // avoids IllegalStateException 
				} else {
					session.setAttribute("failMsg", "Check If You Correctly Entered Email or Password");
					resp.sendRedirect("login.jsp");
					
				}
				resp.sendRedirect("home.jsp");
//				return;   // avoids IllegalStateException 
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
