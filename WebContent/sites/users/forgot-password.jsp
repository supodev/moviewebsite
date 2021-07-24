<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="offset-4 col-4">
	<form action="ForgotPassword" method="post">
		<div class="card mt-3 mb-3">
			<div class="card-header">
				<b>Forgot Password</b>
			</div>
			<div class="card-body">
			<jsp:include page="/common/inform.jsp"></jsp:include>
				<div class="row">
					<div class="col">
						<div class="form-group">
							<label for="">Username</label> <input type="text" name="username"
								id="username" class="form-control"
								aria-describedby="usernameHid" placeholder="Username"> <small
								id="usernameHid" class="form-text text-muted">Forgot
								Password is Required</small>
						</div>
						<div class="form-group">
							<label for="email">Email</label> <input type="email" name="email"
								id="email" class="form-control" placeholder="Email" required>
						</div>
					</div>
				</div>
			</div>

			<div class="card-footer text-muted">
				<button class="btn btn-success">Retrieve</button>
			</div>
		</div>
	</form>
</div>