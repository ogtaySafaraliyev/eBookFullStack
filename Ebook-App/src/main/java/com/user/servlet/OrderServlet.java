package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrderDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.OrderDetails;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int userId = Integer.parseInt(req.getParameter("userId"));

			String name = req.getParameter("userName");
			String email = req.getParameter("email");
			String phoneNumber = req.getParameter("phoneNumber");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pinCode = req.getParameter("pinCode");
			String paymentType = req.getParameter("paymentType");

			String fullAdd = address + ", " + landmark + ", " + city + ", " + state + ", " + pinCode;
			System.out.println(name + ", " + email + ", " + phoneNumber + " --> " + fullAdd + " || " + paymentType);
			
			HttpSession session = req.getSession();

			CartDAOImpl cardDAO = new CartDAOImpl(DBConnect.getConn());
			List<Cart> cartList = cardDAO.getBookByUser(userId);

			BookOrderDAOImpl orderDAO = new BookOrderDAOImpl(DBConnect.getConn());
			int i = orderDAO.orderCount(email);
			
			OrderDetails order = null;

			ArrayList<OrderDetails> orderList = new ArrayList<OrderDetails>();
//			Random random = new Random();
			for (Cart cart : cartList) {
				order = new OrderDetails();
				order.setOrderId("BOOK-ORDER-00"+i);     //+ random.nextInt(1000));
				order.setUserName(name);
				order.setEmail(email);
				order.setFullAddress(fullAdd);
				order.setPhoneNumber(phoneNumber);
				order.setBookName(cart.getBookName());
				order.setAuthor(cart.getAuthor());
				order.setPrice(cart.getPrice());
				order.setPaymentType(paymentType);
				orderList.add(order);
				i++;

			}

			if ("noSelect".equals(paymentType)) {
				session.setAttribute("orderFailMsg", "Please Select A Payment Type");
				resp.sendRedirect("checkout.jsp");

			}
			
			else if(cartList.isEmpty()) {
				session.setAttribute("orderFailMsg", "You Do not Have Any Book in Cart");
				resp.sendRedirect("checkout.jsp");
				
			}
			else {
				boolean f = orderDAO.saveOrder(orderList);

				if (f) {
//					session.setAttribute("orderSuccMsg", "Thank You For Your order..");
					resp.sendRedirect("order_success.jsp");
//					System.out.println("order success");
				} else {
					session.setAttribute("orderFailMsg", "Order Failed For Some Reason");
					resp.sendRedirect("checkout.jsp");
//					System.out.println("order failed for some reason");
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
