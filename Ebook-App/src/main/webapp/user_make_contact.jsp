<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Page</title>
<%@include file="all_component/allCss.jsp"%>

<style type="text/css">
.card-body: {
	background-color: #c7bda7;;
}
</style>

</head>
<body style="background-color: #f1ffe8">
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>

	<div class="container">
		<h4 class="mt-3 text-center mb-2">Make Contact With Admin</h4>
		<div class="mt-4 row p-3">

			<div class="col-md-4 offset-md-4">

				<div class="card">
					<div class="card-body">

						<div class="mt-3 text-primary mb-4">
							<i class="fa-solid fa-phone fa-3x"></i>
						</div>

						<h4>24*7 Service</h4>
						<h4>Help Center</h4>
						<h5 class="mt-5">Number: <i>+994 50 555 66 77</i></h5>
						<h5 class="mb-3">Mail: <i>admin@gmail.com</i></h5>
						
						<a href="index.jsp" class="btn btn-primary">Home</a>

					</div>
				</div>

			</div>
		</div>
	</div>

	<div style="margin-top: 230px;">
		<%@include file="all_component/footer.jsp"%>
	</div>

</body>
</html>