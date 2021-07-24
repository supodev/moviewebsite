<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col ml-4">
<!-- thông báo  -->
	<jsp:include page="/common/inform.jsp"></jsp:include>
	<!-- thông báo  -->
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item" role="presentation"><a
			class="nav-link active" id="videoEditing-tab" data-toggle="tab"
			href="#videoEditing" role="tab" aria-controls="videoEditing"
			aria-selected="true">User Editing</a></li>
		<li class="nav-item" role="presentation"><a class="nav-link"
			id="videolist-tab" data-toggle="tab" href="#videolist" role="tab"
			aria-controls="videolist" aria-selected="false">User list</a></li>
	</ul>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="videoEditing"
			role="tabpanel" aria-labelledby="videoEditing-tab">
			<form action="" method="post">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col">
								<div class="form-group">
									<label for="username">Username</label> <input value="${user.username }" type="text"
										name="username" id="username" class="form-control"
										aria-describedby="usernameHid" placeholder="Username">
									<small id="usernameHid" class="form-text text-muted">Username
										is Required</small>
								</div>
								<div class="form-group">
									<label for="fullname">Fullname</label> <input value="${user.fullname }" type="text"
										name="fullname" id="fullname" class="form-control"
										aria-describedby="fullnameHid" placeholder="Fullname">
									<small id="fullnameHid" class="form-text text-muted">Fullname
										is Required</small>
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="password">Password</label> <input value="${user.password }" type="password"
										name="password" id="password" class="form-control"
										aria-describedby="passwordHid" placeholder="Password">
									<small id="passwordHid" class="form-text text-muted">Password
										is Required</small>
								</div>
								<div class="form-group">
									<label for="email">Email</label> <input value="${user.email }" type="text"
										name="email" id="email" class="form-control"
										aria-describedby="emailHid" placeholder="Email"> <small
										id="emailHid" class="form-text text-muted">Email is
										Required</small>
								</div>
							</div>
						</div>
					</div>
					<div class="card-footer text-muted">
						<button class="btn btn-primary" formaction="Admin/UsersManagement/create">Create</button>
						<button class="btn btn-warning" formaction="Admin/UsersManagement/update">Update</button>
						<button class="btn btn-danger" formaction="Admin/UsersManagement/delete">Delete</button>
						<button class="btn btn-info" formaction="Admin/UsersManagement/reset">Reset</button>
					</div>
				</div>
			</form>
		</div>
		<div class="tab-pane fade" id="videolist" role="tabpanel"
			aria-labelledby="videolist-tab">
			<table class="table table-stripe">
				<tr>
					<td>Username</td>
					<td>Fullname</td>
					<td>Email</td>
					<td>Role</td>
					<td>&nbsp;</td>
				</tr>
			<c:forEach var="item" items="${users }">
				<tr>
					<td>${item.username }</td>
					<td>${item.fullname }</td>
					<td>${item.email}</td>
					<td>${item.admin ? 'Admin' : 'User' }</td>
					<td><a href="Admin/UsersManagement/edit?username=${item.username }"><i class="fa fa-edit" aria-hidden="true"></i>
							Edit</a> <a href="Admin/UsersManagement/delete?username=${item.username }"><i class="fa fa-trash" aria-hidden="true"></i>
							Delete</a></td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>