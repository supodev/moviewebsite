<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<base href="/PolyOE.Asg/">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<title>${page.title }</title>
</head>

<body>
	<main class="container-fluid">
	<nav class="row">
		<nav class="navbar navbar-expand-lg navbar-light bg-light col">
			<a class="navbar-brand" href="Homepage">Administration</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="Homepage">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="Admin/VideoManagement"><i
							class="fa fa-info" aria-hidden="true"></i> Videos</a></li>
					<div class="nav-item">
						<a href="Admin/UsersManagement" class="nav-link"><i class="fa fa-id-card"
							aria-hidden="true"></i>Users</a>
					</div>
					<div class="nav-item">
						<a href="Admin/ReportsManagement" class="nav-link"><i class="fa fa-comments"
							aria-hidden="true"></i>Reports</a>
					</div>
				</ul>
			</div>
		</nav>
	</nav>
	<section class="row">
		<jsp:include page="${page.contentUrl }"></jsp:include>
	</section>
	<footer class="row"></footer> </main>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
	<c:if test="${not empty page.scripUrl }">
		<jsp:include page="${page.scripUrl }"></jsp:include>
	</c:if>
	<script>
		$('#myTab a').on('click', function(event) {
			event.preventDefault()
			$(this).tab('show')
		})
	</script>
</body>

</html>