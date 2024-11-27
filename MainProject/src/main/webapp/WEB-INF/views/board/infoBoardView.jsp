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
	margin-bottom: 30px;
	color: #333;
}

.intro-description {
	font-size: 16px;
	color: #555;
	margin-bottom: 30px;
	line-height: 1.5;
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
	margin:auto;
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
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>

	<!-- Navigation START -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<!-- Navigation END -->

	<!-- 상세 메뉴 바 -->
	<%@ include file="/WEB-INF/inc/subnavbarBoard.jsp"%>



	<!-- Main Content -->
	<div class="container">
		<!-- 소개 섹션 -->
		<div class="intro-section">
			<h2 class="intro-title">제로에너지건축물이란?</h2>
			<p class="intro-description">
				건축물에 필요한 에너지부하를 최소화하고, 신에너지 및 재생에너지를 활용하여 에너지 소요량을 최소화하는 녹색건축물 <br>
				*「녹색건축물 조성 지원법」 제2조(정의) 제4호
			</p>
			<div class="intro-boxes">
				<!-- 첫 번째 박스 -->
				<div class="info-wrapper">
					<div class="info-bar">
						<h3>패시브</h3>
						<p>냉·난방 에너지요구량 최소화 </p>
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
						<p>에너지 소비량 최소화 </p>
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
						<p>신재생에너지 생산 </p>
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


		<ul class="info-list">
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
		</ul>
	</div>

<div class="info-container">
    <div class="section-title">관련정보</div>
    <div class="info-boxes">
        <!-- 첫 번째 박스 -->
        <div class="info-box">
            <img src="${pageContext.request.contextPath}/resources/image/제로 에너지 건축 의무화 로드맵.png" 
                 alt="제로 에너지 건축 의무화 로드맵"
                 style="width: 100%; height: auto; border-radius: 8px;">
        </div>
        <!-- 두 번째 박스 -->
        <div class="info-box">
            <img src="${pageContext.request.contextPath}/resources/image/example2.jpg" 
                 alt="Example 2"
                 style="width: 100%; height: auto; border-radius: 8px;">
        </div>
    </div>
</div>


	<footer class="footer py-5 bg-dark">
		<p class="m-0 text-center text-white">Copyright &copy; 2024
			GreenSolution</p>
	</footer>

</body>
</html>
