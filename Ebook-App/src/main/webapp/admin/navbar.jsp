<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<div class="container-fluid p-2"
	style="height: 10px; background-color: #a5d6a7"></div>

<div class="container-fluid p-4 bg-light">

	<div class="row">
		<div class="col-md-10 text-muted">
			<h3>
				<%-- <i class="fa-solid fa-book"></i> --%>
				<img width="80" height="80"
					src="https://img.icons8.com/carbon-copy/100/books.png" alt="books" />Ebook
			</h3>
		</div>
		<div class="col-md-2">

			<c:if test="${not empty userobj}">
				<a class="btn btn-success text-white"><i
					class="fa-solid fa-user-large"></i> ${userobj.name}</a>

				<a class="btn btn-primary" data-toggle="modal"
					data-target="#exampleModalCenter" class="btn btn-primary"><i
					class="fa-solid fa-right-from-bracket text-white text-lowercase"></i> </a>
			</c:if>

			<c:if test="${empty userobj}">
				<a href="../login.jsp" class="btn btn-success"><i
					class="fa-solid fa-arrow-right-to-bracket"></i> Login</a>
				<a href="../register.jsp" class="btn btn-primary"><i
					class="fa-solid fa-user-plus"></i> Register</a>

			</c:if>
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



<nav class="navbar navbar-expand-lg navbar-dark bg-custom" class="row">
	<div class="container-fluid">
		<%--		<a class="navbar-brand" href="#"><i class="fa-solid fa-house-chimney"></i> Home</a>     --%>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<div class="col-md-8">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="home.jsp"><i
							class="fa-solid fa-house-chimney"></i> Home</a></li>
				</ul>
			</div>

			<div class="col-md-4">
				<div class="row">
					<div class="col-md-6"></div>

					<div class="col-md-6">
						<form class="d-flex" action="admin_search_book.jsp" method="get">
							<input class="form-control me-2" type="search" name="searchSomething"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-secondary" type="submit">Search</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</nav>