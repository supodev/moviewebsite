<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col-9">
<jsp:include page="/common/inform.jsp"></jsp:include>
	<div class="row p-2">
		<c:forEach var="item" items="${videos }">
			<div class="col-3 mt-2">
				<div class="card text-center">
					<div class="card-body">
						<img src="${empty item.poster ? 'images/desktop.png' : item.poster}" width="90%"  alt="" class="img-fluid">
						<div class="row border-top mt-2">
							<a href="VideoDetail?videoId=${item.videoId}" class="card-body-title"><b>${item.title }</b></a>
						</div>
					</div>
					<div class="card-footer">
						<a href="LikeVideo?videoId=${item.videoId }" class="btn btn-primary">like</a> <a href="ShareVideo?videoId=${item.videoId }"
							class="btn btn-success">share</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="row">
		<div class="col">
			<nav aria-label="Page navigation">
				<ul class="pagination justify-content-center">
					<li class="page-item disabled"><a href="#" class="page-link"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
					</a></li>
					<li class="page-item active"><a href="#" class="page-link">1</a></li>
					<li class="page-item"><a href="#" class="page-link">2</a></li>
					<li class="page-item"><a href="#" class="page-link"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
							class="sr-only">Next</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>
<div class="col-3">
	<div class="row mt-3 mb3">
		<div class="col">
			<div class="card">
				<div class="card-header">
					<i class="fa fa-thumbs-up" aria-hidden="true"></i>Favorites
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">HOẠT HÌNH</li>
					<li class="list-group-item">BOOM TẤN</li>
					<li class="list-group-item">HÀNH ĐỘNG</li>
					<li class="list-group-item">VIỄN TƯỞNG</li>
					<li class="list-group-item">HÀI KỊCH</li>
					<li class="list-group-item">KINH DỊ</li>
					<li class="list-group-item">TÌNH CẢM</li>
				</ul>
			</div>
		</div>
	</div>
</div>