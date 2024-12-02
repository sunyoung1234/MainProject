<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>홈페이지</title>
<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico" />

<!-- Bootstrap CSS 수정 링크 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />

<!-- Script links -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css" />

<style>
/* 메인 스타일 */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: white;
}

/* 섹션 스타일 */
.section {
	width: 100%;
	text-align: center;
	height: 100vh;
}

/* 가로 슬라이더 */
.introduce {
	width: 100%;
	height: 100vh;
}

.introduce .slick-slide {
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
}

.introduce img {
	width: 100%;
	height: auto;
}

/* 세로 슬라이더 */
.vertical-slider {
	width: 100%;
	height: 100vh;
}

.vertical-slider .slick-slide {
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
}

/* 사이드 네비게이션 */
.side-nav {
	position: fixed;
	right: 20px;
	top: 50%;
	transform: translateY(-50%);
	display: flex;
	flex-direction: column;
	gap: 10px;
	background-color: rgba(0, 0, 0, 0.7);
	padding: 10px 15px;
	border-radius: 10px;
	z-index: 10;
}

.side-nav .nav-item {
	color: white;
	text-decoration: none;
	font-weight: bold;
	font-size: 14px;
	padding: 8px 10px;
	border-radius: 5px;
	text-align: center;
	transition: all 0.3s;
}

.side-nav .nav-item:hover, .side-nav .nav-item.active {
	background-color: white;
	color: black;
}
</style>





<style>
/* 카드 스타일 */
.card {
	border-radius: 10px;
	overflow: hidden;
	transition: transform 0.2s;
}

.card-header {
	padding: 20px;
	text-align: center;
}

.card-body {
	padding: 20px;
}
</style>

<style>

    /* Fade-in 애니메이션 정의 */
@keyframes fadeInUp {
	0% {
		opacity: 0;
		transform: translateY(20px); /* 텍스트가 위로 이동하는 효과 */
	}
	100% {
		opacity: 1;
		transform: translateY(0); /* 원래 위치로 돌아옴 */
	}
}

/* 애니메이션을 적용할 클래스 */
.fade-in {
	opacity: 0; /* 처음에 투명하게 시작 */
	animation: fadeInUp 1s ease forwards; /* 1초 동안 애니메이션 적용 */
}

/* 각 텍스트 요소에 지연 시간 추가 */
.fade-in:nth-child(1) {
	animation-delay: 0s; /* 첫 번째 요소는 지연 없음 */
}
.fade-in:nth-child(2) {
	animation-delay: 1s; /* 두 번째 요소는 1초 지연 */
}
.fade-in:nth-child(3) {
	animation-delay: 2s; /* 세 번째 요소는 2초 지연 */
}
.fade-in:nth-child(4) {
	animation-delay: 3s; /* 네 번째 요소는 3초 지연 */
}
    


</style>

<style>
/* 소개 섹션의 비디오와 텍스트 스타일링 */
.about-video-section {
	position: relative;
	height: 100vh;
	overflow: hidden;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
}

.about-video-section video {
	width: 100%;
	height: 140%;
	object-fit: cover;
}

.about-overlay {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5); /* 어둡게 오버레이 효과 */
}

.about-overlay-text {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	text-align: center;
	color: white;
}

.about-heading {
	margin-bottom: 10px;
	font-weight: bold;
	text-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
}

.about-description {
	margin: 20px auto;
	line-height: 1.6;
	max-width: 800px;
	font-weight: 300;
}

/* 서비스 아이콘과 텍스트 스타일 */
.about-services {
    display: flex;
    justify-content: center;
    gap: 30px;
    margin-top: 40px;
}

.service {
    text-align: center;
    color: #fff;
    cursor: pointer; /* 포인터 커서 추가 */
    transition: transform 0.3s ease; /* 부드러운 변화를 위한 트랜지션 */
    text-decoration: none; /* 링크 밑줄 제거 */
    gap: 35px;
}

.service:hover {
    transform: scale(1.3); /* 아이콘 크기를 130%로 확대 */
    color: white;
}

.service i {
    font-size: 50px;
    color: #a5d6a7; /* 친환경적인 녹색 계열 색상 */
    margin-bottom: 10px;
    transition: transform 0.3s ease; /* 아이콘 크기 변화에 트랜지션 추가 */
}

