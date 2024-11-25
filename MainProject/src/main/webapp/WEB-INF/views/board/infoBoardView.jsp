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
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f9;
    }
    .info-container {
        max-width: 1400px;
        margin: 20px auto;
        padding: 20px;
        background-color: white;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .section-title {
        font-size: 28px;
        color: #333;
        text-align: center;
        margin-bottom: 20px;
    }
    .info-boxes {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
        gap: 20px;
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

    /* 드롭다운 메뉴 스타일 */
    .dropdown-menu {
        display: none;
        position: absolute;
        top: 100%;
        left: 0;
        background-color: white;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.25);
        width: 250px;
        padding: 0;
        z-index: 1000;
        border-radius: 3px;
        max-height: 0;
        overflow: hidden;
        opacity: 0;
        transition: max-height 0.5s ease, opacity 0.5s ease, padding 0.5s ease;
    }
    .dropdown-item {
        color: black !important;
        padding: 15px 30px;
        text-decoration: none !important;
        display: block;
        font-size: 20px;
        transition: background-color 0.3s ease;
    }
    .dropdown-item:hover {
        font-weight: bold;
        background-color: #f0f0f0 !important;
        color: black !important;
    }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>

<!-- Navigation START -->
<%@ include file="/WEB-INF/inc/top.jsp"%>
<!-- Navigation END -->

<!-- 상세 메뉴 바 -->
<%@ include file="/WEB-INF/inc/subnavbarMap.jsp"%>

<div class="info-container">
    <div class="section-title">관련정보</div>
    <div class="info-boxes">
        <div class="info-box" style="background-image: url('${pageContext.request.contextPath}/resources/image/example1.jpg');">
            <div class="overlay">
                <h3>정보 제목 1</h3>
                <p>설명 1</p>
            </div>
        </div>
        <div class="info-box" style="background-image: url('${pageContext.request.contextPath}/resources/image/example2.jpg');">
            <div class="overlay">
                <h3>정보 제목 2</h3>
                <p>설명 2</p>
            </div>
        </div>
    </div>
</div>

<footer class="footer py-5 bg-dark">
    <p class="m-0 text-center text-white">Copyright &copy; 2024 GreenSolution</p>
</footer>

</body>
</html>
