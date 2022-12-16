<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value='${pageContext.request.contextPath}/' />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>제품 등록</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<c:import url="/WEB-INF/views/include/header_admin.jsp" />
</head>
<body>
	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<form action='${root }admin/product/product_pro' method='get'
							enctype="multipart/form-data">

							<div class="form-group">
								<label for="product_name">제품명</label> <input type="text"
									id="product_name" name="productName" class="form-control" />
							</div>
							<div class="form-group">
								<label for="product_type">종류</label> <select name="productType"
									id="product_type">
									<option value="cpu">프로세서(cpu)</option>
									<option value="mainboard">메인보드</option>
									<option value="ram">메모리</option>
									<option value="vga">그래픽 카드</option>
									<option value="ssd">SSD</option>
									<option value="d-hdd">하드디스크(데스크탑)</option>
									<option value="n-hdd">하드디스크(노트북)</option>
									<option value="ATX">파워(ATX)</option>
									<option value="M-ATX">파워(M-ATX)</option>
									<option value="cooler">쿨러(Cooler)</option>
								</select>
							</div>
							<div class="form-group">
								<label for="product_property">계열</label> <select
									name="productProperty" id="product_property">
									<option value="intel">intel(cpu,메인보드)</option>
									<option value="amd">amd(cpu,메인보드)</option>
									<option value="ddr5">DDR5(ram)</option>
									<option value="ddr4">DDR4(ram)</option>
									<option value="nvidia">nvidia(vga)</option>
									<option value="amd">amd(vga)</option>
									<option value="2.5">2.5(SSD)</option>
									<option value="NVMe">NVMe(SSD)</option>
									<option value="SATA">SATA(SSD)</option>
									<option value="over2TB">2TB이상(HDD)</option>
									<option value="under2TB">2TB미만(HDD)</option>
									<option value="over750W">750W이상(Power)</option>
									<option value="under750W">750W미만(Power)</option>
									<option value="air">공냉식(Cooler)</option>
									<option value="water">수냉식(Cooler)</option>
									<option value="big">빅타워(케이스)</option>
									<option value="middle">미들타워(케이스)</option>
									<option value="slim">슬림(케이스)</option>
								</select>
							</div>
							<div class="form-group">
								<label for="product_price">수량</label> <input type="number"
									id="product_quantity" name="productQuantity"
									class="form-control" />
							</div>
							<div class="form-group">
								<label for="product_price">가격</label> <input type="text"
									id="product_price" name="productPrice" class="form-control" />
							</div>
							<div class="form-group">
								<label for="product_text">설명</label>
								<textarea id="product_text" name="productText"
									class="form-control" rows="10" style="resize: none"></textarea>
							</div>
							<div class="form-group">
								<label path="upload_file">첨부 이미지</label> <input type='file'
									path='upload_file' class="form-control" accept="image/*" />
							</div>
							<div class="form-group">
								<div class="text-right">
									<input class='btn btn-primary' type="submit"
										onclick="location.href='${root }admin/product/product_pro"></input>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
