<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Green Solution</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style type="text/css">
body {
	margin: 0;
	font-family: Arial, sans-serif;
	padding-top: 70px; /* Navbar 높이에 맞춰 여백 설정 */
}

.navbar-brand {
	color: black; /* 기본 글자 색상 */
	text-decoration: none; /* 밑줄 제거 */
}

.navbar-brand:hover {
	color: black; /* 마우스 오버 시 색상 변경 없음 */
	background-color: transparent; /* 배경 색상 변경 없음 */
}

/* .navbar a:hover 선택자를 수정하여 .navbar-brand에는 영향을 주지 않도록 함 */
.navbar a:hover:not(.navbar-brand) {
	background-color: black; /* 마우스 오버 시 링크 배경 색상 변경 */
	color: white; /* 마우스 오버 시 링크 글자 색상 변경 */
	border-radius: 5px; /* 모서리 둥글게 */
}

.navbar {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	z-index: 1000;
	padding: 14px 20px;
	background-color: white; /* 기본적으로 배경색 없음 */
	transition: background-color 0.3s, color 0.3s;
	border-bottom: 1px solid grey; /* 기본적으로 투명한 테두리 */
}

.navbar.scrolled {
	background-color: rgba(255, 255, 255, 1); /* 스크롤 시 배경 색상 변경 (흰색) */
	color: black; /* 스크롤 시 글자 색상 변경 */
}

.navbar a {
	color: black; /* 기본 글자 색상 */
	text-decoration: none;
	transition: color 0.3s; /* 링크 색상 변화 시 애니메이션 효과 */
}

.navbar.scrolled a {
	color: black; /* 스크롤 시 링크 글자 색상 변경 */
}

.navbar:hover {
	background-color: rgba(255, 255, 255, 1); /* 마우스 오버 시 배경 색상 변경 */
	color: black; /* 마우스 오버 시 글자 색상 변경 */
}

.navbar:hover a {
	color: black; /* 마우스 오버 시 링크 색상 변경 */
}

.active {
	background-color: black; /* 현재 탭 강조 색상 */
	border-radius: 5px; /* 모서리 둥글게 */
}

.navbar-nav {
	display: flex; /* 수평으로 나열 */
	padding: 0; /* 기본 패딩 제거 */
	margin: 0; /* 기본 마진 제거 */
	list-style: none; /* 리스트 스타일 제거 */
}

.navbar-nav .nav-item {
	margin-left: 15px; /* 항목 간의 간격 */
}

.prof-img-small {
    height: 30px; /* 이미지 크기를 줄임 */
    width: 30px;  /* 이미지 크기를 줄임 */
    border-radius: 50%;
    margin-right: 5px; /* 이미지와 텍스트 간의 여백 추가 */
}

.nav-item {
    display: flex; /* 수직 중앙 정렬을 위해 flex 사용 */
    align-items: center; /* 수직 정렬 */
    margin-left: 15px; /* 항목 간의 간격 */
    line-height: 1.5; /* 텍스트 높이 조정 */
}
</style>
<script>
    window.addEventListener('scroll', function() {
        const navbar = document.querySelector('.navbar');
        if (window.scrollY > 50) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    });

    // 현재 탭 강조 표시
    document.addEventListener('DOMContentLoaded', function() {
        const navLinks = document.querySelectorAll('.navbar-nav .nav-link');
        const currentURL = window.location.pathname;

        navLinks.forEach(link => {
            if (link.getAttribute('href') === currentURL) {
                link.classList.add('active');
            }
        });
    });
</script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                <i class="fas fa-leaf"></i> Green Solution
            </a>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-3 mb-lg-0 ml-2">
                    <c:if test="${not empty sessionScope.login && sessionScope.login.getMemId() != 'admin'}">
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/memEditView">
                        	<%-- <img class="prof-img-small" src="${pageContext.request.contextPath}/displayImage?imgName=${sessionScope.login.getMemProfile()}"
								alt="Profile Image"> --%> ${sessionScope.login.getMemName()} 님</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/boardView">견적 요청</a></li>
                    </c:if>
                    <c:if test="${not empty sessionScope.login && sessionScope.login.getMemId() == 'admin'}">
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/adminpage">관리자페이지</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/memEditView">
                        	<%-- <img class="prof-img-small" src="${pageContext.request.contextPath}/displayImage?imgName=${sessionScope.login.getMemProfile()}"
								alt="Profile Image"> --%> ${sessionScope.login.getMemName()} 님</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/boardViewAdmin">견적내역관리</a></li>
                    </c:if>
                    <c:if test="${empty sessionScope.login}">
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/loginView">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/registView">회원가입</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>