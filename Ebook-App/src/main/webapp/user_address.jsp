<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@page import="com.entity.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Location Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f1ffe8">
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>

	<div class="container p-3">

		<div class="mt-5 row p-2">

			<div class="col-md-6 offset-md-3">

				<div class="card">

					<div class="card-body">
						<h4 class="text-center mb-4">User Location Page</h4>

						<%
						User user = (User) session.getAttribute("userobj");
						%>

						<form action="">

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="validationDefault02">Address</label> <input
										type="text" class="form-control" id="validationDefault02"
										placeholder="Last name" value="<%=user.getAddress()%>">
								</div>
								<div class="form-group col-md-6">
									<label for="validationDefault02">Landmark</label> <input
										type="text" class="form-control" id="validationDefault02"
										placeholder="Last name" value="<%=user.getAddress()%>">
								</div>
							</div>


							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="validationDefault01">State</label> <input
										type="text" class="form-control" id="validationDefault01"
										placeholder="First name" value="Mark" required>
								</div>
								<div class="form-group col-md-3">
									<label for="validationDefault02">City</label> <input
										type="text" class="form-control" id="validationDefault02"
										placeholder="Last name" value="Otto" required>
								</div>
								<div class="form-group col-md-3">
									<label for="validationDefault02">Pin</label> <input type="text"
										class="form-control" id="validationDefault02"
										placeholder="Last name" value="Otto" required>
								</div>

							</div>

							<button class="btn btn-warning">Add</button>

						</form>



					</div>
				</div>
			</div>
		</div>
	</div>


	<div style="margin-top: 280px;">
		<%@include file="all_component/footer.jsp"%>
	</div>


</body>
</html>