<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Home</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
.card-body:hover {
	background: #f1ffe8;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>

</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp"/>
	</c:if>

	<div class="container">

		<div class="row p-5">

			<div class="mt-5 col-md-3">
				<a href="add_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<img width="61" height="61"
								src="https://img.icons8.com/external-kmg-design-detailed-outline-kmg-design/64/external-book-literature-kmg-design-detailed-outline-kmg-design.png"
								alt="external-book-literature-kmg-design-detailed-outline-kmg-design" />
							<h4>Add Books</h4>
							---------

						</div>
					</div>
				</a>
			</div>


			<div class="mt-5 col-md-3">
				<a href="all_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<img width="64" height="64"
								src="https://img.icons8.com/dotty/80/book-shelf.png"
								alt="book-shelf" />
							<h4>All Books</h4>
							---------
						</div>
					</div>
				</a>

			</div>


			<div class="mt-5 col-md-3">
				<a href="orders.jsp">
					<div class="card">

						<div class="card-body text-center">
							<img width="65" height="65"
								src="https://img.icons8.com/carbon-copy/100/purchase-order.png"
								alt="purchase-order" />
							<h4>Orders</h4>
							---------

						</div>
					</div>

				</a>

			</div>


			<div class="mt-5 col-md-3">

				<a data-toggle="modal" data-target="#exampleModalCenter">
					<div class="card">
						<div class="card-body text-center">
							<img width="64" height="64"
								src="https://img.icons8.com/external-kmg-design-detailed-outline-kmg-design/64/external-logout-real-estate-kmg-design-detailed-outline-kmg-design.png"
								alt="external-logout-real-estate-kmg-design-detailed-outline-kmg-design" />
							<h4>Logout</h4>
							---------

						</div>
					</div>
				</a>
			</div>
		</div>
	</div>

	<%--beginning of the logout modal --%>

	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="text-center">
						<h5>Are You Really Want To Logout?</h5>
						<button type="button" class="btn btn-secondary mr-3 mt-3"
							data-dismiss="modal">Cancel</button>
						<a href="../logout" type="button" class="btn btn-primary mt-3">Logout</a>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<%--ending of logout modal --%>


	<div style="margin-top: 370px;">
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>