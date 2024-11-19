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
    height: 500px;
    background-color: #f9f9f9;
    border-radius: 15px;
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
    display: none;
    flex-direction: column;
    z-index: 1000;
}

.chatbot-interface.show {
    display: flex;
}

.chatbot-header {
    background-color: #4A90E2;
    color: white;
    padding: 12px;
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;
    display: flex;
    justify-content: space-between;
    font-weight: bold;
    font-size: 16px;
}

.chatbot-header .close-btn {
    cursor: pointer;
    font-size: 22px;
}

.chatbot-content {
    flex-grow: 1;
    overflow-y: auto;
    padding: 12px;
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.bot-message {
    margin-bottom: 10px;
    font-size: 14px;
    background: #f1f1f1;
    border-radius: 10px;
    padding: 10px;
}

.menu-btn {
    display: block;
    width: 100%;
    background-color: #e7f3ff;
    color: #4A90E2;
    border: none;
    border-radius: 8px;
    padding: 10px;
    text-align: left;
    margin: 5px 0;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.menu-btn:hover {
    background-color: #d0e8ff;
}
</style>
</head>
<body>
    <!-- 챗봇 아이콘 -->
    <div class="chatbot-icon"></div>
    
    <!-- 챗봇 인터페이스 -->
    <div class="chatbot-interface">
        <div class="chatbot-header">
            <span>Chatbot</span>
            <span class="close-btn">&times;</span>
        </div>
        <div class="chatbot-content" id="chatbotContent">
            <!-- 기본 화면 -->
            <div class="bot-message">안녕하세요! 무엇을 도와드릴까요?</div>
            <div class="bot-message">
                <button class="menu-btn" data-menu="quick-move">페이지 빠른 이동</button>
                <button class="menu-btn" data-menu="faq">FAQ</button>
                <c:if test="${sessionScope.login != null && sessionScope.login.memId eq 'admin'}">
                    <button class="menu-btn" data-menu="admin-chat">사용자 상담 연결</button>
                </c:if>
                <c:if test="${sessionScope.login != null && sessionScope.login.memId ne 'admin'}">
                    <button class="menu-btn" data-menu="connect-agent">상담사 연결</button>
                </c:if>
            </div>
        </div>
    </div>

<script>
$(document).ready(function () {
    // 챗봇 열기/닫기
    $(".chatbot-icon").on("click", function () {
        $(".chatbot-interface").toggleClass("show").toggle();
    });

    $(".close-btn").on("click", function () {
        $(".chatbot-interface").removeClass("show").hide();
    });

    // 초기 메뉴 표시
    function displayMainMenu() {
        $("#chatbotContent").html(`
            <div class="bot-message">안녕하세요! 무엇을 도와드릴까요?</div>
            <div class="bot-message">
                <button class="menu-btn" data-menu="quick-move">페이지 빠른 이동</button>
                <button class="menu-btn" onclick="location.href='${pageContext.request.contextPath}/faq/view'">FAQ</button>
                <c:if test="${sessionScope.login != null && sessionScope.login.memId eq 'admin'}">
                    <button class="menu-btn" data-menu="admin-chat">사용자 상담 연결</button>
                </c:if>
                <c:if test="${sessionScope.login != null && sessionScope.login.memId ne 'admin'}">
                    <button class="menu-btn" data-menu="connect-agent">상담사 연결</button>
                </c:if>
            </div>
        `);
    }

    // 빠른 이동 메뉴
    function displayQuickMoveMenu() {
        $("#chatbotContent").html(`
            <div class="bot-message">빠른 이동 메뉴입니다.</div>
            <div class="bot-message">
                <button class="menu-btn" data-menu="my">마이</button>
                <button class="menu-btn" data-menu="board">게시판</button>
                <button class="menu-btn" data-menu="map">지도</button>
                <button class="menu-btn" data-menu="support">고객지원</button>
                <button class="menu-btn back-btn">뒤로가기</button>
            </div>
        `);
    }

    // 각 세부 메뉴
    function displayMyMenu() {
        $("#chatbotContent").html(`
            <div class="bot-message">마이 메뉴입니다.</div>
            <button class="menu-btn" onclick="location.href='${pageContext.request.contextPath}/mypage'">마이페이지</button>
            <button class="menu-btn" onclick="location.href='${pageContext.request.contextPath}/memEditView'">회원정보수정</button>
            <button class="menu-btn" onclick="location.href='${pageContext.request.contextPath}/electricityUseView'">전기사용량</button>
            <button class="menu-btn" onclick="location.href='${pageContext.request.contextPath}/ocrView'">전기사용량 기입</button>
            <button class="menu-btn back-btn">뒤로가기</button>
        `);
    }

    function displayBoardMenu() {
        $("#chatbotContent").html(`
            <div class="bot-message">게시판 메뉴입니다.</div>
            <button class="menu-btn" onclick="location.href='${pageContext.request.contextPath}/noticeBoardView'">공지사항</button>
            <button class="menu-btn" onclick="location.href='${pageContext.request.contextPath}/reviewView'">리뷰게시판</button>
            <button class="menu-btn" onclick="location.href='${pageContext.request.contextPath}/freeBoardView'">자유게시판</button>
            <button class="menu-btn" onclick="location.href='${pageContext.request.contextPath}/productView'">에너지 효율 제품 게시판</button>
            <button class="menu-btn back-btn">뒤로가기</button>
        `);
    }

    function displayMapMenu() {
        $("#chatbotContent").html(`
            <div class="bot-message">지도 메뉴입니다.</div>
            <button class="menu-btn" onclick="location.href='${pageContext.request.contextPath}/inputView'">제로 에너지 건축물 등급 측정</button>
            <button class="menu-btn" onclick="location.href='${pageContext.request.contextPath}/mapView'">지도 상세보기</button>
            <button class="menu-btn back-btn">뒤로가기</button>
        `);
    }

    function displaySupportMenu() {
        $("#chatbotContent").html(`
            <div class="bot-message">고객지원 메뉴입니다.</div>
            <button class="menu-btn" onclick="location.href='${pageContext.request.contextPath}/chatListView'">챗봇상담</button>
            <button class="menu-btn" onclick="location.href='${pageContext.request.contextPath}/faq/view'">자주 묻는 질문</button>
            <button class="menu-btn">이용 가이드</button>
            <button class="menu-btn" onclick="location.href='${pageContext.request.contextPath}/proposal/view'">건의사항</button>
            <button class="menu-btn back-btn">뒤로가기</button>
        `);
    }

    // 메뉴 이벤트 처리
    $(document).on("click", ".menu-btn", function () {
        const menu = $(this).data("menu");
        switch (menu) {
            case "quick-move":
                displayQuickMoveMenu();
                break;
            case "my":
                displayMyMenu();
                break;
            case "board":
                displayBoardMenu();
                break;
            case "map":
                displayMapMenu();
                break;
            case "support":
                displaySupportMenu();
                break;
            default:
                displayMainMenu();
        }
    });

    // 뒤로가기 버튼
    $(document).on("click", ".back-btn", function () {
        displayMainMenu();
    });

    // 초기 메뉴 표시
    displayMainMenu();
});
</script>

</body>
</html>
