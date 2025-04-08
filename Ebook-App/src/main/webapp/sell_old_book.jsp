<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Old Book</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f1ffe8">
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>

	<div class="container p-2">
		<div class="row">
			<div class="mt-5 col-md-4 offset-md-4">

				<div class="card">

					<div class="card-body">
						<h4 class="text-center mb-3">Sell Old Book Page</h4>

						<c:if test="${not empty succMsg}">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failMsg}">
							<p class="text-center text-danger">${failMsg}</p>
							<c:remove var="failMsg" scope="session" />
						</c:if>


						<form action="sell_old_book" method="post"
							enctype="multipart/form-data">

							<input type="hidden" value="${userobj.email}" name="userEmail">

							<div class="form-group">
								<label for="exampleInputEmail1" class="form-label">Book
									Name*</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter book name" required="required"
									name="bookName">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1" class="form-label">Author
									Name*</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter author name" required="required"
									name="author">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1" class="form-label">Price*</label>
								<input type="number" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter price" required="required" name="price">
							</div>

							<%--
 							<div class="form-group">
								<label for="inpuState" class="form-label">Book
									Categories</label> <select id="inputState" name="bookType"
									class="form-control">
									<option selected="selected">--select--</option>
									<option value="New">New Book</option>
									<option value="Old">Old Book</option>
								</select>
							</div>
--%>

							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo*</label> <input
									name="bookImg" type="file" class="form-control-file"
									id="exampleFormControlFile1" required="required">
							</div>

							<button type="submit" class="btn btn-primary">Sell Book</button>

						</form>

					</div>

				</div>

			</div>

		</div>
	</div>

</body>
</html>