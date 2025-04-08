<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>


	<h3 class="mt-2 text-center">All books is here</h3>

	<c:if test="${not empty succMsg}">
		<p class="text-center text-success">
			<b>${succMsg}</b>
		</p>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failMsg}">
		<p class="text-center text-danger">
			<b>${failMsg}</b>
		</p>
		<c:remove var="failMsg" scope="session" />
	</c:if>

	<div class="container">

		<table class="table table-hover">
			<thead>
				<tr style="background-color: #f1ffe8">
					<th scope="col">Id</th>
					<th scope="col">Image</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author Name</th>
					<th scope="col">Price</th>
					<th scope="col">Book Categories</th>
					<th scope="col">Book Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				BookDAOImpl bookDao = new BookDAOImpl(DBConnect.getConn());
				List<BookDetails> list = bookDao.getAllBooks();
				for (BookDetails bookDtls : list) {
				%>
				<tr>
					<td><%=bookDtls.getBookId()%></td>
					<td><img src="../book/<%=bookDtls.getPhotoName()%>"
						style="width: 48px; height: 65px"></td>
					<td><%=bookDtls.getBookName()%></td>
					<td><%=bookDtls.getAuthor()%></td>
					<td><%=bookDtls.getPrice()%>$</td>
					<td><%=bookDtls.getBookCategory()%></td>
					<td><%=bookDtls.getStatus()%></td>
					<td><a href="edit_books.jsp?id=<%=bookDtls.getBookId()%>"
						class="btn btn-primary btn-sm"> <i
							class="fa-regular fa-pen-to-square"></i> Edit
					</a> <a href="../delete?id=<%=bookDtls.getBookId()%>"
						class="btn btn-danger btn-sm"> <i class="fa-solid fa-trash"></i>
							Delete
					</a></td>
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