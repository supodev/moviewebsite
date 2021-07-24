<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col">
	<div class="row mt-3">
		<div class="col-6">
			<div class="detail__video">
				<form method="post" class="detail__video-card">
					<input type="hidden" name="id" value="${video.videoId}">
					<div class="card__header">
						<iframe width="560" height="315" src="${video.code}"
							frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>
					<div class="card__body">
						<div class="card__body-title">
							<h2>${video.title}</h2>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="col-6">
			<div class="card__body">
				<div class="card__body-description">
					<h5 style="color: blue;">Nội Dung</h5>
					<p style="font-size: 13pt">${video.description}</p>
				</div>
			</div>
		</div>
	</div>
	<div class="card-footer text-right">
						<a href="LikeVideo?videoId=${video.videoId}"
							class="btn btn-success">Like</a> <a
							href="ShareVideo?videoId=${video.videoId }" class="btn btn-info">share</a>
					</div>
</div>