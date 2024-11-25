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
    visibility: hidden;
    opacity: 0;
    display: flex;
    flex-direction: column;
    z-index: 1000;
    transition: visibility 0s, opacity 0.3s ease;
}

.chatbot-interface.show {
    visibility: visible;
    opacity: 1;
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
    background: #e7f3ff;
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

<style>
.table {
    width: 100%;
    font-size: 12px;
}

.table th, .table td {
    text-align: left;
    padding: 5px;
}

.chat-area {
    flex-grow: 1;
    overflow-y: auto;
    padding: 10px;
    background-color: #f1f1f1;
    border-radius: 10px;
}

.chat-input {
    display: flex;
    gap: 5px;
}

.chat-input input {
    flex-grow: 1;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
}
</style>

<style>
.chat-room-card {
    background-color: #f5f5f5;
    border-radius: 8px;
    margin: 10px 0;
    padding: 15px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s ease;
    cursor: pointer;
}

.chat-room-card:hover {
    transform: translateY(-5px);
}

.chat-room-header {
    display: flex;
    justify-content: space-between;
    font-size: 16px;
    font-weight: bold;
    color: #333;
}

.room-name {
    color: #4A90E2;
    font-size: 14px;
}

.room-date {
    font-size: 12px;
    color: #aaa;
}

.chat-room-body {
    margin-top: 10px;
}

.room-info {
    font-size: 12px;
    color: #555;
}

.room-number,
.room-owner {
    display: block;
}

.view-room-btn {
    display: inline-block;
    margin-top: 10px;
    padding: 8px 12px;
    background-color: #4A90E2;
    color: white;
    border-radius: 5px;
    text-decoration: none;
    font-weight: bold;
    transition: background-color 0.3s ease;
}

.view-room-btn:hover {
    background-color: #357ab7;
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
<script type="text/javascript">
    // JSP에서 contextPath를 JavaScript로 전달
    var contextPath = '${pageContext.request.contextPath}';
</script>

<script>
$(document).ready(function () {
    // 챗봇 열기/닫기
    $(".chatbot-icon").on("click", function () {
        $(".chatbot-interface").toggleClass("show");
    });

    $(".close-btn").on("click", function () {
        $(".chatbot-interface").removeClass("show");
    });

    // 초기 메뉴 표시
    function displayMainMenu() {
        $("#chatbotContent").html(`
            <div class="bot-message">안녕하세요! 무엇을 도와드릴까요?</div>
            <div class="bot-message">
                <button class="menu-btn" data-menu="quick-move">페이지 빠른 이동</button>
                <button class="menu-btn" onclick="location.href='${contextPath}/faq/view'">FAQ</button>
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
            <button class="menu-btn" onclick="location.href='${contextPath}/mypage'">마이페이지</button>
            <button class="menu-btn" onclick="location.href='${contextPath}/memEditView'">회원정보수정</button>
            <button class="menu-btn" onclick="location.href='${contextPath}/electricityUseView'">전기사용량</button>
            <button class="menu-btn" onclick="location.href='${contextPath}/ocrView'">전기사용량 기입</button>
            <button class="menu-btn back-btn">뒤로가기</button>
        `);
    }

    function displayBoardMenu() {
        $("#chatbotContent").html(`
            <div class="bot-message">게시판 메뉴입니다.</div>
            <button class="menu-btn" onclick="location.href='${contextPath}/noticeBoardView'">공지사항</button>
            <button class="menu-btn" onclick="location.href='${contextPath}/reviewView'">리뷰게시판</button>
            <button class="menu-btn" onclick="location.href='${contextPath}/freeBoardView'">자유게시판</button>
            <button class="menu-btn" onclick="location.href='${contextPath}/productView'">에너지 효율 제품 게시판</button>
            <button class="menu-btn back-btn">뒤로가기</button>
        `);
    }

    function displayMapMenu() {
        $("#chatbotContent").html(`
            <div class="bot-message">지도 메뉴입니다.</div>
            <button class="menu-btn" onclick="location.href='${contextPath}/inputView'">제로 에너지 건축물 등급 측정</button>
            <button class="menu-btn" onclick="location.href='${contextPath}/mapView'">지도 상세보기</button>
            <button class="menu-btn back-btn">뒤로가기</button>
        `);
    }

    function displaySupportMenu() {
        $("#chatbotContent").html(`
            <div class="bot-message">고객지원 메뉴입니다.</div>
            <button class="menu-btn" onclick="location.href='${contextPath}/chatListView'">챗봇상담</button>
            <button class="menu-btn" onclick="location.href='${contextPath}/faq/view'">자주 묻는 질문</button>
            <button class="menu-btn">이용 가이드</button>
            <button class="menu-btn" onclick="location.href='${contextPath}/proposal/view'">건의사항</button>
            <button class="menu-btn back-btn">뒤로가기</button>
        `);
    }
    
    // AJAX로 채팅방 목록 가져오기
function getRoomList() {
    $.ajax({
        url: contextPath + "/getRoomList",  // contextPath를 사용
        method: "GET",
        success: function(response) {
            console.log("응답 데이터:", response);  // 받아온 데이터 확인
            if (response.length === 0) {
                $("#chatbotContent").html('<div class="bot-message">현재 채팅방이 없습니다.</div>');
            } else {
                var html = '<div class="bot-message">채팅방 목록</div>';

                $.each(response, function(index, room) {
                    console.log("채팅방 객체:", room); // 각 room 객체 확인

                    var roomNo = room.roomNo || '정보 없음';  // 값이 없으면 '정보 없음'
                    var roomName = room.roomName || '정보 없음';
                    var memName = room.memName || '정보 없음';
                    var regDate = room.regDate || '정보 없음';

                    // 채팅방을 카드 형식으로 표시
                    html += '<div class="chat-room-card" id="room-' + roomNo + '">' +
                        '<div class="chat-room-header">' +
                            '<span class="room-name">' + roomName + '</span>' +
                            '<span class="room-date">' + regDate + '</span>' +
                        '</div>' +
                        '<div class="chat-room-body">' +
                            '<div class="room-info">' +
                                '<span class="room-number">방번호: ' + roomNo + '</span>' +
                                '<span class="room-owner">방장: ' + memName + '</span>' +
                            '</div>' +
                            '<a href="' + contextPath + '/chatView?roomNo=' + room.roomNo + '" class="view-room-btn">채팅방 보기</a>' +
                            '<button class="delete-room-btn" data-room-no="' + room.roomNo + '">삭제</button>' +  // 삭제 버튼 추가
                        '</div>' +
                    '</div>';
                });

                // 뒤로가기 버튼 추가
                html += '<div class="bot-message">' +
                            '<button class="menu-btn back-btn">뒤로가기</button>' +
                        '</div>';

                console.log("생성된 HTML:", html);  // 최종 HTML 확인

                $("#chatbotContent").html(html);  // 생성된 HTML을 화면에 표시
            }
        },
        error: function() {
            alert("채팅방 목록을 가져오는 데 실패했습니다.");
        }
    });
}
    // 채팅방 삭제 요청
$(document).on("click", ".delete-room-btn", function () {
    var roomNo = $(this).data("room-no");  // 삭제할 채팅방 번호 가져오기
    
    if (confirm("정말 이 채팅방을 삭제하시겠습니까?")) {
        $.ajax({
            url: contextPath + "/deleteRoom",  // 채팅방 삭제 요청
            method: "POST",
            data: { roomNo: roomNo },
            success: function(response) {
                if (response === "success") {
                    // 삭제 성공 시 해당 채팅방 카드 삭제
                    $("#room-" + roomNo).remove();
                    alert("채팅방이 삭제되었습니다.");
                } else {
                    alert("채팅방 삭제에 실패했습니다.");
                }
            },
            error: function() {
                alert("삭제 요청 중 오류가 발생했습니다.");
            }
        });
    }
});

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
            case "admin-chat":
                getRoomList();
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