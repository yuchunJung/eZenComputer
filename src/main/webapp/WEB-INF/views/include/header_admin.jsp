<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!-- 상단 메뉴 부분 -->
<!-- favicon -->
<link rel="icon" href="../resources/image/favicon_32x32.png">
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<nav
	class="navbar navbar-expand-md bg-dark navbar-dark fixed-top shadow-lg">
	<a class="navbar-brand" href="${root }admin/main">eZen Computer </a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navMenu">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navMenu">
		<ul class="navbar-nav">
			<c:forEach var='obj' items='${topMenuList}'>
				<li class="nav-item"><a href="${root }admin/${obj.boardInfoId}"
					class="nav-link">${obj.boardInfoName }</a></li>
			</c:forEach>
		</ul>
		<ul class="navbar-nav ml-auto">
			<c:choose>
				<c:when test="${loginAdminBean.adminLogin == true }">
					<li class="nav-item"><a href="${root }admin/logout"
						class="nav-link">로그아웃</a></li>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><a href="${root }admin/login"
						class="nav-link">로그인</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</nav>

