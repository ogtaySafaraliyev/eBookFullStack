<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Success Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f1ffe8">
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>

	<div class="container text-center">

		<div class="mt-4 row p-3">

			<div class="mt-5 col-md-7 offset-md-3">
				<div class="card">
					<div class="card-body">

						<i class="mt-3 fa-solid fa-circle-check fa-4x"></i>
						<h2>Thank You For Your Order</h2>
						<h5>Within 7 days your product will be delivered in your
							address</h5>

						<a href="index.jsp" class="mt-3 btn btn-primary">Home</a> <a
							href="user_order.jsp" class="mt-3 btn btn-info ml-1">View
							Order List</a>
					</div>
				</div>
			</div>
		</div>

	</div>

	<div style="margin-top: 320px;">
		<%@include file="all_component/footer.jsp"%>
	</div>

</body>
</html>