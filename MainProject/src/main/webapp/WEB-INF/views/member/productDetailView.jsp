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
<title>제품별 정보 보기</title>
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
	
	.main-height {
	    width: 90%;
	    max-width: 1300px;
	    margin: auto;
	    margin-top: 50px;
	    margin-bottom: 50px;
	    padding: 20px;
	    background-color: #ffffff;
	    border-radius: 10px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	}
	
	.product-division {
	    display: flex;
	    justify-content: center;
	    margin-top: 30px;
	}
	
	.product-division > div {
	    width: 150px;
	    height: 50px;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    border-radius: 5px;
	    color: white;
	    font-weight: bold;
	    cursor: pointer;
	    transition: all 0.3s ease;
	}
	
	.product-division1 {
	    background-color: #009861;
	   
	}
	
	.product-division1-color{
		color:white;
		 text-decoration: none;
	}
	
	.product-division2 {
	    background-color: #6AAAEC;
	    margin-left: 20px;
	}
	
	.product-division3 {
	    background-color: #0D5CAB;
	    margin-left: 20px;
	}
	
	.product-division > div:hover {
	    transform: scale(1.05);
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	}
	
	.product-list {
	    display: flex;
	    justify-content: space-around;
	    flex-wrap: wrap;
	    margin-top: 50px;
	    gap: 20px;
	}
	
	.product-box {
	    width: calc(33% - 20px); /* 3 items per row */
	    background-color: #ffffff;
	    border-radius: 10px;
	    overflow: hidden;
	    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	    transition: transform 0.3s ease;
	}
	
	.product-img-box {
	    width: 100%;
	    height: 350px;
	    overflow: hidden;
	    border-bottom: 2px solid #f1f1f1;
	}
	
	.product-img-box:hover{
		cursor: pointer;
	}
	
	
	.product-img-box img {
	    width: 100%;
	    height: 100%;
	    transition: transform 0.3s ease;
	}
	
	.product-img-box:hover img {
	    transform: scale(1.1);
	}
	
	.product-context {
	    padding: 20px;
	    text-align: center;
	}
	
	.product-context a {
	    text-decoration: none; 
	    color: #0D5CAB;
	    font-weight: bold; 
	    transition: color 0.3s ease;
	}
	
	.product-context a:hover {
	    color: #009861;
	}
	
	.product-context div {
	    margin-bottom: 10px;
	    color: #333;
	}
	
	.product-context div:last-child {
	    font-size: 1.1em;
	    color: #009861;
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
		</div>
		<div class="product-list">
			<c:forEach items="${productCategory }" var="product">
				<div class="product-box">
					<div class="product-img-box" onclick="detailIn('${product.productName }')">
						<img alt="" src="${product.productImage }" >
					</div>
					<div class="product-context">
						<div>에너지 효율 등급 : ${product.productGrade }</div>
						<div>
							<a href = "${pageContext.request.contextPath}/productDetailInView?productName=${product.productName }">
								모델명 : ${product.productName }
							</a>
							
							<img  onclick="confirmAndCopy('${product.productName }')"  class="text-copy" src="${pageContext.request.contextPath }/resources/image/텍스트 아이콘.png">
							복사
						</div> 
						<div>브랜드 : ${product.productBrand }</div>
						<div>용량 : ${product.productVolume }</div>
						<div>연간 에너지 비용 : ${product.yearMoney }</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	

	<%@ include file="/WEB-INF/inc/footer.jsp" %>

	<!-- Bootstrap core JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script type="text/javascript">
		
		function detailIn(productName){
			location.href = "${pageContext.request.contextPath}/productDetailInView?productName=" + productName;
		}
	
	
		function confirmAndCopy(productName) {
		    // 확인 창을 띄워서 사용자가 모델명 복사를 확인하도록 함
		    let confirmation = confirm("모델명을 복사하시겠습니까?");
		    
		    // 사용자가 확인 버튼을 누른 경우
		    if (confirmation) {
		        copyText(productName);
		    }
		}
	
		function copyText(text) {
		    // Clipboard API를 사용해 텍스트를 클립보드에 복사
		    navigator.clipboard.writeText(text).then(function() {
		        // 복사 성공 시 실행되는 콜백
		        alert("복사된 모델명: " + text);
		    }).catch(function(err) {
		        // 복사 실패 시 실행되는 콜백
		        alert("복사 실패: " + err);
		    });
		}
		
	

	
	</script>
    
</body>
</html>
