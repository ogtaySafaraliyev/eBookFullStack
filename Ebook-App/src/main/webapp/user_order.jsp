<%@page import="com.entity.OrderDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Orders Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f1ffe8">
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>

	<div class="container">

		<h3 class="mt-2 mb-4 text-center">Your Order List</h3>

		<table class="table table-hover table-light">
			<thead class="thead-light">
				<tr>
					<th scope="col">Order Id</th>					
					<th scope="col">Email</th>
					<th scope="col">Address</th>
					<th scope="col">Book Name</th>					
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>

				<%
				User user = (User) session.getAttribute("userobj");
				String email = user.getEmail();
				BookOrderDAOImpl bookDAO = new BookOrderDAOImpl(DBConnect.getConn());
				List<OrderDetails> orderList = bookDAO.getListOfOrder(email);
				for (OrderDetails orderDtls : orderList) {
				%>

				<tr>
					<th><%=orderDtls.getOrderId()%></th>
					<td><%=orderDtls.getEmail()%></td>
					<td><%=orderDtls.getFullAddress()%></td>
					<td><%=orderDtls.getBookName()%></td>
					<td><%=orderDtls.getAuthor()%></td>
					<td><%=orderDtls.getPrice()%></td>
					<td><%=orderDtls.getPaymentType()%></td>
				</tr>
				<%
				}
				%>

			</tbody>
		</table>

	</div>


</body>
</html>