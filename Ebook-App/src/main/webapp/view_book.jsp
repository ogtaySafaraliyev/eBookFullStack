<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f1ffe8">
	<%@include file="all_component/navbar.jsp"%>
	
	<%
	User user = (User) session.getAttribute("userobj");
	%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl bookDAO = new BookDAOImpl(DBConnect.getConn());
	BookDetails bookDtls = bookDAO.getBookById(bid);
	%>

	<div class="container p-3">

		<div class="row" style="background-color: #c7bda7">
			<div class="col-md-6 p-5 border">
				<img alt="" src="book/<%=bookDtls.getPhotoName()%>"
					style="width: 150px; height: 220px"><br>
				<h5 class="mt-2">
					<b>Book Name:</b>
					<%=bookDtls.getBookName()%>
				</h5>
				<h5>
					<b>Author:</b>
					<%=bookDtls.getAuthor()%>
				</h5>
				<h5>
					<b>Category:</b>
					<%=bookDtls.getBookCategory()%>
				</h5>
			</div>

			<div class="col-md-6 p-5 border bg-white">
				<h2><%=bookDtls.getBookName()%></h2>

				<div class="mt-4 row">

					<div class="col-md-4 text-center p-2">
						<i class="fa-solid fa-wallet fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-center p-2">
						<i class="fa-solid fa-arrow-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-center p-2">
						<i class="fa-solid fa-truck-fast fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>

				<%
				if ("Old".equals(bookDtls.getBookCategory())) {
				%>
				<div class="mt-3 row align-items-center">
					<div class="col-md-7 text-right p-2">
						<a href="index.jsp" class="ml-3 btn btn-success"><i
							class="fa-solid fa-bag-shopping"></i> Continue Shopping</a>
					</div>
					<div class="col-md-5 p-2">
						<h2>
							<span class="ml-2 text-center badge badge-secondary text">
								<span class="h5"><%=bookDtls.getPrice()%>$</span>
							</span>
						</h2>
					</div>
				</div>

				<%
				} else {
				%>

				<div class="mt-3 row align-items-center">
					<div class="col-md-6 text-right p-2">
						<%
								if (user == null) {
								%>
								<a href="login.jsp" class="ml-1 btn btn-primary btn-sm"><i
									class="fa-solid fa-cart-plus"></i> Add Cart</a>

								<%
								} else {
								%>
								<a
									href="cart?bid=<%=bookDtls.getBookId()%>&&uid=<%=user.getId()%>"
									class="ml-1 btn btn-primary btn-sm"><i
									class="fa-solid fa-cart-plus"></i> Add Cart</a>

								<%
								}
								%>					</div>
					<div class="col-md-6 p-2">
						<h2>
							<span class="ml-2 text-center badge badge-secondary text">
								<span class="h5">16$</span>
							</span>
						</h2>
					</div>
				</div>

				<%
				}
				%>

				<%
				if ("Old".equals(bookDtls.getBookCategory())) {
				%>
				<h6 class="mt-4 text-right">Contact with Seller</h6>
				<h6 class="text-right">
					<i class="fa-solid fa-envelope"></i> Email: <%=bookDtls.getUserEmail()%>
				</h6>

				<%
				}
				%>

			</div>

		</div>

	</div>

</body>
</html>