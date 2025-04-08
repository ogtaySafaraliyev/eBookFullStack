<%@page import="java.util.List"%>
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
<title>Ebook: Index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">

.back-image {
	background: url("image/Library-Picture-Crop.jpg");
	height: 60vh;
	width: 100%;
	background-size: cover;
	background-repeat: no repeat;
}

.crd:hover {
	background: #c7bda7;
}

</style>
</head>
<body>

	<%
	User user = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-image"></div>


	<%--beginning of the recent book --%>
	<div style="background-color: #f1ffe8">
		<div class="container">
			<h3>Recent Book</h3>

			<div class="row p-1">

				<%
				BookDAOImpl bookDAO2 = new BookDAOImpl(DBConnect.getConn());
				List<BookDetails> list2 = bookDAO2.getRecentBooks();
				for (BookDetails bookDtls : list2) {
				%>
				<div class="col-md-3">
					<div class="card crd">
						<div class="card-body text-center">
							<img alt="" src="book/<%=bookDtls.getPhotoName()%>"
								style="width: 160px; height: 240px">
							<p class="mt-1 text"><%=bookDtls.getBookName()%></p>
							<p><%=bookDtls.getAuthor()%></p>
							<p>
								<%
								if (bookDtls.getBookCategory().equals("Old")) {
								%>
								<i>Categories: <%=bookDtls.getBookCategory()%></i>
							</p>
							<div class="row">
								<a href="view_book.jsp?bid=<%=bookDtls.getBookId()%>"
									class="ml-5 btn btn-outline-secondary btn-sm">View Details<span
									class="ml-1 text-center badge badge-light"><%=bookDtls.getPrice()%>$</span>
								</a>
							</div>
							<p>
								<%
								} else {
								%>
								<i>Categories: <%=bookDtls.getBookCategory()%></i>
							</p>
							<div class="row">
							
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
								%>

								<a href="view_book.jsp?bid=<%=bookDtls.getBookId()%>"
									class="ml-1 btn btn-outline-secondary btn-sm">View Details<span
									class="ml-1 text-center badge badge-light"><%=bookDtls.getPrice()%>$</span></a>
							</div>

							<%
							}
							%>

						</div>
					</div>
				</div>
				<%
				}
				%>

			</div>
		</div>

		<div class="mt-2 text-center">
			<a href="all_recent_book.jsp"
				class="btn btn-secondary btn-sm text-center">View All</a>
		</div>
	</div>

	<%--End of the Recent Book --%>

	<hr>

	<%--beginning of the New Book --%>

	<div style="background: #f1ffe8">
		<div class="container">
			<h3>New Book</h3>
			<div class="row">

				<%
				BookDAOImpl bookDAO = new BookDAOImpl(DBConnect.getConn());
				List<BookDetails> list = bookDAO.getNewBooks();
				for (BookDetails bookDtls : list) {
				%>

				<div class="col-md-3">
					<div class="card crd">
						<div class="card-body text-center">
							<img alt="" src="book/<%=bookDtls.getPhotoName()%>"
								style="width: 160px; height: 240px">
							<p><%=bookDtls.getBookName()%></p>
							<p><%=bookDtls.getAuthor()%></p>
							<p>
								<i>Categories: <%=bookDtls.getBookCategory()%></i>
							</p>
							<div class="row">

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
								%>

								<a href="view_book.jsp?bid=<%=bookDtls.getBookId()%>"
									class="ml-1 btn btn-outline-secondary btn-sm">View Details
									<span class="ml-1 text-center badge badge-light"><%=bookDtls.getPrice()%>$</span>
								</a>

							</div>
						</div>
					</div>
				</div>

				<%
				}
				%>

			</div>
		</div>

		<div class="mt-2 text-center">
			<a href="all_new_book.jsp"
				class="btn btn-secondary btn-sm text-center">View All</a>
		</div>
	</div>

	<%--End of the New Book --%>

	<hr>

	<%--beginning of the Old Book --%>

	<div style="background: #f1ffe8">
		<div class="container">
			<h3>Old Book</h3>
			<div class="row">

				<%
				BookDAOImpl bookDAO3 = new BookDAOImpl(DBConnect.getConn());
				List<BookDetails> list3 = bookDAO3.getOldBooks();
				for (BookDetails bookDtls : list3) {
				%>

				<div class="col-md-3">
					<div class="card crd">
						<div class="card-body text-center">
							<img alt="" src="book/<%=bookDtls.getPhotoName()%>"
								style="width: 160px; height: 240px">
							<p><%=bookDtls.getBookName()%></p>
							<p><%=bookDtls.getAuthor()%></p>
							<p>
								<i>Categories: <%=bookDtls.getBookCategory()%></i>
							</p>
							<div class="row text-center">
								<a href="view_book.jsp?bid=<%=bookDtls.getBookId()%>"
									class="ml-5 btn btn-outline-secondary btn-sm">View Details
									<span class="ml-1 text-center badge badge-light"><%=bookDtls.getPrice()%>$</span>
								</a>

							</div>
						</div>
					</div>
				</div>
				<%
				}
				%>

			</div>

		</div>

		<div class="mt-2 text-center">
			<a href="all_old_book.jsp"
				class="btn btn-secondary btn-sm text-center">View All</a>
		</div>
	</div>

	<%--End of the Old Book --%>

	<%@include file="all_component/footer.jsp"%>

</body>
</html>