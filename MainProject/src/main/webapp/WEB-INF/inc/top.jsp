<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Green Solution</title>
    
    <!-- CSS 및 폰트 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <style type="text/css">
        /* 기본 설정 */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            padding-top: 50px; /* Navbar 높이에 맞춰 여백 설정 */
        }

        /* 브랜드 스타일 (Green Solution) */
        .navbar-brand {
            color: black !important; /* 항상 검정색 글씨 */
            text-decoration: none;
        }
        .navbar-brand:hover {
            color: black; /* hover 시에도 검정색 유지 */
            background-color: transparent; /* 배경색 없음 */
        }

        /* 네비게이션바 스타일 */
        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
            padding: 14px 20px;
            background-color: white; /* 기본 배경색 */
            transition: background-color 0.3s, color 0.3s;
            border-bottom: 1px solid grey;
        }
        .navbar.scrolled {
            background-color: rgba(255, 255, 255, 1); /* 스크롤 시 배경색 */
            color: black; /* 스크롤 시 글자색 */
        }

        /* 네비게이션 링크 스타일 */
        .navbar a {
            color: black; /* 기본 글자 색상 */
            text-decoration: none;
            transition: color 0.3s;
        }
        .navbar.scrolled a {
            color: black !important; /* 스크롤 시 링크 글자색 유지 */
        }

        /* 링크 hover 스타일 */
        .navbar-nav .nav-item .nav-link:hover {
            background-color: black; /* 배경 검정색 */
            color: white; /* 글씨 흰색 */
            border-radius: 5px;
        }

        /* 네비게이션바 전체 hover */
        .navbar:hover {
            background-color: rgba(255, 255, 255, 1); /* 배경 유지 */
            color: black; /* 글자색 유지 */
        }

        /* active 상태 링크 */
        .active {
            background-color: black; /* 강조 색상 */
            border-radius: 5px;
        }

        /* 네비게이션 메뉴 스타일 */
        .navbar-nav {
            display: flex; /* 수평 나열 */
            padding: 0;
            margin: 0;
            list-style: none;
        }
        .navbar-nav .nav-item {
            margin-left: 15px; /* 항목 간격 */
        }

        /* 프로필 이미지 */
        .prof-img-small {
            height: 30px;
            width: 30px;
            border-radius: 50%;
            margin-right: 5px;
        }

        /* 네비게이션 항목 정렬 */
        .nav-item {
            display: flex;
            align-items: center;
            margin-left: 15px;
            line-height: 1.5;
        }
    </style>

    <script>
        // 스크롤에 따른 네비게이션 배경색 변화
        window.addEventListener('scroll', function() {
            const navbar = document.querySelector('.navbar');
            if (window.scrollY > 50) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }
        });

        // 현재 페이지 탭 강조 표시
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
    <!-- 네비게이션바 -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                <i class="fas fa-leaf"></i> Green Solution
            </a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-3 mb-lg-0 ml-2">
                    <c:if test="${not empty sessionScope.login && sessionScope.login.getMemId() != 'admin'}">
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/memEditView">${sessionScope.login.getMemName()} 님</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/boardView">견적 요청</a></li>
                    </c:if>
                    <c:if test="${not empty sessionScope.login && sessionScope.login.getMemId() == 'admin'}">
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/adminpage">관리자페이지</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/memEditView">${sessionScope.login.getMemName()} 님</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/boardViewAdmin">견적내역관리</a></li>
                    </c:if>
                    <c:if test="${empty sessionScope.login}">
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/loginView">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/agreementView">회원가입</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>
