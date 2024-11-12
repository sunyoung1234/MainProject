<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>홈페이지</title>
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" />

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
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css" />
    
<style>
/* 메인 스타일 */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color:white;
}

/* 섹션 스타일 */
.section {
	width: 100%;
	text-align: center;
	height: 100vh;
}

/* 가로 슬라이더 */
.horizontal-slider {
	width: 100%;
	height: 100vh;
}

.horizontal-slider .slick-slide {
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
}

.horizontal-slider img {
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
	right: 10px;
	top: 50%;
	transform: translateY(-50%);
	background-color: rgba(0, 0, 0, 0.5);
	padding: 10px;
	border-radius: 8px;
	color: white;
	z-index: 10;
}

   /* 사이드 네비게이션 링크 스타일 */
    .side-nav a {
        display: block;
        color: white;
        text-decoration: none;
        padding: 5px;
        margin: 5px 0;
        font-weight: bold;
        transition: color 0.3s;
        width: 120px; /* 너비를 고정 */
        text-align: center; /* 텍스트 가운데 정렬 */
    }

    /* 강조된 스타일 */
    .side-nav a.active {
        background-color: white;
        color: black;
        border-radius: 5px;
        padding: 5px 10px;
        box-sizing: border-box; /* 패딩 포함하여 크기 유지 */
    }
</style>

<style> /* 비디오 위 글씨 */

/* 비디오와 텍스트 레이아웃 */
.main-video {
	position: relative; /* 비디오 위에 텍스트를 올리기 위해 */
	height: 100vh; /* 전체 화면 높이 */
	overflow: hidden; /* 비디오가 부모 요소를 넘지 않도록 설정 */
	margin: 0; /* 기본 여백 제거 */
	padding: 0; /* 기본 패딩 제거 */
	top: -20px;
}

.main-video video {
	width: 100%; /* 비디오의 너비를 부모에 맞춤 */
	height: 100%; /* 비디오의 높이를 부모에 맞춤 */
	object-fit: cover; /* 비디오가 비율에 맞게 잘림 */
}

.overlay-text {
	position: absolute; /* 비디오 위에 텍스트를 올리기 위해 */
	top: 10%; /* 수직 중앙 정렬 */
	left: 50%; /* 수평 중앙 정렬 */
	transform: translate(-50%, -50%); /* 중앙 정렬 */
	color: white; /* 텍스트 색상 */
	text-align: center; /* 텍스트 정렬 */
	font-size: 1.5em; /* 비디오 위 텍스트 크기 조정 */
}


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
/* 챗봇 아이콘 스타일 */
.chatbot-icon {
    position: fixed;
    bottom: 20px;
    right: 20px;
    width: 60px;
    height: 60px;
    background-image: url('${pageContext.request.contextPath}/resources/image/챗봇아이콘.png');
    background-size: cover;
    background-position: center;
    cursor: pointer;
    z-index: 1000;
}

/* 챗봇 인터페이스 스타일 */
.chatbot-interface {
    position: fixed;
    bottom: 90px;
    right: 20px;
    width: 300px;
    height: 400px;
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    display: flex;
    flex-direction: column;
    z-index: 1000;
}

