<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
<style>
body {
	margin: 0;
	padding: 0;
	background-color: #f5f7fa;
	font-family: 'Roboto', sans-serif;
}

.dashboard-container {
	max-width: 1200px;
	margin: 30px auto;
	padding: 20px;
	background: #ffffff;
	border-radius: 12px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.dashboard-header {
	text-align: center;
	margin-bottom: 30px;
}

.dashboard-header h1 {
	font-size: 2rem;
	color: #333;
}

.dashboard-header p {
	color: #666;
	font-size: 1rem;
}

.dashboard-cards {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
	gap: 20px;
}

.card {
	background: #ffffff;
	border-radius: 12px;
	padding: 20px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	text-align: center;
}

.card h2 {
	font-size: 1.2rem;
	margin-bottom: 10px;
	color: #333;
}

.card p {
	font-size: 0.9rem;
	color: #666;
}

.btn-primary {
	background-color: #007bff;
	color: #fff;
	border-radius: 20px;
	padding: 10px 15px;
	font-size: 0.9rem;
	border: none;
}

.btn-primary:hover {
	background-color: #0056b3;
}

.extra-section {
	margin-top: 40px;
}

.extra-section h3 {
	font-size: 1.5rem;
	margin-bottom: 20px;
	color: #333;
}

.placeholder {
	height: 250px;
	background: #e9ecef;
	border-radius: 12px;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #6c757d;
	font-size: 1rem;
}

.small-zeb-table table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 10px;
	background-color: #fff;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	font-size: 0.9rem;
}

.small-zeb-table th, .small-zeb-table td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

.small-zeb-table th {
	background-color: #f4f4f4;
	font-weight: bold;
}

.view-more {
	text-align: center;
	margin-top: 10px;
}

.view-more a {
	font-size: 0.9rem;
	text-decoration: none;
	padding: 8px 12px;
	color: #fff;
	background-color: #007bff;
	border-radius: 4px;
	transition: background-color 0.3s;
}

.view-more a:hover {
	background-color: #0056b3;
}

.go-link-apply{
	margin-left: 50px;
	color: blue;
}

.go-link-apply:hover{
	cursor: pointer;
	color: red;
}

</style>


</head>
<body>
	<!-- 상단 네비게이션 바 -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<!-- 상세 메뉴 바 -->
	<%@ include file="/WEB-INF/inc/subnavbarMy.jsp"%>

	<!-- 챗봇 아이콘 및 인터페이스 -->
	<div class="dashboard-container">
		<!-- 대시보드 헤더 -->
		<div class="dashboard-header">
			<h1>안녕하세요, ${sessionScope.login.memName} 님</h1>
			<p>여기에서 회원 정보와 활동 데이터를 확인할 수 있습니다.</p>
		</div>

		<!-- 주요 카드 섹션 -->
		<div class="dashboard-cards">
			<!-- 기본 정보 카드 -->
			<div class="card">
				<h2>회원 정보</h2>
				<p>이름: ${sessionScope.login.memName}</p>
				<p>이메일: ${sessionScope.login.memEmail}</p>
				<p>전화번호: ${sessionScope.login.memPhone}</p>
				<button id="editBtn" class="btn-primary">정보 수정</button>
			</div>

			<!-- 활동 데이터 카드 -->
			<div class="card">
				<h2>활동 데이터</h2>
				<canvas id="myChart"></canvas>
			</div>
		</div>


		<div class="extra-section">
			<div style="display: flex;">
				<h3>ZEB 신청 현황</h3>
				<div class="go-link-apply">바로가기</div>  
			</div>
			<div class="small-zeb-table">
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>건물명</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${applyList.size() > 0 }">
							<c:forEach var="apply" items="${applyList}" varStatus="status">
								<tr>
									<td>${status.count}</td>
									<td>${apply.buildingName}</td>
									<c:choose> 
										<c:when test="${apply.approveYn == 'N' && apply.rejectYn == 'N'}">
											<td>검토중</td>
									    </c:when>
									    
									    <c:when test="${apply.approveYn == 'Y' && apply.rejectYn == 'N'}">
											<td>승인</td>
									    </c:when>
									    
									    <c:when test="${apply.approveYn == 'Y' && apply.rejectYn == 'Y'}">
											<td>거절</td>
									    </c:when>
									</c:choose>
								</tr> 
							</c:forEach>
						</c:if>
						<c:if test="${applyList.size() == 0 }">
							<tr>
								<td colspan="3">데이터가 존재하지 않습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<c:if test="${sessionScope.login.memId != 'admin' }">
	    <%@ include file="/WEB-INF/inc/chatbotbot.jsp"%>
	</c:if>


	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>






  
	
    <script type="text/javascript">
		
		document.getElementById("editBtn").addEventListener("click",()=>{
			location.href = '${pageContext.request.contextPath}/memEditView'
		})
		
		document.querySelector('.go-link-apply').addEventListener("click", ()=>{
			location.href = '${pageContext.request.contextPath}/applyStatusView'
		})
	
		let v_pageName = '${pageName}'
		let v_pageCount = '${pageCount}'
		
		v_pageName = v_pageName.replace("[", "").replace("]", "").split(",");
		v_pageCount = v_pageCount.replace('[','').replace(']','').split(",")
		let ctx = document.getElementById("myChart")
		
		let myChart = new Chart(ctx, {
	            type: 'bar',
	            data: { 
	                labels: v_pageName,
	                datasets: [{
	                    label: '페이지별 방문 횟수',
	                    data: v_pageCount,
	                    borderWidth: 1,
	                    backgroundColor: '#76BECF',
	                    borderColor: '#76BECF'
	                }]
	            },
	            options: {
	                responsive: true,
	                scales: {
	                }
	            }
	        });
		
		


	</script>
</body>
</html>