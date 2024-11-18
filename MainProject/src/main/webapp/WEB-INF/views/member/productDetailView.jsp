<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content />
<meta name="author" content />
<title>마이 페이지</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Custom Google font-->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
	rel="stylesheet" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<style type="text/css">
	
	.main-height{
		height:900px;
		width:1300px;
		border: 1px solid black;
		margin: auto;
		margin-top:50px;
		margin-bottom: 50px;
	}
	
	.product-division{
		display: flex;

		margin-top: 70px;
	}
	
	.product-division > div{
		width:150px;
		height:50px;
		display:flex;
		justify-content:center;
		align-items:center;
		border: 1px solid black;
	}
	
	.product-division1{
		background-color: #009861;
		margin-left: 400px;
	}
	
	.product-division1-color{
		color:white;
	}
	
	.product-division2{
		background-color: #6AAAEC;
		color:white;
		margin-left: 30px;
	}
	
	.product-division3{
		background-color: #0D5CAB;
		color:white;
		margin-left: 30px;
		
	}
	
	
	
	.product-list{
		display: flex;
		justify-content:space-around;
		margin-top:100px;
		padding-left:50px;
		padding-right:50px;
	
	}
	
	.product-box{
		width:200px;
		height:200px;
		border: 1px solid black;
	
	}
	
	.product-img{
		display: flex;
		justify-content: center;
		align-items:center;
		height:70%;
	}
	 
	 
	 .product-name{
		display: flex;
		justify-content: center;
		align-items:center;
		height:20%;
	}


</style>

</head>
<body class="d-flex flex-column">

	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<div class="main-height">
		<div class="product-division">
			<div class="product-division1">
				<a class="product-division1-color" href="${pageContext.request.contextPath }/productView">제품</a>
			</div>
			<div class="product-division2">설비</div>
			<div class="product-division3">신재생 에너지</div>
		</div>
		<div class="product-list">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">에너지효율등급</th>
						<th scope="col">모델명</th>
						<th scope="col">업체명</th>
						<th scope="col">용량</th>
						<th scope="col">연간에너지비용</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${productCategory }" var="product">
						<tr>
							<td>${product.productGrade }</td>
							<td>
								<!-- 글제목 클릭시 /boardDatailView?no=글번호 형태로 요청  -->
								<a href = "${pageContext.request.contextPath}/productDetailInView?productName=${product.productName }">
									${product.productName }
								</a>
							</td>
							<td>${product.productBrand }</td>
							<td>${product.productVolume }</td>
							<td>${product.yearMoney }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	

	<%@ include file="/WEB-INF/inc/footer.jsp" %>

	<!-- Bootstrap core JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
</body>
</html>
