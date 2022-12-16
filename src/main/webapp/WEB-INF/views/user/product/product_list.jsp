<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 목록</title>
<c:import url="/WEB-INF/views/include/header_user.jsp" />
</head>
<body>
	${searchResult}
	<!-- 헤더 -->
	<table width="1200" border="0" align="center" cellpadding="0"
		cellspacing="0" style="border-bottom: 1px solid #efefef">
		<tbody>
			<c:forEach var="obj" items="${productList }">
				<tr>
					<td width="180" height="180" align="center" bgcolor="#ffffff"
						style="padding: 0px"><img id="product_info_img"
						src="/resources/image${obj.productDetail}" width="10%" /></td>
					<td height="120" bgcolor="#ffffff"
						style="padding: 10px 0 10px 10px">
						<table width="95%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td style="padding: 0 0 10px 0"><a
										href="${root }product/info?productIdx=${obj.productIdx}"><b
											class="tx16B" style="color: #3d3d3d">${obj.productName }</b></a></td>
								</tr>

								<tr>
									<td></td>
								</tr>
								<tr>
									<td style="padding: 0 0 10px 0"><a
										href="${root }product/info">${obj.productText }</a></td>
								</tr>
							</tbody>
						</table>
					</td>
					<td width="106" height="120" bgcolor="#ffffff"
						style="padding: 0 15px 0 0">
						<div align="right" class="pricetitle2">
							<span class="red_bold"> <span class="price1"
								price1="style1">${obj.productPrice}</span>원 <br> <br
								style="line-height: 10px"> <a href="#"><img
									src="/skin/shop/basic/images/bn/bkn_ad_point.gif"
									align="absmiddle"></a></span><span class="brown_1"> 90 </span>
						</div>
					</td>
					<td width="91" height="120" bgcolor="#ffffff"
						style="padding-top: 3px; padding-bottom: 3px; padding-left: 3px; padding-right: 3px">
						<%-- <a href="${root}cart/list">장바구니</a><br><a href="${root }order/form">구매하기</a> --%>
						<form action="${root}cart/list" align="center" method="post">
							<a href="${root}cart/list">장바구니2</a><br>
						</form>
						<form action="${root }order/info" align="center" method="post">
							<a href="${root }order/form?productType=${obj.productType}&productProperty=${obj.productProperty}&productIdx=${obj.productIdx}">구매하기2</a>
							<a href="${root }order/form?productIdx=${obj.productIdx}">구매하기3</a>
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<!— 푸터 —>
	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
</html>