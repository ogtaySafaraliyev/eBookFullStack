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

<style type="text/css">
.card-body:hover {
	background: #c7bda7;;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}

h2 {
	background: white;
}
</style>
</head>
<body style="background-color: #f1ffe8">
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>

	<div style="background-color: #f1ffe8">
		<h2 class="mb-5 text-center">Setting Page</h2>
		<div class="container">

			<div class="mt-6 row">
				<div class="col-md-6">

					<a href="sell_old_book.jsp">
						<div class="mt-5 card">
							<div class="card-body text-center">

								<i class="fa-solid fa-book-open fa-3x"></i>
								<h3>Sell Old Book</h3>
								<p>You Can Sell Old Books by Clicking Here</p>
							</div>
						</div>
					</a>
				</div>


				<div class="col-md-3">

					<a href="user_old_book.jsp">
						<div class="mt-5 card">
							<div class="card-body text-center">

								<i class="fa-solid fa-book-open-reader fa-3x"></i>
								<h3>Old Book</h3>
								<p>Books Which You Sold</p>
							</div>
						</div>
					</a>
				</div>


				<div class="col-md-3">
					<a href="user_edit_profile.jsp">
						<div class="mt-5 card">
							<div class="card-body text-center">

								<i class="fa-solid fa-user-pen fa-3x"></i>
								<h3>Edit Profile</h3>
								<p>Edit Your Profile</p>
							</div>
						</div>
					</a>
				</div>

			</div>


			<div class="row">
				<div class="col-md-6">
					<a href="user_order.jsp">
						<div class="mt-5 card">
							<div class="card-body text-center">

								<i class="fa-brands fa-shopify fa-3x"></i>
								<h3>Orders</h3>
								<p>You Can Check Your Orders Here</p>
							</div>
						</div>
					</a>
				</div>


				<div class="col-md-3">
					<a href="user_address.jsp">
						<div class="mt-5 card">
							<div class="card-body text-center">

								<i class="fa-solid fa-location-dot fa-3x"></i>
								<h3>Your Location</h3>
								<p>Edit Your Location</p>
							</div>
						</div>
					</a>
				</div>


				<div class="col-md-3">
					<a href="user_make_contact.jsp">
						<div class="mt-5 card">
							<div class="card-body text-center">
								<i class="fa-solid fa-square-phone fa-3x"></i>
								<h3>Call Center</h3>
								<p>Contact With Service</p>
							</div>
						</div>
					</a>

				</div>
			</div>
		</div>
	</div>



	<div style="margin-top: 150px;">
		<%@include file="all_component/footer.jsp"%>
	</div>



</body>
</html>