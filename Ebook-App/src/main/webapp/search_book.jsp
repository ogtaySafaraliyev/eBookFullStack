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
<title>All Recent Book</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd:hover {
	background: #c7bda7;
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<h4 class="mt-1 text-center">All Recent Books</h4>
	<div style="background-color: #f1ffe8">

		<div class="container">

			<div class="row p-3">

				<%
				User user = (User) session.getAttribute("userobj");
				%>

				<%
				String searchingFor = request.getParameter("searchSomething");

				BookDAOImpl bookDAO2 = new BookDAOImpl(DBConnect.getConn());
				List<BookDetails> list2 = bookDAO2.getBookBySearch(searchingFor);
				for (BookDetails bookDtls : list2) {
				%>
				<div class="col-md-3">
					<div class="mt-2 card crd">
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
	</div>

</body>
</html>