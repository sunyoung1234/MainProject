<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Chatbot Interface</title>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
/* 챗봇 아이콘 스타일 */
.chatbot-icon {
    position: fixed;
    bottom: 20px;
    right: 20px;
    width: 60px;
    height: 60px;
    background-image: url('${pageContext.request.contextPath}/resources/image/챗봇아이콘.png');
    background-size: cover;
    background-position: center;
    cursor: pointer;
    z-index: 1000;
    transition: transform 0.3s ease;
}
.chatbot-icon:hover {
    transform: scale(1.1);
}

/* 챗봇 인터페이스 스타일 */
.chatbot-interface {
    position: fixed;
    bottom: 90px;
    right: 20px;
    width: 320px;
    height: 450px;
    background-color: #f9f9f9;
    border-radius: 15px;
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
    display: flex;
    flex-direction: column;
    opacity: 0;
    transform: translateY(20px);
    transition: opacity 0.3s ease, transform 0.3s ease;
    z-index: 1000;
}

.chatbot-interface.show {
    opacity: 1;
    transform: translateY(0);
}

/* 챗봇 헤더 스타일 */
.chatbot-header {
    background-color: #4A90E2;
    color: white;
    padding: 12px;
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-weight: bold;
    font-size: 16px;
}

.chatbot-header .close-btn {
    cursor: pointer;
    font-size: 22px;
}

/* 챗봇 콘텐츠 영역 스타일 */
.chatbot-content {
    flex-grow: 1;
    padding: 12px;
    overflow-y: auto;
    font-size: 15px;
    display: flex;
    flex-direction: column;
    gap: 10px;
}

/* 사용자와 봇의 메시지 스타일 */
.user-message, .bot-message {
    padding: 10px 15px;
    margin: 5px;
    border-radius: 12px;
    max-width: 80%;
    word-wrap: break-word;
}

.user-message {
    background-color: #dcf8c6;
    text-align: right;
    align-self: flex-end;
}

.bot-message {
    background-color: #f1f0f0;
    text-align: left;
    align-self: flex-start;
}

.menu-btn {
    background-color: #e7f3ff;
    color: #4A90E2;
    border: none;
    border-radius: 8px;
    padding: 8px 12px;
    margin: 5px 0;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s;
}

.menu-btn:hover {
    background-color: #d0e8ff;
}
</style>
</head>
<body>
    <!-- 현재 로그인한 사용자 아이디를 JavaScript 변수로 전달 -->
    <script>
        const loginId = "${sessionScope.login != null ? sessionScope.login.memId : ''}";
        const loginName = "${sessionScope.login != null ? sessionScope.login.memName : ''}";
    </script>

    <!-- 챗봇 아이콘 -->
    <div class="chatbot-icon"></div>

<!-- 챗봇 인터페이스 -->
<div class="chatbot-interface">
    <div class="chatbot-header">
        <span>Chatbot</span> <span class="close-btn">&times;</span>
    </div>
    <div class="chatbot-content">
        <!-- 초기 메시지와 메인 메뉴 버튼 -->
        <div class="bot-message">안녕하세요! 무엇을 도와드릴까요?</div>
        <div class="bot-message">
            <button class="menu-btn" data-menu="quick-move">페이지 빠른 이동</button>
            <button class="menu-btn" data-menu="faq">FAQ</button>

            <!-- 관리자인 경우에만 관리자 상담 연결 버튼 추가 -->
            <c:if test="${sessionScope.login != null && sessionScope.login.memId eq 'admin'}">
                <button class="menu-btn" data-menu="admin-chat">사용자 상담 연결</button>
            </c:if>
            <!-- 일반 사용자에게 상담사 연결 버튼 추가 -->
            <c:if test="${sessionScope.login != null && sessionScope.login.memId ne 'admin'}">
                <button class="menu-btn" data-menu="connect-agent">상담사 연결</button>
            </c:if>
        </div>
    </div>
</div>

