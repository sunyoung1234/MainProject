<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관련 정보 게시판</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/styles.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<style>
/* 공통 스타일 포함 */
body {
	font-family: "Noto Sans KR", sans-serif;
	font-optical-sizing: auto;
	font-weight: <weight>;
	font-style: normal;
	margin: 0;
	padding: 0;
	background-color: #f4f4f9;
}

.container {
	max-width: 1400px;
	margin: 10px auto;
	padding: 15px;
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);

	margin-bottom: 30px;  
}

.info-list {
	list-style: none;
	padding: 0;
	margin: 0;
}

.info-item {
	border-bottom: 1px solid #ddd;
	padding: 15px 0;
	display: flex;
	align-items: center;
}

.info-item img {
	
}

.info-item:last-child {
	border-bottom: none;
}

.info-item img {
	width: 120px;
	height: 80px;
	object-fit: cover;
	margin-right: 15px;
	border-radius: 5px;
}

.info-item h3 {
	font-size: 18px;
	margin: 0;
}

.info-item p {
	margin: 5px 0 0;
	color: #666;
	font-size: 14px;
}

.info-container {
	max-width: 1400px;
	margin: 10px auto;
	padding: 15px;
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.section-title {
	font-size: 28px;
	color: #333;
	text-align: center;
	margin-bottom: 20px;
}

/* 박스와 더하기 이미지를 감싸는 부모 */
.intro-boxes {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 20px; /* 박스와 이미지 간격 */
}

/* 더하기 이미지 스타일 */
.plus-icon {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100px; /* 이미지 크기 */
	height: 100px;
}

.plus-icon img {
	max-width: 100%;
	max-height: 100%;
	object-fit: contain; /* 이미지가 크기에 맞게 조정 */
}

.info-box {
	position: relative;
	background-size: cover;
	background-position: center;
	height: 300px;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.info-box .overlay {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	color: white;
	text-align: center;
	opacity: 0;
	transition: opacity 0.3s ease;
}

.info-box:hover .overlay {
	opacity: 1;
}

.info-box h3 {
	margin: 0;
	font-size: 20px;
}

.info-box p {
	margin: 5px 0 0;
	font-size: 14px;
}

/* 소개 섹션 스타일 */
.intro-section {
	max-width: 1400px;
	margin: 30px auto;
	text-align: center;
	padding: 20px;
	background-color: white;
}

.intro-title {
	font-size: 28px;
	font-weight: bold;
	margin-bottom: 10px;
	color: #333;
	display: flex;
	justify-content: center;
	margin-top:50px;
}

.intro-description {
	font-size: 16px;
	color: #555;
	margin-bottom: 30px;
	line-height: 1.5;
	text-align: center;
}

.intro-boxes {
	display: flex;
	justify-content: space-between;
	gap: 20px;
}

.info-wrapper {
	display: flex;
	flex-direction: column; /* 설명과 이미지 위아래 배치 */
	align-items: center;
	gap: 10px;
	min-width: 350px;
}

/* 설명 영역 */
.info-bar {
	width: 100%;
	max-width: 300px;
	min-width: 300px;
	background-color: rgba(0, 86, 179, 0.8);
	color: white;
	padding: 10px 15px;
	text-align: center;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	background-color: rgba(0, 86, 179, 0.8);
}

.info-bar h3 {
	font-size: 18px;
	margin: 0 0 5px 0;
	font-weight: bold;
}

.info-bar p {
	font-size: 14px;
	margin: 0;
}

.intro-box {
	width: 100%;
	max-width: 300px;
	height: 300px;
	border-radius: 12px;
	background-size: cover;
	background-position: center;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.intro-box:hover {
	transform: scale(1.05);
	box-shadow: 0 8px 12px rgba(0, 0, 0, 0.15);
}

.intro-box .overlay {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	color: white;
	text-align: center;
	padding: 20px;
	opacity: 0;
	transition: opacity 0.3s ease;
}

.intro-box:hover .overlay {
	opacity: 1;
}

.intro-box h3 {
	font-size: 22px;
	margin-bottom: 10px;
	font-weight: bold;
	text-transform: uppercase;
}

.intro-box p {
	font-size: 14px;
	margin-bottom: 20px;
}

.intro-btn {
	background-color: #007bff;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 20px;
	cursor: pointer;
	font-size: 14px;
	transition: background-color 0.3s ease;
}

.intro-btn:hover {
	background-color: #0056b3;
}

.intro-footer {
	margin: auto;
	margin-top: 50px;
	width: 100%;
	font-size: 14px;
	max-width: 800px;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	text-align: center;
	padding: 10px 15px;
	background-color: rgba(0, 86, 179, 0.8);
	color: white;
	width: 100%;
}
</style>

<style>
.energy-certification-section {
	margin: 50px auto;
	padding: 20px;
	max-width: 1200px;
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	text-align: center;
}

.section-title {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 15px;
}

.section-description {
	font-size: 16px;
	color: #666;
	margin-bottom: 30px;
}

.table {
	width: 100%;
	border: 1px solid #ddd;
}

.table th, .table td {
	text-align: center;
	padding: 10px;
	border: 1px solid #ddd;
	font-size: 14px;
}

.table th {
	background-color: #0056b3;
	color: black;
	font-weight: bold;
	text-align: center;
}

.table-hover tbody tr:hover {
	background-color: #f1f1f1;
}
</style>
<style>
.certification-blocks {
	display: flex;
	justify-content: center; /* 중앙 정렬 */
	align-items: stretch; /* 세로 방향으로 높이 일치 */
	gap: 20px; /* 박스 간격 */
}



.certification-block {
	flex: 1; /* 동일한 너비 */
	background-color: white;
	border-radius: 8px;
	padding: 15px; /* 내부 여백 */
	display: flex;
	flex-direction: column; /* 세로 정렬 */
	justify-content: space-between; /* 아이템 간 간격 조정 */
	align-items: center; /* 중앙 정렬 */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	font-size: 14px;
	color: #0056b3;
	text-decoration: none;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}


.certification-block:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
}

.certification-block p {
	margin: 10px 0;
	text-align: center; /* 텍스트 중앙 정렬 */
	cursor: pointer;
	font-size: 16px;
}

.certification-block:nth-child(2):p{

}

.certification-block a{
	text-decoration: none;
}

.icon-container {
	display: flex;
	justify-content: center;
	align-items: center;
}

.icon-container img {
	width: 80px;
	height: 80px;
	object-fit: contain;
	cursor: pointer;
}

.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	justify-content: center;
	align-items: center;
	z-index: 999;
}

.modal-content {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	max-width: 600px;
	width: 80%;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	text-align: center;
}

.modal-content h4 {
	margin-top: 0;
	font-size: 20px;
	color: #0056b3;
}

.modal-content p {
	font-size: 14px;
	color: #333;
}

.close-btn {
	position: absolute;
	top: 10px;
	right: 20px;
	font-size: 24px;
	cursor: pointer;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>

	<!-- Navigation START -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<!-- Navigation END -->

	<!-- 상세 메뉴 바 -->
	<%@ include file="/WEB-INF/inc/subnavbarMap.jsp"%>


	<h2 class="intro-title">제로 에너지 건축물이란?</h2>
	<!-- Main Content -->
	<div class="container">
		<!-- 소개 섹션 -->
		<div class="intro-section">
			
			<p class="intro-description">
				건축물에 필요한 에너지부하를 최소화하고, 신에너지 및 재생에너지를 활용하여 에너지 소요량을 최소화하는 녹색건축물 <br>
				*「녹색건축물 조성 지원법」 제2조(정의) 제4호
			</p>
			<div class="intro-boxes">
				<!-- 첫 번째 박스 -->
				<div class="info-wrapper">
					<div class="info-bar">
						<h3>패시브</h3>
						<p>냉·난방 에너지요구량 최소화</p>
						<p>(단열·기밀성능 강화 등)</p>
						<p></p>
					</div>
					<div class="intro-box"
						style="background-image: url('${pageContext.request.contextPath}/resources/image/zeb_intro_img_bg01.png');">
					</div>
				</div>

				<!-- 더하기 이미지 -->
				<div class="plus-icon">
					<img
						src="${pageContext.request.contextPath}/resources/image/zeb_intro_arrow.png"
						alt="더하기 아이콘">
				</div>

				<!-- 두 번째 박스 -->
				<div class="info-wrapper">
					<div class="info-bar">
						<h3>액티브</h3>
						<p>에너지 소비량 최소화</p>
						<p>(고효율 설비, BEMS 적용)</p>
					</div>
					<div class="intro-box"
						style="background-image: url('${pageContext.request.contextPath}/resources/image/zeb_intro_img_bg02.png');">
					</div>
				</div>

				<!-- 더하기 이미지 -->
				<div class="plus-icon">
					<img
						src="${pageContext.request.contextPath}/resources/image/zeb_intro_arrow.png"
						alt="더하기 아이콘">
				</div>

				<!-- 세 번째 박스 -->
				<div class="info-wrapper">
					<div class="info-bar">
						<h3>신재생</h3>
						<p>신재생에너지 생산</p>
						<p>(태양광, 지열, 연료전지 등)</p>
					</div>
					<div class="intro-box"
						style="background-image: url('${pageContext.request.contextPath}/resources/image/zeb_intro_img_bg03.png');">
					</div>
				</div>
			</div>
			<p class="intro-footer">신축 건물부문 온실가스 감축 핵심 이행방안으로 제로에너지건축물 보급확산
				필요</p>
		</div>


		<div class="certification-intro">
			<h3 class="section-title">제로에너지건축물 인증/의무 대상</h3>
			<p class="intro-description">
				(인증대상) 건축물 에너지효율등급 인증대상 중 건축주가 제로에너지건축물 인증을 신청하는 건물 <br> <span
					class="sub-text">* 단독·공동주택, 업무시설, 근린생활시설 등 다부문 용도의 건축물을 포함</span>
			</p>
			<div class="certification-blocks">
				<!-- 왼쪽 박스 -->
				<div class="certification-block" id="modal-trigger">
					<p>(참고) 제로에너지건축물 인증대상 건축물의 범위</p>
					<div class="icon-container">
						<img
							src="${pageContext.request.contextPath}/resources/image/modal_img.png"
							alt="모달 열기">
					</div>
				</div>
				<!-- 오른쪽 박스 -->
				<div class="certification-block">
					<a
						href="https://law.go.kr/%EB%B2%95%EB%A0%B9%EB%B3%84%ED%91%9C%EC%84%9C%EC%8B%9D/(%EA%B1%B4%EC%B6%95%EB%B2%95%EC%8B%9C%ED%96%89%EB%A0%B9,%EB%B3%84%ED%91%9C1)"
						target="_blank">
						<p>(참고) 건축법 시행령 별표1</p>
						<div class="icon-container">
							<img
								src="${pageContext.request.contextPath}/resources/image/href_img.png"
								alt="외부 링크">
						</div>
					</a>
				</div>
			</div>
			<p class="intro-footer">신축·재축 또는 기존 건축물의 대지에 범위의 건축물을 증축하는 연면적
				500㎡ 이상의 에너지절약계획서 (30세대 이상의 공동주택의 경우 친환경 주택 에너지절약계획) 제출 대상의 공공 건축물은
				인증 표시 의무 대상 건축물에 해당</p>
		</div>

		<!-- 모달 창 -->
		<div id="modal" class="modal hidden">
			<div class="modal-content">
				<span id="close-modal" class="close-btn">&times;</span>
				<h6>「건축물 에너지효율등급 인증 및 제로에너지건축물 인증에 관한 규칙」제2조</h6>
				<p>
					제2조(적용대상) 「녹색건축물 조성 지원법」 (이하 "법"이라 한다) 제17조제5항 및 「녹색건축물 조성 지원법 시행령」
					(이하 "영"이라 한다) 제12조제1항에 따른 건축물 에너지효율등급 인증 및 제로에너지건축물 인증은 「건축법 시행령」
					별표 1 각 호에 따른 건축물을 대상으로 한다. 다만, 「건축법 시행령」 별표 1 제3호부터 제13호까지 및 제15호부터
					제29호까지의 규정에 따른 건축물 중 국토교통부장관과 산업통상자원부장관이 공동으로 고시하는 실내 냉방·난방 온도
					설정조건으로 인증 평가가 불가능한 건축물 또는 이에 해당하는 공간이 전체 연면적의 100분의 50 이상을 차지하는
					건축물은 제외한다.
					<개정2015.11.18., 2017. 1. 20., 2021. 8. 23.>
				</p>
			</div>
		</div>



		<div class="energy-certification-section">
			<h3 class="section-title">
				「녹색건축물 조성 지원법」 시행령
				<개정2022.12.27>
			</h3>
			<p class="section-description">에너지효율등급 인증 또는 제로에너지건축물 인증 표시 의무 대상
				건축물</p>
			<div class="table-responsive">
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>요건</th>
							<th>에너지효율등급 인증 표시 의무 대상</th>
							<th>제로에너지건축물 인증 및 에너지효율등급 인증 표시 의무 대상</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>소유 또는 관리주체</td>
							<td>가. 제9조제2항 각 호의 기관<br>나. 교육관<br>다. 공공주택 특별법
								제4조에 따른 공공주택사업자
							</td>
							<td>가. 제9조제2항 각 호의 기관<br>나. 교육관<br>다. 공공주택 특별법
								제4조에 따른 공공주택사업자
							</td>
						</tr>
						<tr>
							<td>건축 및 리모델링의 범위</td>
							<td>신축·재축 또는 증축하는 경우일 것.<br> 단, 증축의 경우에는 기존 건축물의 대지에
								범위가<br> 건축물로 증축하는 경우로 한정한다.
							</td>
							<td>신축·재축 또는 증축하는 경우일 것.<br> 단, 증축의 경우에는 기존 건축물의 대지에
								범위가<br> 건축물로 증축하는 경우로 한정한다.
							</td>
						</tr>
						<tr>
							<td>건축물의 범위</td>
							<td>법 제17조제5항제1호에 따라 국토교통부와 산업통상자원부의<br> 공동 부령으로 정하는
								건축물<br> 단, 「건축법 시행령」 별표 1 제2호 라목에 따른 기숙사<br> (아파트 기숙사만
								해당한다)는 제외한다.
							</td>
							<td>법 제17조제5항제1호에 따라 국토교통부와 산업통상자원부의<br> 공동 부령으로 정하는
								건축물<br> 단, 「건축법 시행령」 별표 1 제2호 라목에 따른 기숙사<br> (아파트 기숙사만
								해당한다)는 제외한다.
							</td>
						</tr>
						<tr>
							<td>공동주택의 세대수 또는 건축물의 면적적</td>
							<td>가. 공동주택의 경우: 전체 세대 수 30세대 이상<br> 나. 기숙사의 경우: 연면적 3천
								제곱미터 이상<br> 다. 공공주택 외의 건축물의 경우: 연면적 5백제곱미터 이상
							</td>
							<td>가. 공동주택의 경우: 전체 세대 수 30세대 이상<br> 나. 기숙사의 경우: 연면적 3천
								제곱미터 이상<br> 다. 공공주택 외의 건축물의 경우: 연면적 5백제곱미터 이상
							</td>
						</tr>
						<tr>
							<td>에너지 절약계획서 등 제출 대상 여부</td>
							<td>가. 공동주택의 경우: 「주택법」시행규칙 등에 관한 규정<br> 나. 제64조제2항에 따른
								친환경 주택 에너지 절약계획서 제출 대상
							</td>
							<td>가. 공동주택 외의 건축물의 경우: 법 제14조제1항에 따른<br> 에너지 절약계획서 제출
								대상일 것
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>


<%-- 		<ul class="info-list">
			<!-- 예제 정보 항목 -->
			<li class="info-item"><img
				src="${pageContext.request.contextPath}/resources/image/2050탄소중립 추진전략.png"
				alt="정보 이미지">
				<div>
					<h3>제로에너지 정책 개요</h3>
					<p>제로에너지 건축물 관련 정책 및 방향성 설명</p>
				</div></li>
			<li class="info-item"><img
				src="${pageContext.request.contextPath}/resources/image/example2.jpg"
				alt="정보 이미지">
				<div>
					<h3>제로에너지 인증 절차</h3>
					<p>인증 절차와 제출 서류 안내</p>
				</div></li>
		</ul> --%>
	</div>
	<c:if test="${sessionScope.login.memId != 'admin' }">
	    <%@ include file="/WEB-INF/inc/chatbotbot.jsp"%>
	</c:if>


	<%@ include file="/WEB-INF/inc/footer.jsp" %>

	<script>
document.getElementById('modal-trigger').addEventListener('click', () => {
    document.getElementById('modal').style.display = 'flex';
});

document.getElementById('close-modal').addEventListener('click', () => {
    document.getElementById('modal').style.display = 'none';
});

window.addEventListener('click', (e) => {
    const modal = document.getElementById('modal');
    if (e.target === modal) {
        modal.style.display = 'none';
    }
});
</script>
</body>
</html>