.service p {
    margin-top: 10px;
    font-size: 18px;
    text-decoration: none;
    color:white;
}
</style>
<style>
/* 배너 섹션 애니메이션 도형 */
#animated-shape {
    width: 250px;
    height: 250px;
    margin: 0 auto;
    position: relative;
    border: 5px solid #28a745;
    border-radius: 50%;
    animation: rotate 6s linear infinite;
    background: radial-gradient(circle, rgba(40, 167, 69, 0.2), rgba(40, 167, 69, 0));
    transition: transform 0.5s ease; /* 크기 변화를 부드럽게 하기 위한 트랜지션 */
}

#animated-shape::before,
#animated-shape::after {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    border-radius: 50%;
    transition: transform 0.5s ease; /* 내부 도형 크기 변화를 부드럽게 하기 위한 트랜지션 */
}

#animated-shape::before {
    width: 150px;
    height: 150px;
    border: 3px dashed #28a745;
    animation: pulse 3s ease-in-out infinite;
}

#animated-shape::after {
    width: 100px;
    height: 100px;
    background-color: rgba(40, 167, 69, 0.1);
    animation: scaleUp 2.5s ease-in-out infinite;
}

/* Hover 상태에서 도형이 커지도록 설정 */
#animated-shape:hover {
    transform: scale(1.5); /* 도형 전체 크기 1.5배 확대 */
}

#animated-shape:hover::before {
    transform: translate(-50%, -50%) scale(1.5); /* 내부 dashed 도형 크기 확대 */
}

#animated-shape:hover::after {
    transform: translate(-50%, -50%) scale(1.5); /* 내부 원 크기 확대 */
}

@keyframes rotate {
    0% {
        transform: rotate(0deg);
    }
    100% {
        transform: rotate(360deg);
    }
}

@keyframes pulse {
    0%, 100% {
        transform: translate(-50%, -50%) scale(1);
    }
    50% {
        transform: translate(-50%, -50%) scale(1.2);
    }
}

@keyframes scaleUp {
    0%, 100% {
        transform: translate(-50%, -50%) scale(1);
    }
    50% {
        transform: translate(-50%, -50%) scale(1.4);
    }
}

</style>
<style>
/* about 섹션 내부에서 footer가 하단에 고정되도록 설정 */
#about {
    display: flex;
    flex-direction: column;
    justify-content: space-between; /* 콘텐츠와 footer 간격 자동 조정 */
    min-height: 100vh; /* 화면 높이 전체를 차지 */
    padding-bottom: 0; /* 하단 패딩 제거 */
    margin-bottom: 0; /* 하단 마진 제거 */
}

/* footer 스타일 */
.footer {
    margin: 0; /* 여백 완전히 제거 */
    padding: 20px 0; /* 내부 여백 설정 */
    width: 100%; /* 가로로 꽉 채우기 */
    background-color: #343a40; /* footer 배경 */
    color: white; /* 텍스트 색상 */
    text-align: center; /* 가운데 정렬 */
    position: fixed; /* 화면 하단에 고정 */
    bottom: 0; /* 화면 하단에 딱 붙이기 */
}
</style>


</head>
<body>

	<!-- Navigation START -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<!-- Navigation END -->

	<!-- ChatBot START -->
	<%@ include file="/WEB-INF/inc/chatbot.jsp"%>
	<!-- ChatBot END -->

	<!-- 사이드 네비게이션 -->
	<div class="side-nav">
		<a href="#home" class="nav-item">HOME</a> <a href="#banner"
			class="nav-item">BANNER</a> <a href="#introduce" class="nav-item">INTRODUCE</a>
		<a href="#vision" class="nav-item">VISION</a> <a href="#about"
			class="nav-item">ABOUT</a>
	</div>

	<!-- 세로 슬라이더 -->
	<div class="vertical-slider">
		<section class="section" id="home">
			<!-- 소개 섹션의 비디오 배경 -->
			<header class="about-video-section">
				<video autoplay loop muted>
					<source
						src="${pageContext.request.contextPath}/resources/image/graphic1.mp4"
						type="video/mp4">
				</video>
				<!-- 어둡게 오버레이를 추가하여 텍스트 대비 향상 -->
				<div class="about-overlay"></div>

				<!-- 소개 섹션 텍스트와 아이콘 -->
				<div class="about-overlay-text">
					<h2 class="about-heading fade-in"
						style="font-size: 50px; color: white;">제로에너지빌딩을 위한</h2>
					<h2 class="about-heading fade-in"
						style="font-size: 50px; color: white;">Green Solution</h2>
					<p class="about-description fade-in"
						style="font-size: 24px; color: #d1d1d1; max-width: 800px;">
						Green Solution은 건축물의 에너지 사용량을 최소화하고 탄소 배출을 줄이기 위한 혁신적인 기술과 솔루션을
						제공합니다. 우리는 제로에너지빌딩 실현과 에너지 효율화를 통해 지속 가능한 미래를 만듭니다.</p>


					<div class="about-services fade-in">
					    <a href="${pageContext.request.contextPath}/electricityUseView" class="service" target="_blank">
					        <i class="fas fa-solar-panel"></i>
					        <p>전기 사용 현황</p>
					    </a>
					    <a href="${pageContext.request.contextPath}/mapView" class="service" target="_blank">
					        <i class="fas fa-map"></i>
					        <p>제로에너지건축물 현황</p>
					    </a>
					    <a href="${pageContext.request.contextPath}/inputView" class="service" target="_blank">
					        <i class="fas fa-globe"></i>
					        <p>제로에너지건축물 등급측정</p>
					    </a>
					</div>
				</div>
			</header>
		</section>


