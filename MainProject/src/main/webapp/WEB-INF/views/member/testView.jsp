<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KEPCO 스타일 웹사이트</title>
    <link rel="stylesheet" href="style.css">
    
    <style>
    /* 기본 설정 */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

/* 상단 네비게이션 바 */
.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #002f6c;
    padding: 20px;
    color: white;
}

.navbar .logo {
    font-size: 24px;
    font-weight: bold;
}

.nav-links {
    list-style: none;
    display: flex;
    gap: 15px;
}

.nav-links a {
    color: white;
    text-decoration: none;
    font-size: 16px;
}

/* 메인 배너 */
.main-banner {
    background: url('banner-image.jpg') center/cover no-repeat;
    color: white;
    text-align: center;
    padding: 100px 20px;
}

.main-banner h1 {
    font-size: 48px;
    margin-bottom: 20px;
}

.main-banner p {
    font-size: 18px;
    margin-bottom: 30px;
}

.main-btn {
    background-color: #ff4d00;
    border: none;
    padding: 15px 30px;
    font-size: 16px;
    color: white;
    cursor: pointer;
}

/* 서비스 섹션 */
.services {
    display: flex;
    justify-content: space-around;
    padding: 50px 0;
    background-color: #f2f2f2;
}

.service {
    text-align: center;
    width: 30%;
}

.service h2 {
    font-size: 24px;
    margin-bottom: 10px;
}

.service p {
    font-size: 16px;
    color: #333;
}

/* 하단 푸터 */
footer {
    background-color: #002f6c;
    color: white;
    text-align: center;
    padding: 20px;
    font-size: 14px;
}
    
    </style>
    
</head>
<body>
    <header class="navbar">
        <div class="logo">한국전력공사</div>
        <nav>
            <ul class="nav-links">
                <li><a href="#">회사소개</a></li>
                <li><a href="#">사업분야</a></li>
                <li><a href="#">인재채용</a></li>
                <li><a href="#">고객지원</a></li>
                <li><a href="#">IR센터</a></li>
            </ul>
        </nav>
    </header>

    <section class="main-banner">
        <h1>지속 가능한 에너지 미래</h1>
        <p>안정적 전력 공급을 통해 국민과 함께하는 한국전력공사</p>
        <button class="main-btn">자세히 알아보기</button>
    </section>

    <section class="services">
        <div class="service">
            <h2>사업분야</h2>
            <p>한국전력공사의 다양한 사업을 소개합니다.</p>
        </div>
        <div class="service">
            <h2>고객지원</h2>
            <p>고객에게 최고의 서비스를 제공합니다.</p>
        </div>
        <div class="service">
            <h2>IR센터</h2>
            <p>투명한 경영 정보 제공을 목표로 합니다.</p>
        </div>
    </section>

    <footer>
        <p>© 2024 한국전력공사</p>
    </footer>
    
    <script>
    
 // 각 메뉴 링크를 클릭할 때 부드럽게 이동하도록 설정
    document.querySelectorAll('.right-menu a').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const targetId = this.getAttribute('href').substring(1);
            const targetSection = document.getElementById(targetId);
            targetSection.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        });
    });
    </script>
    
</body>
</html>
