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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR:wght@100..900&family=Orbit&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
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
}

.navi-navbar-brand {
	color: black;
	font-size: 24px;
	font-weight: bold;
	text-decoration: none;
	margin-right: 30px;
	margin-left: 180px;
}

.navi-navbar-brand:hover {
	color: black;
}

.nav-wrapper {
	display: flex;
	justify-content: center;
	flex: 1;
}

.navi-navbar-nav{
	list-style: none;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	margin: 0;
	padding: 0;
	width: 1000px; /* 상단 메뉴와 드롭다운 메뉴 동일한 너비 */
	gap: 100px; /* 동일한 간격 */
}

.navi-dropdown-inner {
	list-style: none;
	display: flex;
	flex-direction: row;
	justify-content: center;
	margin: 0;
	padding: 0;
	width: 1000px; /* 상단 메뉴와 드롭다운 메뉴 동일한 너비 */
	gap: 100px; /* 동일한 간격 */
	margin-left: 15px;
}

.navi-nav-item,
.navi-dropdown-content {
	text-align: center;
	width: 150px; /* 동일한 너비 */
}

.navi-nav-link,
.navi-dropdown-item {
	color: black;
	text-decoration: none;
	padding: 8px 12px;
	font-size: 18px;
	font-family: "Noto Sans KR", sans-serif;
	transition: color 0.3s, background-color 0.3s;
	display: block;
	width: 170px; /* 동일한 크기 */
}

.navi-nav-link:hover, 
.navi-dropdown-item:hover, 
.navi-active {
	color: red;
	box-shadow: inset 0 -1px 0 red;
	background-color: rgba(0, 0, 0, 0.05);
}

/* 드롭다운 전체 영역 */
.navi-dropdown-field {
	display: none;
	width: 100%; /* 전체 화면 너비 */
	background-color: white;
	padding: 10px 0;
	border-top: 1px solid grey;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	z-index: 500;
	position: absolute;
	top: 100%;
	left: 0;
}

.navi-navbar:hover .navi-dropdown-field {
	display: flex;
	justify-content: center; /* 중앙 정렬 */
}

/* 로그인/회원가입 메뉴 */
.navi-navbar-right {
	display: flex;
	align-items: center;
	gap: 10px;
	margin-left: 50px;
	text-algin: center;
}

/* 오버레이 기본 스타일 */
.overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100vh;
	background-color: rgba(0, 0, 0, 0.2);
	display: none;
	z-index: 500;
}

