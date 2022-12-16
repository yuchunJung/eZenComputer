<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>사용자</title>
<c:import url="/WEB-INF/views/include/head_setting.jsp" />
</head>
<body>
	<!-- 우측 상단 네비게이터 -->
	<div class="flex-container flex-end">
		<c:choose>
			<c:when
				test="${loginUserBean!=null and loginUserBean.userLogin == true }">
				<div class="flex-item">${loginUserBean.userName}님 어서오세요</div>
         &nbsp;&nbsp;
         <div class="flex-item ">
					<a href="${root }user/logout">로그아웃</a>
				</div>
				<!--          &nbsp;&nbsp; -->
				<!--          <div class="flex-item "> -->
				<%--                <a href="${root }user/myPage">마이페이지</a> --%>
				<!--             </div> -->
         &nbsp;&nbsp;
         <div class="flex-item ">
					<a href="${root }cart/list">장바구니</a>
				</div>
         &nbsp;&nbsp;
         <div class="flex-item ">
					<a href="${root }user/modify">정보수정</a>
				</div>
         &nbsp;&nbsp;
         <div class="flex-item ">
					<a href="${root }user/delete">회원탈퇴</a>
				</div>
				 &nbsp;&nbsp;
         <div class="flex-item ">
					<a href="${root }support/list">고객센터</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="flex-item ">
					<a href="${root }user/login">로그인</a>
				</div>
         &nbsp;&nbsp;
         <div class="flex-item ">
					<a href="${root }user/join">회원가입</a>
				</div>

			</c:otherwise>
		</c:choose>
	</div>
	<!-- 우측 상단 네비게이터 끝 -->
	<!-- 로고 -->
	<div class="container">
		<div class="flex-logo">
			<a href="${root }main"><img src="../resources/image/LOGO.png"
				width="60" , height="70" alt=""></a> <a id="logo"
				href="${root }main">eZen Computer</a>
		</div>
		<!-- 검색창 -->
		<div class="flex-item">
			<form action="." method="post">
				<!-- search box -->
				<div class="search">
					<form action="${root }product/search?productName=${searchResult}"
						method="get">
						<input class="search_input" type="text" name="" id=""
							placeholder="검색어 입력...">&nbsp;&nbsp;
						<!-- 
                  <button type="submit">
                     <span class="fa fa-search"></span>
                  </button>
                   -->
						<a href="${root }product/search?productName=${searchResult}">
							<span class="fa fa-search"></span>
						</a>
					</form>
				</div>
				<!-- / search box -->
			</form>
		</div>
		<!-- 검색창 끝-->
	</div>
	<!-- 로고 끝-->
	<!-- 네비게이션 바 -->
	<ul class="nav nav-justified bg-light border-bottom border-top"
		style="padding: 0 13%;">
		<!-- 버튼1-->
		<li id="side_nav_menu" class="nav-item"><a
			class="nav-link dropdown-toggle" href="#" id="side_nav_menu"
			role="button" data-bs-toggle="dropdown" aria-expanded="false">
				CPU </a>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				<li><h6 class="dropdown-header">CPU</h6></li>
				<li><button class="dropdown-item"
						onclick="location.href='${root }product/list?productType=cpu&productProperty=intel'">INTEL</button></li>
				<li><button class="dropdown-item"
						onclick="location.href='${root }product/list?productType=cpu&productProperty=amd'">AMD</button></li>
			</ul></li>
		<li id="side_nav_menu" class="nav-item"><a
			class="nav-link dropdown-toggle" href="#" id="side_nav_menu"
			role="button" data-bs-toggle="dropdown" aria-expanded="false">
				메인보드 </a>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				<li><h6 class="dropdown-header">INTEL</h6></li>
				<li><button class="dropdown-item"
						onclick="location.href='${root }product/list?productType=mainboard&productProperty=intel'">LGA
						( 1700, 1200 )</button></li>
				<li><h6 class="dropdown-header">AMD</h6></li>
				<li><button class="dropdown-item"
						onclick="location.href='${root }product/list?productType=mainboard&productProperty=amd'">Ryzen
						( AM5, AM4 )</button></li>
			</ul></li>
		<li id="side_nav_menu" class="nav-item"><a
			class="nav-link dropdown-toggle" href="#" id="side_nav_menu"
			role="button" data-bs-toggle="dropdown" aria-expanded="false">
				메모리 </a>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				<li><h6 class="dropdown-header">RAM</h6></li>
				<li><button class="dropdown-item"
						onclick="location.href='${root }product/list?productType=ram&productProperty=ddr5'">DDR5</button></li>
				<li><button class="dropdown-item"
						onclick="location.href='${root }product/list?productType=ram&productProperty=ddr4'">DDR4</button></li>
			</ul></li>
		<li id="side_nav_menu" class="nav-item"><a
			class="nav-link dropdown-toggle" href="#" id="side_nav_menu"
			role="button" data-bs-toggle="dropdown" aria-expanded="false">
				그래픽카드 </a>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				<li><h6 class="dropdown-header">NVIDIA</h6></li>
				<li><button class="dropdown-item"
						onclick="location.href='${root }product/list?productType=vga&productProperty=nvidia'">RTX
						Series</button></li>
				<li><h6 class="dropdown-header">AMD</h6></li>
				<li><button class="dropdown-item"
						onclick="location.href='${root }product/list?productType=vga&productProperty=amd'">RX
						Series</button></li>
			</ul></li>
		<li id="side_nav_menu" class="nav-item"><a
			class="nav-link dropdown-toggle" href="#" id="side_nav_menu"
			role="button" data-bs-toggle="dropdown" aria-expanded="false">
				SSD </a>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				<li><h6 class="dropdown-header">2.5형 SSD</h6></li>
				<li><button class="dropdown-item"
						onclick="location.href='${root }product/list?productType=ssd&productProperty=2.5'">2.5형
						SSD</button></li>
				<li><h6 class="dropdown-header">M.2</h6></li>
				<li><button class="dropdown-item"
						onclick="location.href='${root }product/list?productType=ssd&productProperty=NVMe'">NVMe</button></li>
				<li><button class="dropdown-item"
						onclick="location.href='${root }product/list?productType=ssd&productProperty=SATA'">SATA</button></li>
			</ul></li>
		<li id="side_nav_menu" class="nav-item"><a
			class="nav-link dropdown-toggle" href="#" id="side_nav_menu"
			role="button" data-bs-toggle="dropdown" aria-expanded="false">
				HDD </a>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				<li><h6 class="dropdown-header">PC용 HDD</h6></li>
				<li><button class="dropdown-item"
						onclick="location.href='${root }product/list?productType=d-hdd&productProperty=over2TB'">2TB이상</button></li>
				<li><button class="dropdown-item"
						onclick="location.href='${root }product/list?productType=d-hdd&productProperty=under2TB'">2TB미만</button></li>
				<li><h6 class="dropdown-header">노트북용 HDD</h6></li>
				<li><button class="dropdown-item"
						onclick="location.href='${root }product/list?productType=n-hdd&productProperty=over2TB'">2TB이상</button></li>
				<li><button class="dropdown-item"
						onclick="location.href='${root }product/list?productType=n-hdd&productProperty=under2TB'">2TB미만</button></li>
			</ul></li>
		<li id="side_nav_menu" class="nav-item"><a
			class="nav-link dropdown-toggle" href="#" id="side_nav_menu"
			role="button" data-bs-toggle="dropdown" aria-expanded="false"> 파워
		</a>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				<li><h6 class="dropdown-header">ATX (메인보드 큰 사이즈 )</h6></li>
				<li><button class="dropdown-item"
						onclick="location.href='${root }product/list?productType=ATX&productProperty=over750W'">750W이상</button></li>
				<li><button class="dropdown-item"
						onclick="location.href='${root }product/list?productType=ATX&productProperty=under750W'">750W미만</button></li>
				<li><h6 class="dropdown-header">M-ATX (메인보드 보통 사이즈 )</h6></li>
				<li><button class="dropdown-item"
						onclick="location.href='${root }product/list?productType=M-ATX&productProperty=over750W'">750W이상</button></li>
				<li><button class="dropdown-item"
						onclick="location.href='${root }product/list?productType=M-ATX&productProperty=under750W'">750W미만</button></li>
			</ul></li>
		<li id="side_nav_menu" class="nav-item"><a
			class="nav-link dropdown-toggle" href="#" id="side_nav_menu"
			role="button" data-bs-toggle="dropdown" aria-expanded="false"> 쿨러
		</a>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				<li><h6 class="dropdown-header">공냉식</h6></li>
				<li><button class="dropdown-item"
						onclick="location.href='${root }product/list?productType=cooler&productProperty=air'">공냉식
						쿨러</button></li>
				<li><h6 class="dropdown-header">수냉식</h6></li>
				<li><button class="dropdown-item"
						onclick="location.href='${root }product/list?productType=cooler&productProperty=water'">수냉식
						쿨러</button></li>
			</ul></li>
		<li id="side_nav_menu" class="nav-item"><a
			class="nav-link dropdown-toggle" href="#" id="side_nav_menu"
			role="button" data-bs-toggle="dropdown" aria-expanded="false">
				케이스 </a>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				<li><h6 class="dropdown-header">데스크탑 케이스</h6></li>
				<li><button class="dropdown-item"
						onclick="location.href='${root }product/list?productType=case&productProperty=big'">빅타워</button></li>
				<li><button class="dropdown-item"
						onclick="location.href='${root }product/list?productType=case&productProperty=middle'">미들타워</button></li>
				<li><button class="dropdown-item"
						onclick="location.href='${root }product/list?productType=case&productProperty=slim'">슬림</button></li>
			</ul></li>
	</ul>
	<!-- 네비게이션 바 끝-->
	<div class="bg-primary" style="height: 7px;"></div>
	<!-- 메인 컨테이너 끝 -->
</body>
</html>