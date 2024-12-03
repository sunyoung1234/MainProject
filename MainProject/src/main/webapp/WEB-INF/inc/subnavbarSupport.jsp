<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Support Sub Navbar</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<style>
/* 공통 스타일 */
body {
    font-family: "Noto Sans KR", sans-serif;
    margin: 0;
    padding: 0;
}

.sub-nav-bar {
    background-color: #0056b3;
    display: flex;
    align-items: center;
    padding: 20px 200px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    margin-top: 70px;
}

.sub-nav-list {
    list-style: none;
    margin: 0;
    padding: 0;
    display: flex;
    align-items: center;
    margin-left: 100px
}

.sub-nav-item {
    margin: 0 10px;
}

.sub-nav-item a {
    color: white;
    text-decoration: none;
    font-size: 18px;
    font-weight: bold;
    padding: 10px 15px;
    border-radius: 6px;
    transition: background-color 0.3s ease, color 0.3s ease;
}

.home-link {
    margin-right: 20px;
    font-size: 20px;
    color: white;
    text-decoration: none;
}

.home-link:hover {
    color: rgba(255, 255, 255, 0.8);
}

/* 고객지원 오른쪽 세부 메뉴 */
.support-menu {
    display: flex;
    align-items: center;
    margin-left: 30px; /* 고객지원과 간격 */
}

.support-menu a {
    color: white;
    text-decoration: none;
    font-size: 16px;
    margin-right: 15px;
    padding: 5px 10px;
    border-radius: 4px;
    transition: background-color 0.3s ease, color 0.3s ease;
}

.support-menu a:hover, .support-menu a.active {
    background-color: rgba(255, 255, 255, 0.2);
    color: #fff;
}
</style>
</head>
<body>
    <div class="sub-nav-bar">
        <ul class="sub-nav-list">
            <li class="sub-nav-item"><a href="${pageContext.request.contextPath}/" class="home-link">
                <i class="fas fa-home"></i></a>
            </li>
            <li class="sub-nav-item"><a href="#" class="active">고객지원</a></li>
        </ul>
        <div class="support-menu">
        	<a href="${pageContext.request.contextPath}/noticeBoardView" class="sub-nav-dropdown-item">공지사항</a> 
            <a href="${pageContext.request.contextPath}/faq/view" >자주 묻는 질문</a>
            <a href="${pageContext.request.contextPath}/proposal/view">건의사항</a>
        </div>
    </div>
</body>
</html>