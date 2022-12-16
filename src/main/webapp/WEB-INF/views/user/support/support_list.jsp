<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 내역</title>
<!-- 헤더 -->
<c:import url="/WEB-INF/views/include/header_user.jsp" />
</head>
<body>
	<div class="container" style="margin-top: 50px;">
		<table class="table" cellpadding="0" cellspacing="0">
			<thead>
				<tr>
					<th>번호</th>
					<th>내용</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>추천</th>
				</tr>
			</thead>
			<tbody>
				<!-- 1 -->
				<tr>
					<c:forEach var="supportList" items="${support}">
						<td><a style="cursor: pointer;"
							href="${root }support/info?supportNum=${supportList.supportNum}">${supportList.supportNum}</a></td>
						<td class="align_l title"><a style="cursor: pointer;"
							href="${root }support/info?supportNum=${supportList.supportNum}">
								${supportList.supportContent }<em class="photo"></em>
						</a></td>
						<td>${supportList.supportUserId }</td>
						<td>${supportList.supportData }</td>
						<!-- 						<td class="used_like6241824">0</td> -->
				</tr>
				<!-- 					<tr class="reviewDetailTr" id="reviewDetail_6241824" -->
				<!-- 						style="display: none;"> -->
				<!-- 					<td colspan="3" class="align_l con"> -->
				<!-- 						<div class="photo_img"> -->
				<!-- 							<span onclick="pusPhotoDetailLayer('6241824');" -->
				<!-- 								style="cursor: pointer;"><img -->
				<!-- 								src="//image2.compuzone.co.kr/img/postscript_order/ProductForUsed_4/896343/1624049_1.jpg"></span> -->
				<!-- 						</div> -->
				<!-- 					</td> -->
				<!-- 					<td> -->
				<!-- 						<button type="button" class="btn_hand" -->
				<!-- 							onclick="chk_like(6241824,'Y');"> -->
				<!-- 							<i class="ico_hand"></i> <span class="num"><span -->
				<!-- 								class="used_like6241824">0</span></span> -->
				<!-- 						</button> -->
				<!-- 					</td> -->
				<!-- 					</tr> -->
				</c:forEach>
			</tbody>
		</table>
		<div>
			<div id="support_search" class="input-group mb-3">
				<input type="text" class="form-control"
					aria-describedby="button-addon2"> <a
					href="${root }support/search?${param.supportContent}"> <input
					type="submit" class="btn btn-primary" value="검색"></a>

			</div>
			<a href="${root }support/write">
				<button type="button" class="btn btn-primary">글쓰기</button>
			</a>
		</div>
		<!-- 문의 게시판 끝-->
	</div>
	<!-- 푸터 -->
	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
</html>