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
    /* 상세 메뉴 바 스타일 */
    .sub-nav-bar {
        background-color: #0056b3;
        margin-top: 20px;
        display: flex;
    }
    .sub-nav-list {
        list-style: none;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: start;
        width: 30%;
    }
    .sub-nav-item {
        flex: 1;
        text-align: start;
        position: relative;
        padding: 0px 0;
        text-decoration: none;
    }
    .sub-nav-item:first-child {
        background-color: #004080;
        height: 100%;
    }
    .sub-nav-item:last-child {
        background-color: #0066cc;
    }
    .sub-nav-item > a {
        color: white !important;
        text-decoration: none !important;
        font-size: 20px;
        padding: 20px 15px;
        display: flex;
        align-items: center;
    }
    .sub-nav-item > a:hover {
        text-decoration: none !important;
        color: white !important;
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
<script>
$(document).ready(function() {
    $(".sub-nav-item a.active").on("click", function(e) {
        e.preventDefault();
        var parent = $(this).closest(".sub-nav-item");

        if (parent.hasClass("show")) {
            parent.find(".dropdown-menu").css({
                "max-height": "0",
                "opacity": "0",
                "padding": "0"
            });
            setTimeout(function() {
                parent.removeClass("show");
                parent.find(".dropdown-menu").css("display", "none");
            }, 300);
        } else {
            $(".sub-nav-item").not(parent).removeClass("show")
                .find(".dropdown-menu").css({
                "max-height": "0",
                "opacity": "0",
                "padding": "0"
            }).hide();

            parent.addClass("show");
            parent.find(".dropdown-menu").css("display", "block");
            setTimeout(function() {
                parent.find(".dropdown-menu").css({
                    "max-height": "500px",
                    "opacity": "1",
                    "padding": "15px 0"
                });
            }, 0);
        }
    });
});
</script>
</head>
<body>

<!-- Navigation START -->
<%@ include file="/WEB-INF/inc/top.jsp"%>
<!-- Navigation END -->

<!-- 상세 메뉴 바 -->
<div class="sub-nav-bar">
    <div class="container d-flex justify-content-start align-items-center">
        <ul class="sub-nav-list">
            <li class="sub-nav-item"><a href="#">지도</a></li>
            <li class="sub-nav-item"><a href="#" class="active">메뉴<span class="arrow-icon">&#9662;</span></a>
                <div class="dropdown-menu">
                    <a href="#" class="dropdown-item">제로 에너지 건축물 등급 측정</a>
                    <a href="#" class="dropdown-item">지도 상세보기</a>
                    <a href="#" class="dropdown-item">에너지 관련 정보</a>
                </div>
            </li>
        </ul>
    </div>
</div>

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
