<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>
<%@page import="com.entity.OrderDetails"%>
<%@page import="java.util.List"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Orders</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

<div class="container">
	<h3 class="mt-2 text-center">All orders are here</h3>

	<table class="table table-striped" style="background-color: #f1ffe8">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone Number</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>

			<%
			BookOrderDAOImpl bookOrderDAO = new BookOrderDAOImpl(DBConnect.getConn());
			List<OrderDetails> orderList = bookOrderDAO.getListOfAllOrder();
			for (OrderDetails orderDtls : orderList) {
			%>
			<tr>
				<th><%=orderDtls.getOrderId()%></th>
				<td><%=orderDtls.getUserName()%></td>
				<td><%=orderDtls.getEmail()%></td>
				<td><%=orderDtls.getFullAddress()%></td>
				<td><%=orderDtls.getPhoneNumber()%></td>
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

	<div style="margin-top: 320px;">
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>