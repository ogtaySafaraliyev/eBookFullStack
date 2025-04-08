<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDetails"%>
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
<title>All New Book</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd:hover {
	background: #c7bda7;
}

#snackbar {
	visibility: hidden;
	min-width: 250px;
	margin-left: -125px;
	background-color: #333;
	color: #fff;
	text-align: center;
	border-radius: 2px;
	padding: 16px;
	position: fixed;
	z-index: 1;
	left: 50%;
	bottom: 30px;
	font-size: 17px;
}

#snackbar.show {
	visibility: visible;
	-webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
	animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@
-webkit-keyframes fadein {
	from {bottom: 0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadein {
	from {bottom: 0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
-webkit-keyframes fadeout {
	from {bottom: 30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}

}
@
keyframes fadeout {
	from {bottom: 30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body>

	<%
	User user = (User) session.getAttribute("userobj");
	%>

	<c:if test="${not empty succMsg}">

		<div id="snackbar">${succMsg}</div>

		<script type="text/javascript">
			myFunction()
			function myFunction() {
				var x = document.getElementById("snackbar");
				x.className = "show";
				setTimeout(function() {
					x.className = x.className.replace("show", "");
				}, 4000);
			}
		</script>

		<c:remove var="succMsg" scope="session" />

	</c:if>

	<%@include file="all_component/navbar.jsp"%>
	<h4 class="mt-1 text-center">All New Books</h4>
	<div style="background-color: #f1ffe8">

		<div class="container">
			<div class="row p-3">
				<%
				BookDAOImpl bookDAO = new BookDAOImpl(DBConnect.getConn());
				List<BookDetails> list = bookDAO.getAllNewBooks();
				for (BookDetails bookDtls : list) {
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

								<a href="view_book.jsp?bid=<%=bookDtls.getBookId()%>" class="ml-1 btn btn-outline-secondary btn-sm">View
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