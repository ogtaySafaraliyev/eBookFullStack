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


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		try {
			String name = req.getParameter("fullName");
			String email = req.getParameter("email");
			String phoneNumber = req.getParameter("phoneNumber");
			String password = req.getParameter("password");
			String check = req.getParameter("check"); 
			
//			System.out.println(name+" "+email+ " "+phoneNumber+" "+password+" "+check);			
			
			User user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setPhoneNumber(phoneNumber);
			user.setPassword(password);
			
			HttpSession session = req.getSession();
			
			if(check!=null) {
				UserDAOImpl daoImpl = new UserDAOImpl(DBConnect.getConn());		
				
				boolean isSmthng = daoImpl.checkUserExist(email);
				
				if(!isSmthng) {
					boolean f = daoImpl.userRegister(user); 

					if(f) {				
//						System.out.println("User registration successfully finished...");					
						session.setAttribute("succMsg", "User registration successfully finished");
						resp.sendRedirect("register.jsp");
					}
					else {
//						System.out.println("Something wrong on server...");
						session.setAttribute("failMsg", "Something wrong on server");
						resp.sendRedirect("register.jsp");					
					}
				}
				
				else {
					session.setAttribute("failMsg", "User already exist");
					resp.sendRedirect("register.jsp");
				}
				
									
			}
			
			else {
//				System.out.println("Please check if you click on Agree terms and Condition");
				session.setAttribute("failMsg", "Please check if you click on Agree terms and Condition");
				resp.sendRedirect("register.jsp");
			}						
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	

}