.navi-navbar:hover ~ .overlay {
	display: block;
}
</style>
</head>
<body>
	<nav class="navi-navbar">
		<a class="navi-navbar-brand" href="${pageContext.request.contextPath}/">
			<i class="fas fa-leaf"></i> Green Solution
		</a>
		<div class="nav-wrapper">
			<ul class="navi-navbar-nav">
				<li class="navi-nav-item"><a href="${pageContext.request.contextPath}/mypage" class="navi-nav-link">마이</a></li>
				<li class="navi-nav-item"><a href="${pageContext.request.contextPath}/noticeBoardView" class="navi-nav-link">게시판</a></li>
				<li class="navi-nav-item"><a href="${pageContext.request.contextPath}/infoBoardView" class="navi-nav-link">제로에너지 건축물</a></li>
				<li class="navi-nav-item"><a href="${pageContext.request.contextPath}/faq/view" class="navi-nav-link">고객지원</a></li>
			</ul>
		</div>
		<div class="navi-navbar-right">
			<c:choose>
				<c:when test="${not empty sessionScope.login}">
					<a href="${pageContext.request.contextPath}/memEditView" class="navi-nav-link">${sessionScope.login.getMemName()} 님</a>
					<a href="${pageContext.request.contextPath}/logout" class="navi-nav-link">로그아웃</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/loginView" class="navi-nav-link">로그인</a>
					<a href="${pageContext.request.contextPath}/agreementView" class="navi-nav-link">회원가입</a>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- 드롭다운 -->
		<div class="navi-dropdown-field">
			<ul class="navi-dropdown-inner">
				<li class="navi-dropdown-content">
					<a href="${pageContext.request.contextPath}/mypage" class="navi-dropdown-item">마이페이지</a>
					<a href="${pageContext.request.contextPath}/memEditView" class="navi-dropdown-item">회원정보수정</a>
					<a href="${pageContext.request.contextPath}/electricityUseView" class="navi-dropdown-item">전기사용량</a>
					<a href="${pageContext.request.contextPath}/ocrView" class="navi-dropdown-item">전기 사용량 기입</a>
				</li>
				<li class="navi-dropdown-content">
					<a href="${pageContext.request.contextPath}/noticeBoardView" class="navi-dropdown-item">공지사항</a>
					<a href="${pageContext.request.contextPath}/reviewView" class="navi-dropdown-item">리뷰게시판</a>
					<a href="${pageContext.request.contextPath}/productView" class="navi-dropdown-item">에너지 효율 제품 게시판</a>
				</li>
				<li class="navi-dropdown-content">
					<a href="${pageContext.request.contextPath}/infoBoardView" class="navi-dropdown-item">에너지 관련 정보</a>
					<a href="${pageContext.request.contextPath}/inputView" class="navi-dropdown-item">제로 에너지 건축물 등급 측정</a>
					<a href="${pageContext.request.contextPath}/mapView" class="navi-dropdown-item">지도 상세보기</a>
				</li>
				<li class="navi-dropdown-content">
					<a href="${pageContext.request.contextPath}/faq/view" class="navi-dropdown-item">자주 묻는 질문</a>
					<a href="${pageContext.request.contextPath}/chatListView" class="navi-dropdown-item">챗봇상담</a>
					<a href="#" class="navi-dropdown-item">이용 가이드</a>
					<a href="${pageContext.request.contextPath}/proposal/view" class="navi-dropdown-item">건의사항</a>
				</li>
			</ul>
		</div>
	</nav>
	<div class="overlay"></div>
	<script type="text/javascript">
		let v_memId = '${sessionScope.login.getMemId()}'
		console.log(v_memId)
		
		if(v_memId){
			let timeoutTimer;
			
			// 세션 타임아웃을 감지하고 타이머를 설정하는 함수
			function resetSessionTimeout() {
			    clearTimeout(timeoutTimer);  // 기존 타이머 취소
			    timeoutTimer = setTimeout(function() {
			        logoutSession();
			    },  60*30 * 1000); // 30분 후 세션 만료 (30분 = 30 * 60 * 1000ms)
		
			    // 세션 연장 요청을 서버로 보냄 (세션 타임아웃 갱신)
			    keepSessionAlive();
			}
		
			// 세션 연장 요청 함수
			function keepSessionAlive() {
			    let v_ajax = new XMLHttpRequest();
			    v_ajax.open('GET', '${pageContext.request.contextPath}/keep-session-alive', true);  // 서버에 세션 연장 요청
			    v_ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			    v_ajax.onreadystatechange = function() {
			        if (v_ajax.readyState === 4 && v_ajax.status === 200) {
			        } else if (v_ajax.readyState === 4) {
			            console.error("세션 연장 실패");
			        }
			    };
			    v_ajax.send();
			}
			
			
			// 세션 타임아웃 후 로그아웃 처리
			function logoutSession() {
			    var v_ajax = new XMLHttpRequest();
			    v_ajax.open('POST', '${pageContext.request.contextPath}/sessionOut', true);  // 로그아웃 처리
			    v_ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			    v_ajax.onreadystatechange = function() {
			        if (v_ajax.readyState === 4 && v_ajax.status === 200) {
			            // 로그아웃 성공 시 로그인 페이지로 이동
			            window.location.href = '${pageContext.request.contextPath}/loginView';
			            alert("세션이 만료되었습니다. 로그아웃됩니다.");
			        } else if (v_ajax.readyState === 4) {
			            console.error("로그아웃 실패");
			        }
			    };
			    v_ajax.send('memId=' + v_memId);
			}

			
		
			// 사용자의 마우스나 키보드 입력을 감지하여 타이머 리셋
			document.addEventListener('mousemove', resetSessionTimeout);  // 마우스 움직임 감지
			document.addEventListener('keydown', resetSessionTimeout);    // 키보드 입력 감지
		
			// 초기 타이머 시작
			resetSessionTimeout();
		}
		
	
	</script>
	
</body>
</html>


