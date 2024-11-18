<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>자주 묻는 질문</title>
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/css/styles.css">
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />

<style>
/* 스타일 정의 */
.faq-header {
    font-size: 28px;
    font-weight: bold;
    color: #333;
    margin-bottom: 30px;
}

.faq-item {
    border: 1px solid #ddd;
    border-radius: 8px;
    margin-bottom: 15px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    transition: box-shadow 0.3s ease;
}

.faq-item:hover {
    box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.15);
}

.faq-question {
    padding: 15px;
    display: flex;
    align-items: center;
    font-weight: bold;
    cursor: pointer;
}

.faq-icon-q {
    font-size: 20px;
    margin-right: 10px;
    color: #0056b3;
}

.faq-icon-a {
    font-size: 20px;
    margin-right: 10px;
    color: #0056b3;
    font-weight: bold;
}

.faq-answer {
    max-height: 200px; /* 최대 높이 지정 */
    overflow-y: auto; /* 내용이 넘칠 경우 스크롤 */
    margin-top: 10px;
    padding: 0 15px 15px 45px;
    display: none;
    font-size: 15px;
    color: #555;
}

.faq-answer.show {
    display: block;
    animation: smoothExpand 0.5s ease;
}

@keyframes smoothExpand {
    from { max-height: 0; opacity: 0; }
    to { max-height: 200px; opacity: 1; }
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

/* 화살표 아이콘 스타일 */
.arrow-icon {
    margin-left: 5px;
    transition: transform 0.3s ease;
}

.sub-nav-item.show .arrow-icon {
    transform: rotate(180deg); /* 화살표 아래로 향하게 */
}

/* 드롭다운 메뉴 스타일 */
.dropdown-menu {
    display: none; /* 기본적으로 숨김 */
    position: absolute;
    top: 100%;
    left: 0;
    background-color: white;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.25);
    width: 250px;
    padding: 0; /* 패딩을 처음에는 0으로 설정하여 슬라이드 효과를 줌 */
    z-index: 1000;
    border-radius: 3px;
    max-height: 0;
    overflow: hidden;
    opacity: 0;
    transition: max-height 0.5s ease, opacity 0.5s ease, padding 0.5s ease; /* 애니메이션 효과 추가 */
}

/* 드롭다운 아이템 스타일 */
.dropdown-item {
    color: black !important; /* 항상 검정색 글씨 */
    padding: 15px 30px;
    text-decoration: none !important;
    display: block;
    font-size: 20px;
    background-color: transparent !important; /* 기본 배경 투명 */
    transition: background-color 0.3s ease; /* 배경색 전환 애니메이션 */
}

.dropdown-item:hover {
    font-weight: bold;
    background-color: #f0f0f0 !important; /* 마우스 hover 시 옅은 회색 배경 */
    color: black !important; /* 글씨 검정 유지 */
}

.dropdown-item.active {
    font-weight: bold;
    background-color: #f0f0f0 !important; /* 현재 선택된 항목 강조 - 옅은 회색 */
    color: black !important; /* 글씨 검정 유지 */
}

/* 드롭다운이 활성화될 때 스타일 */
.sub-nav-item.show .dropdown-menu {
    display: block; /* 요소를 보이도록 설정 */
    max-height: 500px; /* 드롭다운 메뉴의 최대 높이 */
    opacity: 1;
    padding: 15px 0; /* 활성화 시 원래 패딩으로 돌아감 */
}

</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    // 드롭다운 메뉴 토글
    $(".sub-nav-item a.active").on("click", function(e) {
        e.preventDefault();
        var parent = $(this).closest(".sub-nav-item");

        if (parent.hasClass("show")) {
            // 드롭다운 닫기
            parent.find(".dropdown-menu").css({
                "max-height": "0",
                "opacity": "0",
                "padding": "0"
            });
            setTimeout(function() {
                parent.removeClass("show");
                parent.find(".dropdown-menu").css("display", "none"); // display: none으로 숨기기
            }, 300); // 0.3초 후 display: none 설정
        } else {
            // 다른 메뉴 닫기
            $(".sub-nav-item").not(parent).removeClass("show")
                .find(".dropdown-menu").css({
                "max-height": "0",
                "opacity": "0",
                "padding": "0"
            }).hide();

            // 드롭다운 열기
            parent.addClass("show");
            parent.find(".dropdown-menu").css("display", "block"); // display: block으로 보이기
            setTimeout(function() {
                parent.find(".dropdown-menu").css({
                    "max-height": "500px",
                    "opacity": "1",
                    "padding": "15px 0"
                });
            }, 0); // 애니메이션 시작
        }
    });

    // FAQ 클릭 이벤트
    $(".faq-question").on("click", function() {
        // 답변 요소 찾기
        var answer = $(this).next(".faq-answer");
        // 답변 보이기/숨기기 토글
        answer.toggleClass("show");
    });

    // 다른 곳을 클릭했을 때 드롭다운 메뉴 닫기
    $(document).on("click", function(e) {
        if (!$(e.target).closest(".sub-nav-item").length) {
            $(".sub-nav-item").removeClass("show").find(
                ".dropdown-menu").css({
                "max-height": "0",
                "opacity": "0",
                "padding": "0"
            }).hide();
        }
    });
});
</script>

</head>

<body>

<%@ include file="/WEB-INF/inc/top.jsp"%>

<!-- 상세 메뉴 바 -->
<div class="sub-nav-bar">
    <div class="container d-flex justify-content-start align-items-center">
        <ul class="sub-nav-list">
            <li class="sub-nav-item"><a href="#">고객지원</a></li>
            <li class="sub-nav-item"><a href="#" class="active">자주 묻는
                    질문 <span class="arrow-icon">&#9662;</span>
            </a>
                <div class="dropdown-menu">
                    <a href="#" class="dropdown-item active">자주 묻는 질문</a> <a href="#"
                        class="dropdown-item">챗봇 상담</a> <a href="#" class="dropdown-item">이용
                        가이드</a> <a href="#" class="dropdown-item">건의 사항</a>
                </div></li>
        </ul>
    </div>
</div>

<!-- ChatBot START -->
<%@ include file="/WEB-INF/inc/chatbot.jsp"%>
<!-- ChatBot END -->

<main class="container my-5 faq-container-box">
    <h1 class="text-center faq-header mb-5"
        style="margin-top: 50px; font-size: 32px;">자주 묻는 질문</h1>

    <div id="faqAccordion" style="margin-top: 100px;">
        <c:forEach var="faq" items="${faqList}">
            <div class="faq-item">
                <div class="faq-question" data-target="#answer${faq.faqId}">
                    <span class="faq-icon-q">Q</span> <span>${faq.question}</span>
                </div>
                <div id="answer${faq.faqId}" class="faq-answer">
                    <span class="faq-icon-a">A</span> <span>${faq.answer}</span>
                </div>
            </div>
        </c:forEach>
    </div>
</main>

<%@ include file="/WEB-INF/inc/footer.jsp"%>

</body>
</html>
