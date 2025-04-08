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

@WebServlet("/user_profile_update")
public class UserUpdateProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {			
			int userId = Integer.parseInt(req.getParameter("id"));
			String userName = req.getParameter("fullName");
			String email = req.getParameter("email");
			String phoneNumber = req.getParameter("phoneNumber");
			String password = req.getParameter("password");
			
			User user = new User();
			user.setId(userId);
			user.setName(userName);
			user.setEmail(email);
			user.setPhoneNumber(phoneNumber);
			
			
			HttpSession session = req.getSession();
			UserDAOImpl userDAO = new UserDAOImpl(DBConnect.getConn());
			boolean f = userDAO.checkPassword(userId, password);
			
			if(f) {
				boolean f2 = userDAO.userProfileUpdate(user);
				if(f2) {
					session.setAttribute("succMsg", "User Successfully Updated");
					resp.sendRedirect("user_edit_profile.jsp");
					
				}
				else {
					session.setAttribute("failMsg", "Something wrong on server");
					resp.sendRedirect("user_edit_profile.jsp");
				}
			}
			else {
				session.setAttribute("failMsg", "Password Is Incorrect");
				resp.sendRedirect("user_edit_profile.jsp");
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	

}
