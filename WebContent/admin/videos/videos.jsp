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
			aria-selected="true">Video Editing</a></li>
		<li class="nav-item" role="presentation"><a class="nav-link"
			id="videolist-tab" data-toggle="tab" href="#videolist" role="tab"
			aria-controls="videolist" aria-selected="false">Video list</a></li>
	</ul>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="videoEditing"
			role="tabpanel" aria-labelledby="videoEditing-tab">
			<form action="" method="post" enctype="multipart/form-data">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-3">
								<div class="border p-3">
									<img src="${video.poster != null ? video.poster : 'images/desktop.png' }" name="anh" alt="" class="img-fluid">
									<div class="input-group mb-3 mt-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Upload</span>
										</div>
										<div class="custom-file">
											<input type="file" class="custom-file-input" id="cover" aria-describedby="inputGroupFileAddon01" name="cover">
    										<label class="custom-file-label" for="cover">Choose file</label>
										</div>
									</div>
								</div>
							</div>
							<div class="col-9">
								<div class="form-group">
									<label for="youtubeId">Youtube ID</label> <input value="${video.videoId }" type="text"
										name="videoId" id="youtubeId" class="form-control"
										aria-describedby="youtubeIdHid" placeholder="YoutubeId">
									<small id="youtubeIdHid" class="form-text text-muted">Youtube
										Id is Required</small>
								</div>
								<div class="form-group">
									<label for="videoTitle">Video Title</label> <input value="${video.title }" type="text"
										name="title" id="videoTitle" class="form-control"
										aria-describedby="videoTitle" placeholder="VideoTitle">
									<small id="videoTitle" class="form-text text-muted">Video
										Title is Required</small>
								</div>
								<div class="form-group">
									<label for="videoCode">Video YTB</label> <input value="${video.code }" type="text"
										name="code" id="videoCode" class="form-control"
										aria-describedby="videoCode" placeholder="VideoCode">
									<small id="videoCode" class="form-text text-muted">Video
										Youtube is Required</small>
								</div>
								<div class="form-group">
									<label for="viewCount">View Count</label> <input value="${video.views }" type="text"
										name="views" id="viewCount" class="form-control"
										aria-describedby="viewCountHid" placeholder="viewCount">
									<small id="viewCountHid" class="form-text text-muted">View
										count is Required</small>
								</div>
								<div class="form-check form-check-inline">
									<label class="mr-2"> <input type="radio" class="form-check-input"
										name="active" id="status" value="true" ${video.active? 'checked':''}>Active
									</label> <label> <input type="radio" class="form-check-input"  
										name="active" id="status" value="false" ${!video.active? 'checked':''} >Inactive
									</label>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<label for="description">Description</label>
								<textarea name="description" id="description" cols="30" rows="4"
									class="form-control">${video.description }</textarea>
							</div>
						</div>
					</div>
					<div class="card-footer text-muted">
						<button class="btn btn-primary"
							formaction="Admin/VideoManagement/create">Create</button>
						<button class="btn btn-warning"
							formaction="Admin/VideoManagement/update">Update</button>
						<button class="btn btn-danger" formaction="Admin/VideoManagement/delete">Delete</button>
						<button class="btn btn-info" formaction="Admin/VideoManagement/reset">Reset</button>
					</div>
				</div>
			</form>
		</div>
		<div class="tab-pane fade" id="videolist" role="tabpanel"
			aria-labelledby="videolist-tab">
			<table class="table table-stripe">
				<tr>
					<td>Youtube Id</td>
					<td>Video Title</td>
					<td>Video YTB</td>
					<td>View Count</td>
					<td>Status</td>
					<td>&nbsp;</td>
				</tr>
				<c:forEach var="item" items="${videos }">
				<tr>
					<td>${item.videoId }</td>
					<td>${item.title }</td>
					<td>${item.code }</td>
					<td>${item.views }</td>
					<td>${item.active ? 'Active' : 'Deactive' }</td>
					<td><a href="Admin/VideoManagement/edit?videoId=${item.videoId }"><i class="fa fa-edit" aria-hidden="true"></i>
							Edit</a> <a href="Admin/VideoManagement/delete?videoId=${item.videoId }"><i class="fa fa-trash" aria-hidden="true"></i>
							Delete</a></td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>