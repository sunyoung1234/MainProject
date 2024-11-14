<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Green Solution</title>
<!-- CSS 및 폰트 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<!-- Google Fonts 추가 -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR:wght@100..900&family=Orbit&display=swap"
	rel="stylesheet">
<!-- Bootstrap CSS 수정 링크 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<style>
/* 기본 설정 */
body {
	margin: 0;
	font-family: Arial, sans-serif;
	padding-top: 50px;
}

/* 네비게이션바 스타일 */
.navi-navbar {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	background-color: white;
	border-bottom: 1px solid grey;
	padding: 14px 20px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	z-index: 1000;
	flex-wrap: wrap;
}

.navi-navbar-brand {
	color: black;
	font-size: 24px;
	font-weight: bold;
	text-decoration: none;
	margin-right: 30px;
}

.navi-navbar-brand:hover {
	color: black;
}
/* 네비게이션 메뉴를 중앙에 고정 */
.nav-wrapper {
	display: flex;
	justify-content: center;
	flex: 1;
}
/* 네비게이션 메뉴 */
.navi-navbar-nav {
	list-style: none;
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: center;
	margin: 0;
	padding: 0;
	gap: 150px;
	flex: 1;
}

.navi-nav-item {
	position: relative;
	text-align: center;
}

.navi-nav-link {
	color: black;
	text-decoration: none;
	padding: 8px 12px;
	display: block;
	font-size: 18px;
	transition: color 0.3s;
	font-family: "Noto Sans KR", sans-serif;
}

.navi-nav-link:hover, .navi-active {
	color: red;
	box-shadow: inset 0 -1px 0 red; /* 내부에 밑줄 효과 */
}

/* 드롭다운 전체 영역 */
.navi-dropdown-field {
	display: none;
	width: 100%;
	background-color: white;
	padding: 0px 0;
	border-top: 1px solid grey;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	z-index: 500;
	position: absolute;
	top: 100%;
	left: 0;
}

.center-text {
	text-align: center;
}
/* navbar에 hover 시 dropdown-field 표시 */
.navi-navbar:hover .navi-dropdown-field {
	display: flex;
	justify-content: start;
}

.navi-dropdown-content-1:hover, .navi-dropdown-content-2:hover,
	.navi-dropdown-content-3:hover, .navi-dropdown-content-4:hover {
	background-color: #f1f1f1;
}

/* 각 dropdown-content 위치 조정 */
.navi-dropdown-content-1 {
	margin-left: 30.2%; /* 첫 번째 nav-item에 맞추기 */
	padding-top: 10px;
	text-align
}

.navi-dropdown-content-2 {
	margin-left: 5.5%; /* 두 번째 nav-item에 맞추기 (필요에 따라 조정) */
	padding-top: 10px;
}

.navi-dropdown-content-3 {
	margin-left: 5.25%; /* 세 번째 nav-item에 맞추기 (필요에 따라 조정) */
	margin-right: 4.75%;
	padding-top: 10px;
}

.navi-dropdown-content-4 {
	margin-right: 20%; /* 네 번째 nav-item에 맞추기 (필요에 따라 조정) */
	padding-top: 10px;
}

/* 드롭다운 메뉴 스타일 */
.navi-dropdown-content {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	width: 150px;
}

.navi-dropdown-item {
	color: black;
	padding: 10px 15px;
	text-decoration: none;
	font-size: 16px;
	display: block;
	width: 100%;
	font-family: "Noto Sans KR", sans-serif;
	transition: background-color 0.3s;
}

/* dropdown-item에 마우스 올렸을 때 회색 강조 */
.navi-dropdown-item:hover {
	color: red;
	background-color: rgba(0, 0, 0, 0.1);
}

/* 오른쪽 정렬 */
.navi-navbar-right {
	display: flex;
	align-items: center;
	gap: 15px;
}

