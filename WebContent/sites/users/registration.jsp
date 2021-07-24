<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col-8 offset-2">
	<form action="" method="post">
		<div class="card mt-3 mb-3">
			<div class="card-header">
				<b>Registration</b>
			</div>
			<div class="card-body">
				<jsp:include page="/common/inform.jsp"></jsp:include>
				<div class="row">
					<div class="col">
						<div class="form-group">
							<label for="username">Username</label> <input type="text"
								name="username" id="username" value="${user.username }"
								class="form-control" aria-describedby="usernameHid"
								placeholder="Username"> <small id="usernameHid"
								class="form-text text-muted">Username is required</small>
						</div>
						<div class="form-group">
							<label for="fullname">Fullname</label> <input
								value="${user.fullname }" type="text" name="fullname"
								id="fullname" class="form-control"
								aria-describedby="fullnameHid" placeholder="Fullname"> <small
								id="fullnameHid" class="form-text text-muted">Fullname
								is required</small>
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								name="password" id="password" class="form-control"
								aria-describedby="passwordHid" placeholder="Password">
						</div>
						<div class="form-group">
							<label for="email">Email</label> <input value="${user.email }"
								type="text" name="email" id="email" class="form-control"
								aria-describedby="emailHid" placeholder="Email"> <small
								id="emailHid" class="form-text text-muted">Email is
								required</small>
						</div>
					</div>
				</div>
			</div>
			<div class="card-footer text-muted">
				<button class="btn btn-success">Sign Up</button>
			</div>
		</div>
	</form>
</div>