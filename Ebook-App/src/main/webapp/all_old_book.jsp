<%@page import="java.util.List"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Old Book</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd:hover {
	background: #c7bda7;
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<h4 class="mt-1 text-center">All Old Books</h4>
	<div style="background-color: #f1ffe8">

		<div class="container">
			<div class="row p-3">

				<%
				BookDAOImpl bookDAO3 = new BookDAOImpl(DBConnect.getConn());
				List<BookDetails> list3 = bookDAO3.getAllOldBooks();
				for (BookDetails bookDtls : list3) {
				%>

				<div class="col-md-3">
					<div class="mt-2 card crd">
						<div class="card-body text-center">
							<img alt="" src="book/<%=bookDtls.getPhotoName()%>"
								style="width: 160px; height: 240px">
							<p><%=bookDtls.getBookName()%></p>
							<p><%=bookDtls.getAuthor()%></p>
							<p>
								<i>Categories: <%=bookDtls.getBookCategory()%></i>
							</p>
							<div class="row text-center">
								<a href="view_book.jsp?bid=<%=bookDtls.getBookId()%>" class="ml-5 btn btn-outline-secondary btn-sm">View
									Details<span class="ml-1 text-center badge badge-light"><%=bookDtls.getPrice()%>$</span>
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
	</div>

</body>
</html>