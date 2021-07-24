<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="offset-3 col-6 mt-4">
	<form action="ChangePassword" method="post">
		<div class="card">
			<div class="card-header">
				<b>Change Password</b>
			</div>
			<div class="card-body">
				<jsp:include page="/common/inform.jsp"></jsp:include>
				<div class="row">
					<div class="col">
						<div class="form-group">
							<label for="username">Username</label> <input value="${username }" type="text"
								name="username" id="username" class="form-control"
								aria-describedby="usernameHid" placeholder="Username"> <small
								id="usernameHid" class="form-text text-muted">Username
								is required</small>
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								name="password" id="password" class="form-control"
								aria-describedby="passwordHid" placeholder="Password">
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="currentPassword">Current Password</label> <input
								type="password" name="currentPassword" id="currentPassword"
								class="form-control" aria-describedby="currentPasswordHid"
								placeholder="Current Password">
						</div>
						<div class="form-group">
							<label for="confirmPassword">Confirm Password</label> <input
								type="password" name="confirmPassword" id="confirmPassword"
								class="form-control" aria-describedby="confirmPasswordHid"
								placeholder="Confirm Password">
						</div>
					</div>
				</div>
			</div>
			<div class="card-footer text-muted">
				<button class="btn btn-success">Change Password</button>
			</div>
		</div>
	</form>
</div>