/* 오버레이 기본 스타일 */
.overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100vh;
	background-color: rgba(0, 0, 0, 0.2); /* 아주 옅은 검정색 */
	display: none; /* 기본적으로 숨겨둠 */
	z-index: 500; /* 네비게이션보다 아래에 배치 */
}

/* 네비게이션에 hover할 때 오버레이 표시 */
.navi-navbar:hover ~ .overlay {
	display: block;
}

/* 드롭다운 영역과 오버레이가 겹치지 않도록 드롭다운에 z-index 설정 */
.navi-dropdown-field {
	z-index: 600;
}
</style>




</head>
<body>
	<!-- 네비게이션바 -->
	<nav class="navi-navbar">
		<!-- 브랜드 로고 -->
		<a class="navi-navbar-brand"
			href="${pageContext.request.contextPath}/"> <i
			class="fas fa-leaf"></i> Green Solution
		</a>
		<!-- 네비게이션 메뉴 -->
		<!-- 중앙 고정 네비게이션 메뉴 -->
		<div class="nav-wrapper">
			<ul class="navi-navbar-nav">
				<li class="navi-nav-item"><a href="#" class="navi-nav-link">마이</a></li>
				<li class="navi-nav-item"><a href="#" class="navi-nav-link">게시판</a></li>
				<li class="navi-nav-item"><a href="#" class="navi-nav-link">지도</a></li>
				<li class="navi-nav-item"><a href="#" class="navi-nav-link">고객지원</a></li>
			</ul>
		</div>
		<!-- 오른쪽 끝 메뉴 -->
		<div class="navi-navbar-right">
			<c:choose>
				<c:when test="${not empty sessionScope.login}">
					<a href="${pageContext.request.contextPath}/memEditView"
						class="navi-nav-link">${sessionScope.login.getMemName()} 님</a>
					<a href="${pageContext.request.contextPath}/logout"
						class="navi-nav-link">로그아웃</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/loginView"
						class="navi-nav-link">로그인</a>
					<a href="${pageContext.request.contextPath}/agreementView"
						class="navi-nav-link">회원가입</a>
				</c:otherwise>
			</c:choose>
		</div>

		<!-- 드롭다운 전체 영역 -->
		<div class="navi-dropdown-field">
			<!-- 마이 메뉴 dropdown-content -->
			<div class="navi-dropdown-content-1 center-text">
				<a href="${pageContext.request.contextPath}/mypage"
					class="navi-dropdown-item">마이페이지</a> <a
					href="${pageContext.request.contextPath}/memEditView"
					class="navi-dropdown-item">회원정보수정</a> <a href="#"
					class="navi-dropdown-item">전기사용량</a> <a href="#"
					class="navi-dropdown-item">가스사용량</a>
			</div>
			<!-- 게시판 메뉴 dropdown-content -->
			<div class="navi-dropdown-content-2 center-text">
				<a href="#" class="navi-dropdown-item">공지사항</a> <a href="#"
					class="navi-dropdown-item">리뷰게시판</a> <a href="#"
					class="navi-dropdown-item">자유게시판</a>
			</div>
			<!-- 지도 메뉴 dropdown-content -->
			<div class="navi-dropdown-content-3 center-text">
				<a href="#" class="navi-dropdown-item">에너지효율등급</a> <a href="#"
					class="navi-dropdown-item">지도 상세보기</a>
			</div>
			<!-- 고객지원 메뉴 dropdown-content -->
			<div class="navi-dropdown-content-4 center-text">
				<a href="${pageContext.request.contextPath}/chatListView"
					class="navi-dropdown-item">챗봇상담</a> <a href="${pageContext.request.contextPath}/faq/view"
					class="navi-dropdown-item">자주 묻는 질문</a> <a href="#"
					class="navi-dropdown-item">이용 가이드</a><a
					href="${pageContext.request.contextPath}/proposal/view"
					class="navi-dropdown-item">건의사항</a>

			</div>
		</div>
	</nav>
	<div class="overlay"></div>
</body>
</html>
