<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Edit Book</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f1ffe8">
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="mt-3 card">
					<div class="card-body">
						<h4 class="text-center">Edit Books</h4>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOImpl bookDAO = new BookDAOImpl(DBConnect.getConn());
						BookDetails bookDtls = bookDAO.getBookById(id);
						%>

						<form action="../editbooks" method="post">

							<input type="hidden" name="id" value="<%=bookDtls.getBookId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1" class="form-label">Book
									Name*</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter book name" required="required"
									name="bookName" value="<%=bookDtls.getBookName()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1" class="form-label">Author
									Name*</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter author name" required="required"
									name="author" value="<%=bookDtls.getAuthor()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1" class="form-label">Price*</label>
								<input type="number" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter price" required="required" name="price"
									value="<%=bookDtls.getPrice()%>">
							</div>

							<div class="form-group">
								<label for="inpuState" class="form-label">Book
									Categories</label> <select id="inputState" name="bookType"
									class="form-control">
									<%
									if ("New Book".equals(bookDtls.getBookCategory())) {
									%>
									<option value="New">New Book</option>
									<%---------   new option   --------%>
									<option value="Old">Old Book</option>
									<%---------   new option   --------%>
									<%-- 									<option value="Recent">Recent Book</option>    --%>
									<%
									} else {
									%>
									<option value="Old">Old Book</option>
									<%---------   new option   --------%>
									<option value="New">New Book</option>
									<%---------   new option   --------%>
									<%-- 									<option value="Recent">Recent Book</option>      --%>
									<%
									}
									%>
								</select>
							</div>

							<div class="form-group">
								<label for="inpuState" class="form-label">Book Status</label> <select
									id="inputState" name="bookStatus" class="form-control">
									<%
									if ("Active".equals(bookDtls.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>

									<%
									}
									%>

								</select>
							</div>

							<%--							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo*</label> <input
									name="bookImg" type="file" class="form-control-file"
									id="exampleFormControlFile1" required="required">
							</div>
--%>
							<button type="submit" class="btn btn-primary">Update</button>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="margin-top: 120px;">
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>