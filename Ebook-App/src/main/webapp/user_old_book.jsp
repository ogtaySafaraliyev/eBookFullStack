<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Setting Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f1ffe8">
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>


	<div class="container">
		<h3 class="mt-2 mb-4 text-center">Old Books List</h3>

		<c:if test="${not empty succMsg}">
			<div class="alert alert-success" role="alert">${succMsg}</div>
			<c:remove var="succMsg" scope="session" />
		</c:if>

		<c:if test="${not empty failMsg}">
			<div class="alert alert-danger" role="alert">${failMsg}</div>
			<c:remove var="failMsg" scope="session" />
		</c:if>

		<table class="table table-hover table-light">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>


				<%
				User user = (User) session.getAttribute("userobj");
				String email = user.getEmail();
				BookDAOImpl bookDAO = new BookDAOImpl(DBConnect.getConn());
				List<BookDetails> list = bookDAO.getBookByOldForUser(email, "Old");

				for (BookDetails bookDtls : list) {
				%>
				<tr>
					<td><%=bookDtls.getBookName()%></td>
					<td><%=bookDtls.getAuthor()%></td>
					<td><%=bookDtls.getPrice()%></td>
					<td><%=bookDtls.getBookCategory()%></td>

					<td><a href="delete_old_book_by_user?email=<%=bookDtls.getUserEmail()%>&&bookId=<%=bookDtls.getBookId()%>" class="btn btn-sm btn-danger">Delete</a></td>
				</tr>

				<%
				}
				%>

			</tbody>
		</table>

	</div>

</body>
</html>