<script>
$(document).ready(function() {
    // 챗봇 인터페이스 토글
    $('.chatbot-interface').hide();
    $('.chatbot-icon').on('click', function() {
        $('.chatbot-interface').toggleClass('show').toggle();
    });
    $('.close-btn').on('click', function() {
        $('.chatbot-interface').removeClass('show').hide();
    });

    // 메인 메뉴 표시 함수
    function displayMainMenu() {
        var mainMenuHtml = '<div class="bot-message">안녕하세요! 무엇을 도와드릴까요?</div>' +
            '<div class="bot-message">' +
            '<button class="menu-btn" data-menu="quick-move">페이지 빠른 이동</button>' +
            '<button class="menu-btn" data-menu="faq">FAQ</button>';
        
        if (loginId === "admin") {
            mainMenuHtml += '<button class="menu-btn" data-menu="admin-chat">사용자 상담 연결</button>';
        } else if (loginId) {
            mainMenuHtml += '<button class="menu-btn" data-menu="connect-agent">상담사 연결</button>';
        } else {
            mainMenuHtml += '<button class="menu-btn" data-menu="login-required">상담사 연결</button>';
        }
        mainMenuHtml += '</div>';
        $(".chatbot-content").html(mainMenuHtml);
    }

    // 빠른 이동 메뉴 처리
    $(document).on("click", ".menu-btn", function() {
        var menu = $(this).data("menu");

        if (menu === "quick-move") {
            var quickMoveHtml = '<div class="bot-message">빠른 이동 메뉴입니다.</div>' +
                '<div class="bot-message">' +
                '<button class="menu-btn" data-menu="my">마이</button>' +
                '<button class="menu-btn" data-menu="board">게시판</button>' +
                '<button class="menu-btn" data-menu="map">지도</button>' +
                '<button class="menu-btn" data-menu="support">고객지원</button>' +
                '<button class="menu-btn back-btn">뒤로가기</button>' +
                '</div>';
            $(".chatbot-content").html(quickMoveHtml);
        
        } else if (menu === "my") {
            var myMenuHtml = '<div class="bot-message">마이 페이지 메뉴입니다.</div>' +
                '<div class="bot-message">' +
                '<button class="menu-btn" onclick="location.href=\'${pageContext.request.contextPath}/mypage\'">마이페이지</button>' +
                '<button class="menu-btn" onclick="location.href=\'${pageContext.request.contextPath}/memEditView\'">회원정보수정</button>' +
                '<button class="menu-btn" onclick="location.href=\'#\'">전기사용량</button>' +
                '<button class="menu-btn" onclick="location.href=\'#\'">가스사용량</button>' +
                '<button class="menu-btn back-btn">뒤로가기</button>' +
                '</div>';
            $(".chatbot-content").html(myMenuHtml);
        
        } else if (menu === "faq") {
            // FAQ 페이지로 이동
            window.location.href = "${pageContext.request.contextPath}/faq/view";

        } else if (menu === "board") {
            var boardMenuHtml = '<div class="bot-message">게시판 메뉴입니다.</div>' +
                '<div class="bot-message">' +
                '<button class="menu-btn" onclick="location.href=\'#\'">공지사항</button>' +
                '<button class="menu-btn" onclick="location.href=\'${pageContext.request.contextPath}/reviewView\'">리뷰게시판</button>' +
                '<button class="menu-btn" onclick="location.href=\'#\'">자유게시판</button>' +
                '<button class="menu-btn back-btn">뒤로가기</button>' +
                '</div>';
            $(".chatbot-content").html(boardMenuHtml);

        } else if (menu === "map") {
            var mapMenuHtml = '<div class="bot-message">지도 메뉴입니다.</div>' +
                '<div class="bot-message">' +
                '<button class="menu-btn" onclick="location.href=\'#\'">에너지효율등급</button>' +
                '<button class="menu-btn" onclick="location.href=\'#\'">지도 상세보기</button>' +
                '<button class="menu-btn back-btn">뒤로가기</button>' +
                '</div>';
            $(".chatbot-content").html(mapMenuHtml);

        } else if (menu === "support") {
            var supportMenuHtml = '<div class="bot-message">고객지원 메뉴입니다.</div>' +
                '<div class="bot-message">' +
                '<button class="menu-btn" onclick="location.href=\'${pageContext.request.contextPath}/chatListView\'">챗봇상담</button>' +
                '<button class="menu-btn" onclick="location.href=\'${pageContext.request.contextPath}/faq/view\'">자주 묻는 질문</button>' +
                '<button class="menu-btn" onclick="location.href=\'#\'">이용 가이드</button>' +
                '<button class="menu-btn" onclick="location.href=\'${pageContext.request.contextPath}/proposal/view\'">건의사항</button>' +
                '<button class="menu-btn back-btn">뒤로가기</button>' +
                '</div>';
            $(".chatbot-content").html(supportMenuHtml);

        } else if (menu === "login-required") {
            alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
            window.location.href = "${pageContext.request.contextPath}/loginView";
        }
    });

    $(document).on('click', '.back-btn', function() {
        displayMainMenu();
    });

    displayMainMenu();
});
</script>
</body>
</html>
