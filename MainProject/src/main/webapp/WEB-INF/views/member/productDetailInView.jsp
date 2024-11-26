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
<title>제품 상세보기</title>
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
		color:white;
		margin-left: 400px;
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
		padding-left:150px;
		padding-right:50px;
		width:1000px;
		padding-top:55px;
		padding-bottom:50px;
	 
	}
	
	.product-box{
		width:200px;
		height:200px;
	
	}
	
	.product-img{
		display: flex;
		justify-content: center; 
	}
	 
	
	.context-box{
		display: flex;
		padding-left:50px;
		margin-top:50px;
		box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	}
	
	.product-img{
		width:400px;
		height:500px;
		overflow: hidden;
	}
	
	.product-detail{
		margin-bottom: 20px;
		font-weight: bold;
		font-size: 20px;  
	}  
	
	.product-division1-color{
		color:white;
	}
	
	.image{
		width:100%;
		height:100%;
	}
	
	.go-link{
		color:blue;
		font-size:4px;
	}
	
	.go-link:hover{
		cursor: pointer;
	}
	
	.text-copy{
		width:30px;
		height:20px;
	}
	
	.text-copy:hover{ 
		cursor: pointer;
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
		<div class="context-box">
			<div class="product-img">
				<img class="image" src="${getProduct.productImage }">
			</div>
			
			<div class="product-list">
				<div class="product-detail">제품상세정보</div>
				<table class="table table-hover">
					<colgroup>
						<col width="20%">
						<col width="20%">
						<col width="30%">
						<col width="20%">        
					</colgroup>
					<tbody>
						<tr>
							<th>카테고리</th>
							<td>${getProduct.productCategory }</td>
							<th>업체명</th>
							<td>${getProduct.productBrand }</td>
						</tr>
						<tr>
							<th>모델명</th>
							<td>${getProduct.productName }</td>
							<th>국산/수입</th>
							<td>${getProduct.productOrigin }</td>
						</tr>
						<tr>
							<th>용량</th>
							<td>${getProduct.productVolume }</td>
							<th>연간소비전력량</th>
							<td>${getProduct.yearUse }</td>
						</tr>
						<tr>
							<th>월간소비전력량(kWh/월)</th>
							<td>${getProduct.monthUse }</td>
							<th>1시간 전력량</th>
							<td>${getProduct.hourUse }</td>
						</tr>
						<tr>
							<th>1회 소비전력량</th>
							<td>${getProduct.oneUse }</td>
							<th>연간에너지비용(원)</th>
							<td>${getProduct.yearMoney }</td>
						</tr>
						<tr>
							<th>효율등급</th>
							<td>${getProduct.productGrade }</td>
							<th>구매 링크</th>
							<td class="go-link" onclick="goLink('${getProduct.productLink }')">${getProduct.productLink }</td>
						</tr>
					</tbody>
				</table>
				<div>
					구매 링크 복사
					<img  onclick="confirmAndCopy('${getProduct.productLink}')"  class="text-copy" src="${pageContext.request.contextPath }/resources/image/텍스트 아이콘.png">
				</div>
			</div>
		</div>
		
	</div>
	

	<%@ include file="/WEB-INF/inc/footer.jsp" %>

	<!-- Bootstrap core JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script type="text/javascript">
		function goLink(link){
			window.open(link)
		}
		
		function confirmAndCopy(productLink) {
		    // 확인 창을 띄워서 사용자가 모델명 복사를 확인하도록 함
		    let confirmation = confirm("구매 링크를 복사하시겠습니까?");
		    
		    // 사용자가 확인 버튼을 누른 경우
		    if (confirmation) {
		        copyText(productLink);
		    }
		}
	
		function copyText(text) {
		    // Clipboard API를 사용해 텍스트를 클립보드에 복사
		    navigator.clipboard.writeText(text).then(function() {
		        // 복사 성공 시 실행되는 콜백
		        alert("복사된 링크: " + text);
		    }).catch(function(err) {
		        // 복사 실패 시 실행되는 콜백
		        alert("복사 실패: " + err);
		    });
	
		}
	</script>
    
</body>
</html>
