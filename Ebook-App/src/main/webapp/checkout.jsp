<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f1ffe8">
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<div class="container">

		<div class="row p-5">
			<div class="mt-2 col-md-7">

				<c:if test="${not empty succMsg}">
					<div class="alert alert-success" role="alert">${succMsg}</div>
					<c:remove var="succMsg" scope="session" />
				</c:if>
<%-- 
				<c:if test="${empty failMsg}">
					<div class="alert alert-secondary" role="alert">${failMsg}</div>
					<c:remove var="failMsg" scope="session" />
				</c:if>
--%>

				<div class="card">
					<h4 class="mt-3 text-center">
						<strong>Your books which are selected for cart</strong>
					</h4>
					<div class="mt-1 card-body">

						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								User user = (User) session.getAttribute("userobj");
								CartDAOImpl cartDAO = new CartDAOImpl(DBConnect.getConn());
								List<Cart> list = cartDAO.getBookByUser(user.getId());
								Double totalPrice = 0.0;

								for (Cart cart : list) {
									totalPrice = cart.getTotalPrice();
								%>

								<tr>
									<%-- 	<th scope="row">1</th>  --%>
									<td><%=cart.getBookName()%></td>
									<td><%=cart.getAuthor()%></td>
									<td><%=cart.getPrice()%>$</td>

									<td><a
										href="removeBook?bid=<%=cart.getBookId()%>&&uid=<%=cart.getUserId()%>&&cid=<%=cart.getCartId()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>

								<%
								}
								%>

								<tr>
									<td><b>Total Price </b></td>
									<td></td>
									<td></td>
									<td><b><%=totalPrice%>$</b></td>
								</tr>

							</tbody>
						</table>

					</div>
				</div>
			</div>

			<div class="mt-2 col-md-5">

				<c:if test="${not empty orderFailMsg}">
					<div class="alert alert-warning" role="alert">${orderFailMsg}</div>
					<c:remove var="orderFailMsg" scope="session" />
				</c:if>

				<div class="card">
					<h3 class="mt-3 text-center">
						<strong>Your Details for Order</strong>
					</h3>
					<div class="card-body">

						<form action="order" method="post">
							<input type="hidden" value="${userobj.id}" name="userId">

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="validationDefault01">Name</label> <input
										type="text" name="userName" class="form-control"
										id="validationDefault01" placeholder="First name"
										value="<%=user.getName()%>" required readonly="readonly">
								</div>
								<div class="form-group col-md-6">
									<label for="validationDefault02">Email</label> <input
										type="email" name="email" class="form-control"
										id="validationDefault02" placeholder="Last name"
										value="<%=user.getEmail()%>" required readonly="readonly">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="validationDefault01">Phone Number</label> <input
										type="number" name="phoneNumber" class="form-control"
										id="validationDefault01" placeholder="First name"
										value="<%=user.getPhoneNumber()%>" required
										readonly="readonly">
								</div>
								<div class="form-group col-md-6">
									<label for="validationDefault02">Address</label> <input
										type="text" name="address" class="form-control"
										id="validationDefault02" placeholder="Last name"
										value="<%=user.getAddress()%>" required="required">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="validationDefault01">Landmark</label> <input
										type="text" name="landmark" class="form-control"
										id="validationDefault01" placeholder="First name" value="Mark"
										required>
								</div>
								<div class="form-group col-md-6">
									<label for="validationDefault02">City</label> <input
										type="text" name="city" class="form-control"
										id="validationDefault02" placeholder="Last name" value="Otto"
										required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="validationDefault01">State</label> <input
										type="text" name="state" class="form-control"
										id="validationDefault01" placeholder="First name" value="Mark"
										required>
								</div>
								<div class="form-group col-md-6">
									<label for="validationDefault02">Pin Code</label> <input
										type="text" name="pinCode" class="form-control"
										id="validationDefault02" placeholder="Last name" value="Otto"
										required>
								</div>
							</div>


							<div class="form-group">
								<label for="inputDefault02">Payment Mode</label> <select
									id="inputDefault02" name="paymentType" class="form-control">
									<option value="noSelect">--Select--</option>
									<option value="COD">Cash on Delivery</option>
								</select>
							</div>

							<div class="mt-4">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="ml-2 btn btn-success"><i
									class="fa-solid fa-bag-shopping"></i> Continue Shopping</a>
							</div>

						</form>

					</div>
				</div>
			</div>

		</div>

	</div>

</body>
</html>