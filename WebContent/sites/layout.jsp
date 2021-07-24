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
<base href="/PolyOE.Asg/" />
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>${page.title }</title>
</head>

<body>
	<main class="container"> <header class="row pt-5 pb-2">
		<div class="col-9">
			<h1>Online Entertainment</h1>
		</div>
		<div class="col-3 text-right">
			<a href="Homepage"><img src="images/poly.png" alt="" class="mr-4"></a>
		</div>
	</header>
	<nav class="row">
		<nav class="col navbar navbar-expand-sm navbar-light bg-light">
			<a class="navbar-brand" href="Homepage">OnEn</a>
			<button class="navbar-toggler d-lq-none" type="button"
				data-toggle="collapse" data-target="#navbarNavAltMarkup"
				aria-controls="navbarNavAltMarkup" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link" href="Homepage"><i
							class="fa fa-home" aria-hidden="true"></i>Home <span
							class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link" href="Homepage"><i
							class="fa fa-info" aria-hidden="true"></i>About Us</a></li>
					<li class="nav-item"><a class="nav-link" href="Homepage"><i
							class="fa fa-id-card" aria-hidden="true"></i>Contact Us</a></li>
					<li class="nav-item"><a class="nav-link" href="Homepage"><i
							class="fa fa-comments" aria-hidden="true"></i>My Favortives</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="fa fa-user"
							aria-hidden="true"></i> My Account
					</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<c:if test="${!isLogin }">
								<a class="dropdown-item" href="Login">Login</a>
								<a class="dropdown-item" href="ForgotPassword">Forgot Password</a>
								<a class="dropdown-item" href="Registration">Registration</a>
							</c:if>
							<c:if test="${isLogin }">
								<a class="dropdown-item" href="Logoff">LogOff</a>
								<a class="dropdown-item" href="ChangePassword">Change Password</a>
								<a class="dropdown-item" href="EditProfile">Edit Profile</a>	
							</c:if>
						</div></li>
				</ul>
			</div>
		</nav>
	</nav>
	<section class="row">
		<jsp:include page="${page.contentUrl }"></jsp:include>
	</section>
	<footer class="row">
		<div class="col text-center border-top">
			<strong>FPT Poly &copy;2020. All rights reserved.</strong>
		</div>
	</footer> </main>

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
</body>

</html>