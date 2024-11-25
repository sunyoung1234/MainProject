<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content />
<meta name="author" content />
<title>에너지 효율 제품</title>
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
		width:1300px;
		margin: auto;
		margin-top:50px;
		margin-bottom: 200px;
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
		text-decoration: none;
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
	
	}
	
	.product-box{
		width:350px;
		height:300px;
		border: 1px solid #ddd;
        border-radius: 10px;
	}
	
	.product-box:hover {
       transform: translateY(-10px);
       box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
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
		height: 30%;
        background-color: #f4f7f6;
        padding: 10px;
        font-size: 16px;
        font-weight: 600;
	}
	
	.product-name-a{
		text-decoration:none;
		color:black;
	}
	
	/* 기본 스타일 */
	.energy-efficiency-comparison {
	    max-width: 1100px;
	    margin: 0 auto;
	    padding: 20px;
	    border-radius: 12px;
	    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	   	margin-top:50px;
	}
	
	.energy-efficiency-comparison h2 { 
	    text-align: center;
	    font-size: 28px;
	    font-weight: 600;
	    color: #333;
	    margin-bottom: 20px;
	}
	
	/* 비교 항목을 담은 컨테이너 */
	.comparison-container {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    gap: 30px;
	}
	
	/* 각 항목 (1등급, 3등급, 5등급) */
	.comparison-item {
	    width: 30%;
	    text-align: center;
	    border-radius: 8px;
	    padding: 20px;
	    background: linear-gradient(135deg, rgba(0, 204, 255, 0.1), rgba(255, 255, 255, 0.6));
	    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	    transition: transform 0.3s ease;
	}
	
	.comparison-item:hover {
	    transform: scale(1.05);
	}
	
	/* 헤더 스타일 (1등급, 3등급, 5등급) */
	.comparison-header {
	    font-size: 22px;
	    font-weight: bold;
	    color: #333;
	    margin-bottom: 15px;
	    padding: 10px 20px;
	    border-radius: 8px;
	    background: #04b89f;
	    color: white;
	}
	
	/* 본문 스타일 */
	.comparison-body {
	    font-size: 16px;
	    color: #333;
	}
	
	.comparison-body p {
	    margin: 5px 0; 
	}
	
	/* VS 구분자 */
	.vs-divider {
	    font-size: 32px;
	    font-weight: bold;
	    color: #333;
	    text-transform: uppercase;
	    padding: 10px 20px;
	    border-radius: 10px;
	    width: 70px;
	    text-align: center;
	}
	
	/* 모바일 및 작은 화면을 위한 반응형 */
	@media (max-width: 768px) {
	    .comparison-container {
	        flex-direction: column;
	        align-items: center;
	    }
	    .comparison-item {
	        width: 80%;
	        margin-bottom: 20px;
	    }
	    .vs-divider {
	        margin: 20px 0;
	    }
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
		
		<div class="energy-efficiency-comparison">
	    <h2>에너지 효율 등급 비교 : 전기냉장고(830L)</h2>
		    <div class="comparison-container">
		        <div class="comparison-item vs-item">
		            <div class="comparison-header">1등급</div>
		            <div class="comparison-body">
		                <p>연간소비전력량 (kWh): 369.8</p>
		                <p class="cost">연간에너지비용 (원): 59,000</p> <!-- 강조된 비용 -->
		            </div>
		        </div>
		        <div class="vs-divider">VS</div>
		        <div class="comparison-item vs-item">
		            <div class="comparison-header">3등급</div>
		            <div class="comparison-body">
		                <p>연간소비전력량 (kWh): 449</p>
		                <p class="cost">연간에너지비용 (원): 72,000</p>
		            </div>
		        </div>
		        <div class="vs-divider">VS</div>
		        <div class="comparison-item vs-item highlighted">
		            <div class="comparison-header">5등급</div>
		            <div class="comparison-body">
		                <p>연간소비전력량 (kWh): 588.4</p>
		                <p class="cost highlight-cost">연간에너지비용 (원): 94,000</p> <!-- 강조된 비용 -->
		            </div>
		        </div>
		    </div>
		</div>


		
		
		
		 	
		<div class="product-list">
			<div class="product-box">
				<div class="product-img">
					<a href="${pageContext.request.contextPath }/productDetailView?productCategory=전기냉장고">
						<img src="https://eep.energy.or.kr/images/item/i_1.png">
					</a>
				</div>
				<div class="product-name">
					<a class="product-name-a" href="${pageContext.request.contextPath }/productDetailView?productCategory=전기냉장고">
						전기냉장고
					</a>
				</div>
			</div>
			<div class="product-box">
				<div class="product-img">
					<a href="${pageContext.request.contextPath }/productDetailView?productCategory=김치냉장고">
						<img src="https://eep.energy.or.kr/images/item/i_2.png">
					</a>
				</div>
				<div class="product-name">
					<a class="product-name-a" href="${pageContext.request.contextPath }/productDetailView?productCategory=전기냉장고">
						김치냉장고
					</a>
				</div>
			</div>
			<div class="product-box">
				<div class="product-img">
					<a href="${pageContext.request.contextPath }/productDetailView?productCategory=전기세탁기(일반)">
						<img src="https://eep.energy.or.kr/images/item/i_4.png">
					</a>
				</div>
				<div class="product-name">
					<a class="product-name-a" href="${pageContext.request.contextPath }/productDetailView?productCategory=전기냉장고">
						전기세탁기(일반)
					</a>
				</div>
			</div>
		</div>
		<div class="product-list">
			<div class="product-box">
				<div class="product-img">
					<a href="${pageContext.request.contextPath }/productDetailView?productCategory=전기세탁기(드럼)">
						<img src="https://eep.energy.or.kr/images/item/i_5.png">
					</a>
				</div>
				<div class="product-name">
					<a class="product-name-a" href="${pageContext.request.contextPath }/productDetailView?productCategory=전기세탁기(드럼)">
						전기세탁기(드럼)
					</a>
				</div>
			</div>
			<div class="product-box">
				<div class="product-img">
					<a href="${pageContext.request.contextPath }/productDetailView?productCategory=제습기">
						<img src="https://eep.energy.or.kr/images/item/i_28.png">
					</a>
				</div>
				<div class="product-name">
					<a class="product-name-a" href="${pageContext.request.contextPath }/productDetailView?productCategory=제습기">
						제습기
					</a>
				</div>
			</div>
			<div class="product-box">
				<div class="product-img">
					<a href="${pageContext.request.contextPath }/productDetailView?productCategory=의류건조기">
						<img src="https://eep.energy.or.kr/images/item/h_51.png">
					</a>
				</div>
				<div class="product-name">
					<a class="product-name-a" href="${pageContext.request.contextPath }/productDetailView?productCategory=의류건조기">
						의류건조기
					</a>
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
    
</body>
</html>