/* 챗봇 헤더 */
.chatbot-header {
    background-color: #007bff;
    color: white;
    padding: 10px;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.chatbot-header .close-btn {
    cursor: pointer;
    font-size: 20px;
}

/* 챗봇 콘텐츠 영역 */
.chatbot-content {
    flex-grow: 1;
    padding: 10px;
    overflow-y: auto; /* 스크롤바 추가 */
    font-size: 14px;
}

/* 챗봇 입력 영역 */
.chatbot-footer {
    padding: 10px;
    border-top: 1px solid #ddd;
}

.chatbot-footer input[type="text"] {
    width: 100%;
    padding: 5px;
    border: 1px solid #ddd;
    border-radius: 5px;
}
</style>

<style>
/* 사용자와 봇의 메시지 스타일 */
.user-message, .bot-message {
    padding: 8px 12px;
    margin: 5px;
    border-radius: 10px;
    max-width: 80%;
    word-wrap: break-word;
}

.user-message {
    background-color: #dcf8c6;
    text-align: right;
    align-self: flex-end;
}

.bot-message {
    background-color: #f1f0f0;
    text-align: left;
    align-self: flex-start;
}

/* 기본 링크 스타일 */
.navbar a {
    color: black !important; /* 기본 글자 색상 */
    text-decoration: none;
    transition: color 0.3s, background-color 0.3s; /* 애니메이션 효과 추가 */
}

/* 링크 hover 시 스타일 */
.navbar a:hover {
    background-color: black; /* 배경을 검정으로 */
    color: white !important; /* 글씨를 흰색으로 */
    border-radius: 5px; /* 모서리 둥글게 */
}

</style>


</head>
<body>

	<!-- Navigation START -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<!-- Navigation END -->

	<!-- 사이드 네비게이션 -->
	<div class="side-nav">
		<a href="#main-video">메인배너 섹션</a> <a href="#horizontal-slider">슬라이더
			섹션</a> <a href="#banner">배너 섹션</a> <a href="#about">회사 소개</a> <a
			href="#services">서비스</a> <a href="#contact">문의</a>
	</div>

	<!-- 세로 슬라이더 -->
	<div class="vertical-slider">
		<!-- 가로 슬라이더 섹션을 세로 슬라이더 첫 번째 페이지로 포함 -->

		<section class="section" id="main-video">
			<!-- 첫 번째 영역: 비디오 섹션 -->
			<header class="video-section" id="section1">
				<video autoplay loop muted>
					<source
						src="${pageContext.request.contextPath}/resources/image/forest.mp4"
						type="video/mp4">
				</video>
				<!-- 비디오 위에 텍스트 영역 -->
				<div class="overlay-text">
					<h2 class="fade-in"
						style="font-size: 40px; margin-bottom: 10px; text-shadow: -0.2px 0 #D3D3D3, 0 0.2px #D3D3D3, 0.2px 0 #D3D3D3, 0 -0.2px #D3D3D3;">지속
						가능한 건축을 위한 혁신</h2>
					<h2 class="fade-in"
						style="font-size: 60px; margin-bottom: 10px; text-shadow: -0.2px 0 #D3D3D3, 0 0.2px #D3D3D3, 0.2px 0 #D3D3D3, 0 -0.2px #D3D3D3;">GreenSolution</h2>
					<p class="fade-in"
						style="font-size: 20px; margin-bottom: 10px; text-shadow: -0.2px 0 #D3D3D3, 0 0.2px #D3D3D3, 0.2px 0 #D3D3D3, 0 -0.2px #D3D3D3;">우리는
						건축 자재의 탄소 배출량을 분석하여 환경에 부담을 덜어주는 솔루션을 제공합니다.</p>
					<p class="fade-in"
						style="font-size: 20px; margin-bottom: 10px; text-shadow: -0.2px 0 #D3D3D3, 0 0.2px #D3D3D3, 0.2px 0 #D3D3D3, 0 -0.2px #D3D3D3;">기술과
						지속 가능성이 결합된 우리의 노력으로, 더 나은 내일을 만듭니다.</p>
				</div>
			</header>
		</section>

		<section class="section" id="horizontal-slider">
			<div class="horizontal-slider">
				<div>
					<img
						src="${pageContext.request.contextPath}/resources/image/한전이미지1.jpg"
						alt="슬라이드 이미지 1">
				</div>
				<div>
					<img
						src="${pageContext.request.contextPath}/resources/image/한전이미지2.jpg"
						alt="슬라이드 이미지 2">
				</div>
				<div>
					<img
						src="${pageContext.request.contextPath}/resources/image/한전이미지3.jpg"
						alt="슬라이드 이미지 3">
				</div>
			</div>
		</section>

		<!-- 나머지 섹션들 -->
		<section class="section banner" id="banner">
			<div class="banner-text">
				<div>
					<img
						src="${pageContext.request.contextPath}/resources/image/mountain_banner_img.png"
						alt="슬라이드 이미지 1">
				</div>
				<h1>환영합니다</h1>
				<p>저희 웹사이트에 오신 것을 환영합니다!</p>
			</div>
		</section>

				<section class="section" id="about">
			<!-- 첫 번째 영역: 비디오 섹션 -->
			<header class="video-section" id="section1">
				<video autoplay loop muted>
					<source
						src="${pageContext.request.contextPath}/resources/image/graphic1.mp4"
						type="video/mp4">
				</video>
				<!-- 비디오 위에 텍스트 영역 -->
				<div class="overlay-text">
					<h2 class="fade-in"
						style="font-size: 40px; margin-bottom: 10px; text-shadow: -0.2px 0 #D3D3D3, 0 0.2px #D3D3D3, 0.2px 0 #D3D3D3, 0 -0.2px #D3D3D3;">지속
						가능한 건축을 위한 혁신</h2>
					<h2 class="fade-in"
						style="font-size: 60px; margin-bottom: 10px; text-shadow: -0.2px 0 #D3D3D3, 0 0.2px #D3D3D3, 0.2px 0 #D3D3D3, 0 -0.2px #D3D3D3;">GreenSolution</h2>
					<p class="fade-in"
						style="font-size: 20px; margin-bottom: 10px; text-shadow: -0.2px 0 #D3D3D3, 0 0.2px #D3D3D3, 0.2px 0 #D3D3D3, 0 -0.2px #D3D3D3;">우리는
						건축 자재의 탄소 배출량을 분석하여 환경에 부담을 덜어주는 솔루션을 제공합니다.</p>
					<p class="fade-in"
						style="font-size: 20px; margin-bottom: 10px; text-shadow: -0.2px 0 #D3D3D3, 0 0.2px #D3D3D3, 0.2px 0 #D3D3D3, 0 -0.2px #D3D3D3;">기술과
						지속 가능성이 결합된 우리의 노력으로, 더 나은 내일을 만듭니다.</p>
				</div>
			</header>
		</section>

		<section class="section" id="services">
			<div class="card-container d-flex justify-content-center"
				style="margin-bottom: 150px;">
				<div class="card me-3" style="flex: 1; max-width: 500px;">
					<img
						src="${pageContext.request.contextPath}/resources/image/nature_co2_image.png"
						class="card-img-top" alt="Nature Build"
						style="width: 100%; height: 300px;">
					<div class="card-body">
						<h3 class="card-title">온실가스 및 건축</h3>
						<p class="card-text">온실가스 차트 & 건축 기사</p>
						<a href="${pageContext.request.contextPath}/gasChartView"
							class="btn btn-success">더 알아보기</a>
					</div>
				</div>
				<div class="card me-3" style="flex: 1; max-width: 500px;">
					<img
						src="${pageContext.request.contextPath}/resources/image/nature_build.png"
						class="card-img-top" alt="Nature co2 image"
						style="width: 100%; height: 300px;">
					<div class="card-body">
						<h3 class="card-title">탄소중립포인트 참여현황</h3>
						<p class="card-text">광역시도별 & 기초단체별 차트</p>
						<a href="${pageContext.request.contextPath}/cityChartView"
							class="btn btn-success">더 알아보기</a>
					</div>
				</div>
			</div>
		</section>

		<section class="section" id="contact">
			<h2>문의</h2>
			<p>궁금하신 사항이 있으시면 언제든지 연락해 주세요.</p>
		</section>
	</div>
	
	 <!-- 챗봇 아이콘 -->
    <div class="chatbot-icon"></div>

<!-- 챗봇 인터페이스 -->
<div class="chatbot-interface">
    <div class="chatbot-header">
        <span>Chatbot</span>
        <span class="close-btn">&times;</span>
    </div>
    <div class="chatbot-content">
        <!-- 기본 안내 메시지 -->
        <div class="bot-message">안녕하세요! 무엇을 도와드릴까요?</div>
    </div>
<!-- 챗봇 입력 영역 -->
<div class="chatbot-footer">
    <input type="text" id="chatbotInput" placeholder="메시지를 입력하세요...">
</div>
</div>


	<!-- 푸터 -->
	<footer>
		<p>© 2024 Company Name. All Rights Reserved.</p>
	</footer>




<script>
$(document).ready(function() {
    const isChatbotOpen = localStorage.getItem("isChatbotOpen") === "true";
    if (isChatbotOpen) {
        $('.chatbot-interface').show();
    } else {
        $('.chatbot-interface').hide();
    }

    $('.chatbot-icon').on('click', function() {
        $('.chatbot-interface').toggle();
        localStorage.setItem("isChatbotOpen", $('.chatbot-interface').is(':visible'));
    });

    $('.close-btn').on('click', function() {
        $('.chatbot-interface').hide();
        localStorage.setItem("isChatbotOpen", "false");
    });

    // 초기 메시지 설정
    displayMessage("안녕하세요! 무엇을 도와드릴까요?", "bot");

    // 채팅 메시지 화면에 표시하는 함수
    function displayMessage(message, sender) {
        const messageClass = sender === "user" ? "user-message" : "bot-message";
        const messageElement = `<div class="${messageClass}">${message}</div>`;
        $(".chatbot-content").append(messageElement);
        $(".chatbot-content").scrollTop($(".chatbot-content")[0].scrollHeight);
        console.log(`displayMessage 호출됨. sender: ${sender}, message: ${message}`);
    }

    // 사용자가 메시지 입력 후 Enter 키를 누르면 메시지 전송
    $("#chatbotInput").on("keyup", function(e) {
        if (e.key === "Enter") {
            const userMessage = $(this).val(); // 텍스트 필드의 값을 가져오기
            console.log(`사용자가 입력한 메시지 (원본): ${userMessage}`);
            const trimmedMessage = userMessage.trim();
            console.log(`사용자가 입력한 메시지 (공백 제거): ${trimmedMessage}`);
            
            if (trimmedMessage) {
                displayMessage(trimmedMessage, "user"); // 사용자의 메시지를 화면에 표시
                $(this).val(""); // 입력 필드 초기화
            } else {
                console.warn("입력된 메시지가 없습니다.");
            }
        }
    });
});
</script>





	<!-- slick 슬라이드와 jQuery -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<script>
$(document).ready(function() {
    // 가로 슬라이더 설정 (자동재생 비활성화)
    $('.horizontal-slider').slick({
        dots: true,
        infinite: true,
        speed: 500,
        slidesToShow: 1,
        autoplay: false, // 자동 재생 끄기
        arrows: false
    });

    // 세로 슬라이더 설정 (자동재생 비활성화)
    $('.vertical-slider').slick({
        dots: false,
        infinite: false,
        speed: 500,
        slidesToShow: 1,
        vertical: true,
        verticalSwiping: true,
        arrows: false,
        swipeToSlide: true,
        autoplay: false // 자동 재생 끄기
    });

    // 사이드 네비게이션 클릭 시 섹션 이동
    $('.side-nav a').on('click', function(e) {
        e.preventDefault();
        const sectionID = $(this).attr('href');
        const sectionIndex = $(sectionID).index('.vertical-slider .section');
        $('.vertical-slider').slick('slickGoTo', sectionIndex);
    });

    // 세로 슬라이더와 사이드 네비게이션 동기화
    $('.vertical-slider').on('afterChange', function(event, slick, currentSlide) {
        $('.side-nav a').removeClass('active');
        $('.side-nav a').eq(currentSlide).addClass('active');
    });

    // 마우스 휠로 세로 슬라이더 수동 이동
    $(window).on('wheel', function(event) {
        if (event.originalEvent.deltaY < 0) {
            $('.vertical-slider').slick('slickPrev');
        } else {
            $('.vertical-slider').slick('slickNext');
        }
    });
});


</script>

</body>
</html>
