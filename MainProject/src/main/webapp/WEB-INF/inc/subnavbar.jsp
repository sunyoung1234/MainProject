<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sub Navbar</title>
<style>
/* 스타일 그대로 유지 */
body {
    font-family: Arial, sans-serif;
}
.sub-nav-bar {
    background-color: #0056b3;
    margin-top: 20px;
    display: flex;
    padding: 20px 200px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}
.sub-nav-list {
    list-style: none;
    margin: 0;
    padding: 0;
    display: flex;
    align-items: center;
}
.sub-nav-item {
    position: relative;
    margin: 0 10px;
    margin-left: 50px;
    padding: 0px 30px;
}
.sub-nav-item > a {
    color: white;
    text-decoration: none;
    font-size: 18px;
    font-weight: bold;
    padding: 10px 15px;
    border-radius: 6px;
    transition: background-color 0.3s ease, color 0.3s ease;
}
.sub-nav-item > a:hover {
    background-color: rgba(255, 255, 255, 0.2);
    color: #fff;
}
.arrow-icon {
    margin-left: 5px;
    transition: transform 0.3s ease;
}
.sub-nav-item.show .arrow-icon {
    transform: rotate(180deg);
}
/* 드롭다운 메뉴 */
.sub-nav-dropdown-menu {
    position: absolute;
    top: 200%;
    right: 0;
    padding: 0px 10px;
    background-color: white;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
    border-radius: 8px;	
    overflow: hidden;
    opacity: 0;
    visibility: hidden;
    transform: translateY(-20px);
    transition: all 0.3s ease;
    z-index: 1000;
}
.sub-nav-item.show .sub-nav-dropdown-menu {
    opacity: 1;
    visibility: visible;
    transform: translateY(0);
}
.sub-nav-dropdown-item {
    display: block;
    padding: 12px 10px;
    text-decoration: none;
    color: #333;
    font-size: 16px;
    transition: background-color 0.3s ease, color 0.3s ease;
}
.sub-nav-dropdown-item:hover {
    background-color: #f5f5f5;
    color: #0056b3;
}
.sub-nav-dropdown-item:not(:last-child) {
    border-bottom: 1px solid #eaeaea;
}
</style>
</head>
<body>
<%
    // 현재 URL 가져오기
    String currentPath = request.getRequestURI();
    String contextPath = request.getContextPath();
%>
<div class="sub-nav-bar">
    <ul class="sub-nav-list">
        <li class="sub-nav-item">
            <a href="#" class="active">
                <!-- 메뉴 이름 동적 설정 -->
                <c:choose>
                    <c:when test="${currentPath.contains(contextPath + '/mypage') || currentPath.contains(contextPath + '/memEditView') || currentPath.contains(contextPath + '/electricityUseView')}">
                        마이
                    </c:when>
                    <c:when test="${currentPath.contains(contextPath + '/noticeBoardView') || currentPath.contains(contextPath + '/reviewView')}">
                        게시판
                    </c:when>
                    <c:when test="${currentPath.contains(contextPath + '/inputView') || currentPath.contains(contextPath + '/mapView')}">
                        지도
                    </c:when>
                    <c:otherwise>
                        고객지원
                    </c:otherwise>
                </c:choose>
                <span class="arrow-icon">&#9662;</span>
            </a>
            <div class="sub-nav-dropdown-menu">
                <!-- 드롭다운 메뉴 동적 설정 -->
                <c:choose>
                    <c:when test="${currentPath.contains(contextPath + '/mypage') || currentPath.contains(contextPath + '/memEditView') || currentPath.contains(contextPath + '/electricityUseView')}">
                        <a href="${contextPath}/mypage" class="sub-nav-dropdown-item">마이페이지</a>
                        <a href="${contextPath}/memEditView" class="sub-nav-dropdown-item">회원정보수정</a>
                        <a href="${contextPath}/electricityUseView" class="sub-nav-dropdown-item">전기사용량</a>
                        <a href="${contextPath}/ocrView" class="sub-nav-dropdown-item">전기 사용량 기입</a>
                    </c:when>
                    <c:when test="${currentPath.contains(contextPath + '/noticeBoardView') || currentPath.contains(contextPath + '/reviewView')}">
                        <a href="${contextPath}/noticeBoardView" class="sub-nav-dropdown-item">공지사항</a>
                        <a href="${contextPath}/reviewView" class="sub-nav-dropdown-item">리뷰게시판</a>
                        <a href="${contextPath}/freeBoardView" class="sub-nav-dropdown-item">자유게시판</a>
                        <a href="${contextPath}/productView" class="sub-nav-dropdown-item">에너지 효율 제품 게시판</a>
                    </c:when>
                    <c:when test="${currentPath.contains(contextPath + '/inputView') || currentPath.contains(contextPath + '/mapView')}">
                        <a href="${contextPath}/inputView" class="sub-nav-dropdown-item">제로 에너지 건축물 등급 측정</a>
                        <a href="${contextPath}/mapView" class="sub-nav-dropdown-item">지도 상세보기</a>
                        <a href="${contextPath}/infoBoardView" class="sub-nav-dropdown-item">에너지 관련 정보</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${contextPath}/chatListView" class="sub-nav-dropdown-item">챗봇 상담</a>
                        <a href="${contextPath}/faq/view" class="sub-nav-dropdown-item">자주 묻는 질문</a>
                        <a href="${contextPath}/guideView" class="sub-nav-dropdown-item">이용 가이드</a>
                        <a href="${contextPath}/proposal/view" class="sub-nav-dropdown-item">건의사항</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </li>
    </ul>
</div>

<script>
// 기존 드롭다운 스크립트 유지
document.addEventListener("DOMContentLoaded", function () {
    const dropdownToggles = document.querySelectorAll(".sub-nav-item > a.active");

    dropdownToggles.forEach((toggle) => {
        toggle.addEventListener("click", function (e) {
            e.preventDefault();
            const parentItem = this.closest(".sub-nav-item");

            const isOpen = parentItem.classList.contains("show");
            document.querySelectorAll(".sub-nav-item").forEach((item) => {
                item.classList.remove("show");
            });

            if (!isOpen) {
                parentItem.classList.add("show");
            }
        });
    });

    document.addEventListener("click", function (e) {
        if (!e.target.closest(".sub-nav-item")) {
            document.querySelectorAll(".sub-nav-item").forEach((item) => {
                item.classList.remove("show");
            });
        }
    });
});
</script>
</body>
</html>