<section class="section" id="banner" style="background-color: #f8f9fa; padding: 70px 0; position: relative;">
    <div class="container">
        <div class="row align-items-center">
            <!-- 텍스트 섹션 -->
            <div class="col-lg-6 text-center text-lg-start">
                <h1 class="display-4 mb-4" style="font-weight: 700; color: #2c3e50;">
                    지속 가능한 에너지를 위한<br><strong style="color: #28a745;">미래의 솔루션</strong>
                </h1>
                <p class="mb-4" style="font-size: 20px; line-height: 1.8; color: #34495e;">
                    우리의 목표는 탄소 중립과 에너지 효율화를 통해<br>
                    친환경적인 미래를 만드는 것입니다. 혁신적인 기술과<br>
                    솔루션으로 지속 가능한 세상을 함께 만들어갑니다.
                </p>
                <div>
                    <a href="#vision" class="btn btn-success btn-lg px-5 py-2 shadow me-3">더 알아보기</a>
                    <a href="#about" class="btn btn-outline-success btn-lg px-5 py-2 shadow">문의하기</a>
                </div>
            </div>
            <!-- 애니메이션 도형 섹션 -->
            <div class="col-lg-6 text-center mt-5 mt-lg-0">
                <div id="animated-shape"></div>
            </div>
        </div>
    </div>
</section>



<section class="section banner" id="introduce" style="background: linear-gradient(to right, #83a4d4, #b6fbff); padding: 70px 0;">
    <div class="container">
        <div class="row align-items-center">
            <!-- 텍스트 섹션 -->
            <div class="col-lg-6 text-white text-center text-lg-start">
                <h1 class="display-4 mb-4" style="font-weight: 700;">환영합니다</h1>
                <p class="mb-4" style="font-size: 20px; line-height: 1.8;">
                    지속 가능한 미래를 위한 <strong>제로 에너지 솔루션</strong>에 대해 알아보세요.<br>
                    친환경 건축과 혁신적인 기술을 통해 지속 가능한 세상을 만듭니다.
                </p>
                <div>
                    <a href="#vision" class="btn btn-light btn-lg px-5 py-2 shadow me-3">비전 보기</a>
                    <a href="#about" class="btn btn-outline-light btn-lg px-5 py-2 shadow">문의하기</a>
                </div>
            </div>
            <!-- 이미지 섹션 -->
            <div class="col-lg-6 text-center mt-5 mt-lg-0">
                <img 
                    src="${pageContext.request.contextPath}/resources/image/many zeroEnergyBuilding img.jpg" 
                    alt="슬라이드 이미지 1" 
                    class="img-fluid rounded shadow-lg" 
                    style="border: 5px solid rgba(255, 255, 255, 0.5); max-height: 450px; object-fit: cover;">
            </div>
        </div>
    </div>
