<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지 대시보드</title>
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
</style>


</head>
<body>
	<!-- 상단 네비게이션 바 -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<!-- 상세 메뉴 바 -->
	<%@ include file="/WEB-INF/inc/subnavbarMy.jsp"%>

	<!-- 챗봇 아이콘 및 인터페이스 -->
	<%@ include file="/WEB-INF/inc/chatbot.jsp"%>
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
				<button class="btn-primary">정보 수정</button>
			</div>

			<!-- 활동 데이터 카드 -->
			<div class="card">
				<h2>활동 데이터</h2>
				<p>최근 로그인: 준비 중</p>
				<p>최근 사용량: 준비 중</p>
				<p>포인트: 준비 중</p>
			</div>

			<!-- 알림 카드 -->
			<div class="card">
				<h2>알림</h2>
				<p>현재 미확인 알림: 준비 중</p>
			</div>
		</div>

		<!-- 추가 섹션: 그래프 및 게시판 요약 -->
		<div class="extra-section">
			<h3>에너지 사용량 및 데이터</h3>
			<div class="placeholder">여기에 전기사용량, 가스 배출량 그래프 추가 예정</div>
		</div>

		<div class="extra-section">
			<h3>ZEB 신청 현황</h3>
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
						<c:forEach var="apply" items="${applys}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${apply.buildingName}</td>
								<td>${statusList[status.index]}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="view-more">
					<a href="${pageContext.request.contextPath}/applyStatusView"
						class="btn-primary">더보기</a>
				</div>
			</div>
		</div>
	</div>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

		<script>
    <script type="text/javascript">
	let v_status = document.querySelector('#status'); 
    let v_applyStatus = document.querySelectorAll('.applyStatus'); 
    let v_tableRows = document.querySelectorAll('tbody tr'); 
    let v_numberCells = document.querySelectorAll('tbody tr td:first-child'); 
    let v_downLoad = document.querySelectorAll('.download-link');
    let v_trs = document.querySelectorAll('.trs');
    let v_bId = document.querySelectorAll('.buildingId');
    let forms = document.querySelectorAll('.submitForm');

    v_status.addEventListener('change', () => {
        const selectedStatus = v_status.value; 
        let currentNum = 1;

        v_tableRows.forEach((row, index) => {
            const statusCell = v_applyStatus[index]; 
            const statusText = statusCell.innerText; 

            if (selectedStatus === "전체" || statusText.includes(selectedStatus)) {
                row.style.display = ""; 
                v_numberCells[index].innerText = currentNum++;
            } else {
                row.style.display = "none"; 
            }
        });
    });
	
	v_downLoad.forEach(dl =>{
		dl.addEventListener('click',()=>{
			
			let fn = dl.innerHTML;
			fn = fn.substr(3);
			
			location.href = "${pageContext.request.contextPath}/downLoadFile?fileName=" + fn
		})
	})
	
	v_trs.forEach((tr,idx) =>{ 
		tr.addEventListener('click',()=>{
			forms[idx].submit();
		})
	})
	
	
	
	
</script>
		</script>
</body>
</html>