</section>




		<section class="section" id="vision" style="background-color: white; padding: 50px 0;">
    <div class="container">
        <h2 class="text-center mb-4" style="font-weight: bold; color: #343a40;">목표</h2>
        <p class="text-center mb-5" style="color: #6c757d; font-size: 18px;">
            제로 에너지 건축물 실현과 지속 가능한 미래를 위한 우리의 목표를 확인하세요.
        </p>
        <div class="row justify-content-center g-4">
            <!-- Card 1 -->
            <div class="col-md-6 col-lg-4">
                <div class="card shadow-sm h-100">
                    <img
                        src="${pageContext.request.contextPath}/resources/image/nature_build.png"
                        class="card-img-top" alt="Nature Build"
                        style="height: 250px; object-fit: cover;">
                    <div class="card-body text-center">
                        <h5 class="card-title" style="font-weight: bold; color: #28a745;">제로 에너지 건축물 등급 측정</h5>
                        <p class="card-text text-muted">건축물의 에너지 효율을 측정하여 더 나은 환경을 만들어 갑니다.</p>
                        <a href="${pageContext.request.contextPath}/inputView" class="btn btn-outline-success">더 알아보기</a>
                    </div>
                </div>
            </div>
            <!-- Card 2 -->
            <div class="col-md-6 col-lg-4">
                <div class="card shadow-sm h-100">
                    <img
                        src="${pageContext.request.contextPath}/resources/image/nature_co2_image.png"
                        class="card-img-top" alt="Nature CO2 Image"
                        style="height: 250px; object-fit: cover;">
                    <div class="card-body text-center">
                        <h5 class="card-title" style="font-weight: bold; color: #007bff;">지도 상세보기</h5>
                        <p class="card-text text-muted">지도와 데이터를 활용하여 건축물 정보를 한눈에 확인하세요.</p>
                        <a href="${pageContext.request.contextPath}/mapView" class="btn btn-outline-primary">더 알아보기</a>
                    </div>
                </div>
            </div>
            <!-- Card 3 -->
            <div class="col-md-6 col-lg-4">
                <div class="card shadow-sm h-100">
                    <img
                        src="${pageContext.request.contextPath}/resources/image/Energy_Efficient.jpg"
                        class="card-img-top" alt="Energy Efficiency"
                        style="height: 250px; object-fit: cover;">
                    <div class="card-body text-center">
                        <h5 class="card-title" style="font-weight: bold; color: #ffc107;">에너지 효율 제품</h5>
                        <p class="card-text text-muted">효율적인 에너지 소비를 위한 최신 기술과 제품을 소개합니다.</p>
                        <a href="${pageContext.request.contextPath}/productView" class="btn btn-outline-warning">더 알아보기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
		
		
<section class="section" id="about" style="background-color: white; padding: 50px 0;">
    <div class="container" style="margin-top: 150px;">
        <h2 class="text-center mb-4" style="font-weight: bold; color: #343a40; margin-bottom: 100px;">문의</h2>
        <p class="text-center mb-5" style="color: #6c757d; font-size: 18px;">
            궁금하신 사항이 있으시면 언제든지 연락해 주세요. 친절히 답변해 드리겠습니다.
        </p>
        <div class="row justify-content-center g-4" style="margin-top: 150px;">
            <!-- Contact Card 1 -->
            <div class="col-md-4">
                <div class="card shadow-sm h-100">
                    <div class="card-body text-center">
                        <i class="fas fa-phone-alt" style="font-size: 40px; color: #17a2b8;"></i>
                        <h5 class="card-title mt-3" style="font-weight: bold;">전화 상담</h5>
                        <p class="card-text text-muted">문의 사항은 고객센터로 전화 주시면 빠르게 안내해 드립니다.</p>
                        <a href="tel:+821234567890" class="btn btn-primary">전화하기</a>
                    </div>
                </div>
            </div>
            <!-- Contact Card 2 -->
            <div class="col-md-4">
                <div class="card shadow-sm h-100">
                    <div class="card-body text-center">
                        <i class="fas fa-envelope" style="font-size: 40px; color: #28a745;"></i>
                        <h5 class="card-title mt-3" style="font-weight: bold;">이메일 문의</h5>
                        <p class="card-text text-muted">이메일로 문의를 주시면 상세히 답변드리겠습니다.</p>
                        <a href="mailto:help@company.com" class="btn btn-success">이메일 보내기</a>
                    </div>
                </div>
            </div>
            <!-- Contact Card 3 -->
            <div class="col-md-4">
                <div class="card shadow-sm h-100">
                    <div class="card-body text-center">
                        <i class="fas fa-comments" style="font-size: 40px; color: #ffc107;"></i>
                        <h5 class="card-title mt-3" style="font-weight: bold;">실시간 채팅</h5>
                        <p class="card-text text-muted">실시간 상담을 통해 빠르게 문제를 해결해 드립니다.</p>
                        <a href="${pageContext.request.contextPath}/chatListView" class="btn btn-warning">채팅하기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/inc/footer.jsp" %> 
</section>

	</div>

	<!-- slick 슬라이드와 jQuery -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<script>
$(document).ready(function () {
    // Slick 세로 슬라이더 설정
    $('.vertical-slider').slick({
        dots: false,
        infinite: false,
        speed: 500,
        slidesToShow: 1,
        vertical: true,
        verticalSwiping: true,
        arrows: false,
        swipeToSlide: true,
        autoplay: false, // 자동 재생 끄기
    });

    // URL 해시 기반으로 섹션 이동
    function goToSectionFromHash() {
        const hash = window.location.hash; // 현재 URL의 해시 값 가져오기
        if (hash) {
            const sectionIndex = $(`${hash}`).index('.vertical-slider .section'); // 해당 섹션의 인덱스 가져오기
            if (sectionIndex !== -1) {
                $('.vertical-slider').slick('slickGoTo', sectionIndex); // Slick.js로 해당 섹션으로 이동
            }
        }
    }

    // 페이지 로드 시 URL 해시 처리
    goToSectionFromHash();

    // 해시 변경 감지 및 섹션 이동
    $(window).on('hashchange', function () {
        goToSectionFromHash();
    });

    // 사이드 네비게이션 클릭 시 섹션 이동 및 해시 변경
    $('.side-nav .nav-item').on('click', function (e) {
        e.preventDefault();
        const sectionID = $(this).attr('href'); // 클릭한 메뉴의 href 값 (#섹션ID)
        const sectionIndex = $(sectionID).index('.vertical-slider .section'); // 해당 섹션의 인덱스 가져오기
        if (sectionIndex !== -1) {
            $('.vertical-slider').slick('slickGoTo', sectionIndex); // Slick.js로 이동
            updateSidebar(sectionIndex); // 사이드바 상태 업데이트
            window.location.hash = sectionID; // URL 해시 업데이트
        }
    });

    // 슬라이더 이동 시 URL 해시와 사이드바 동기화
    $('.vertical-slider').on('afterChange', function (event, slick, currentSlide) {
        const currentSectionID = $('.vertical-slider .section').eq(currentSlide).attr('id'); // 현재 슬라이드 ID 가져오기
        updateSidebar(currentSlide); // 사이드바 상태 업데이트
        window.location.hash = `#${currentSectionID}`; // URL 해시 동기화
    });

    // 버튼 클릭 시 섹션 이동 및 URL 해시 업데이트
    $('a.btn').on('click', function (e) {
        e.preventDefault();
        const sectionID = $(this).attr('href'); // 버튼의 href 값 (#섹션ID)
        const sectionIndex = $(sectionID).index('.vertical-slider .section'); // 해당 섹션의 인덱스 가져오기
        if (sectionIndex !== -1) {
            $('.vertical-slider').slick('slickGoTo', sectionIndex); // Slick.js로 이동
            updateSidebar(sectionIndex); // 사이드바 상태 업데이트
            window.location.hash = sectionID; // URL 해시 업데이트
        }
    });

    // 마우스 휠로 슬라이더 이동
    $(window).on('wheel', function (event) {
        if (event.originalEvent.deltaY < 0) {
            $('.vertical-slider').slick('slickPrev'); // 위로 스크롤 시 이전 슬라이드
        } else {
            $('.vertical-slider').slick('slickNext'); // 아래로 스크롤 시 다음 슬라이드
        }
    });

    // 사이드 네비게이션 활성화 상태 업데이트 함수
    function updateSidebar(currentSlideIndex) {
        $('.side-nav .nav-item').removeClass('active'); // 모든 메뉴의 활성화 상태 제거
        $('.side-nav .nav-item').eq(currentSlideIndex).addClass('active'); // 현재 슬라이드와 매칭되는 메뉴 활성화
    }

    // 초기 메뉴 활성화 상태 설정
    const initialSlide = $('.vertical-slider').slick('slickCurrentSlide'); // 초기 슬라이드 인덱스 가져오기
    updateSidebar(initialSlide); // 초기 메뉴 활성화
});
</script>



</body>
</html>