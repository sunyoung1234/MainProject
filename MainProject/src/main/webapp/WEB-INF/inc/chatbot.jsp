<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Chatbot Interface</title>

<!-- jQuery & WebSocket -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

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
    height: 600px;
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

.chat-container {
    height: 400px;
    overflow-y: auto;
    padding: 10px;
    background-color: #f5f5f5;
    border-radius: 10px;
    margin-bottom: 10px;
}

.input-group {
    display: flex;
    gap: 10px;
    margin-top: 10px;
}

.chat-box {
    padding: 8px;
    border-radius: 8px;
    max-width: 80%;
    word-break: break-word;
}

.myChat {
    background-color: #007bff;
    color: white;
    align-self: flex-end;
    text-align: right;
}

.otherChat {
    background-color: #e9ecef;
    align-self: flex-start;
}

.system-message {
    text-align: center;
    color: #888;
    font-size: 0.9em;
}
</style>
</head>
<body>
    <div class="chatbot-icon"></div>
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
    let client;
    let currentRoomNo = null;

    // WebSocket 설정
    const sock = new SockJS("${pageContext.request.contextPath}/endpoint");
    client = Stomp.over(sock);

    // 챗봇 열기/닫기
    $(".chatbot-icon").on("click", function () {
        $(".chatbot-interface").toggleClass("show").toggle();
    });
    $(".close-btn").on("click", function () {
        $(".chatbot-interface").removeClass("show").hide();
    });

    // 메뉴 클릭 이벤트
    $(document).on("click", ".menu-btn", function () {
        const menu = $(this).data("menu");
        console.log(`Menu clicked: ${menu}`); // 디버깅용 로그
        switch (menu) {
            case "quick-move":
                displayQuickMoveMenu();
                break;
            case "faq":
                window.location.href = "${pageContext.request.contextPath}/faq/view";
                break;
            case "connect-agent":
                connectAgent();
                break;
            case "admin-chat":
                adminChat();
                break;
            case "login-required":
                alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
                window.location.href = "${pageContext.request.contextPath}/loginView";
                break;
            default:
                console.error("Unknown menu action");
        }
    });

    // 빠른 이동 메뉴 표시
    function displayQuickMoveMenu() {
        console.log("Displaying Quick Move Menu");
        $("#chatbotContent").html(`
            <div class="bot-message">빠른 이동 메뉴입니다.</div>
            <div class="bot-message">
                <button class="menu-btn" onclick="location.href='${pageContext.request.contextPath}/mypage'">마이페이지</button>
                <button class="menu-btn" onclick="location.href='${pageContext.request.contextPath}/memEditView'">회원정보수정</button>
                <button class="menu-btn" onclick="location.href='#'">게시판</button>
                <button class="menu-btn back-btn">뒤로가기</button>
            </div>
        `);
        $(".back-btn").on("click", displayMainMenu);
    }

    // 사용자 상담 연결
    function connectAgent() {
        console.log("Connecting to agent...");
        $.post(
            "${pageContext.request.contextPath}/roomCreateDo",
            {
                roomName: `${loginName}님의 상담방`,
            },
            function (response) {
                console.log("Agent connected response:", response);
                if (response.status === "success") {
                    currentRoomNo = response.roomNo;
                    enterChatRoom(currentRoomNo);
                } else {
                    alert("상담 연결에 실패했습니다.");
                }
            }
        ).fail(function () {
            console.error("Failed to create room for agent connection");
        });
    }

    // 관리자 상담 연결
    function adminChat() {
        console.log("Loading admin chat...");
        $("#chatbotContent").html('<div class="bot-message">사용자 상담 목록을 불러오는 중...</div><ul id="roomList"></ul>');

        $.get("${pageContext.request.contextPath}/chatListView", function (data) {
            console.log("Admin chat list:", data);
            if (data.roomList && data.roomList.length > 0) {
                $("#chatbotContent").html('<div class="bot-message">사용자 상담 목록</div><ul id="roomList"></ul>');
                data.roomList.forEach((room) => {
                    $("#roomList").append(`
                        <li>
                            <button class="room-btn" data-room-no="${room.roomNo}">
                                ${room.roomName} (방장: ${room.memName})
                            </button>
                        </li>
                    `);
                });

                $(document).on("click", ".room-btn", function () {
                    const roomNo = $(this).data("room-no");
                    enterChatRoom(roomNo);
                });
            } else {
                $("#chatbotContent").html('<div class="bot-message">현재 상담 가능한 방이 없습니다.</div>');
            }
        }).fail(function () {
            console.error("Failed to load admin chat list");
            $("#chatbotContent").html('<div class="bot-message">상담 목록을 불러오지 못했습니다.</div>');
        });
    }

    // 채팅방 입장
    function enterChatRoom(roomNo) {
        console.log(`Entering chat room: ${roomNo}`);
        currentRoomNo = roomNo;
        $("#chatbotContent").html(`
            <div class="chat-container" id="chatList"></div>
            <div class="input-group">
                <input type="text" id="msgi" class="form-control" placeholder="메시지 입력..." />
                <button id="btnSend" class="btn btn-primary">보내기</button>
            </div>
            <button id="btnBack" class="btn btn-secondary">뒤로가기</button>
        `);

        client.connect({}, function () {
            client.subscribe(`/subscribe/chat/${roomNo}`, function (chat) {
                const content = JSON.parse(chat.body);
                renderMessage(content);
            });
        });

        $("#btnSend").on("click", sendMessage);
        $("#btnBack").on("click", displayMainMenu);
    }

    // 메시지 보내기
    function sendMessage() {
        const message = $("#msgi").val();
        if (!message) return;
        console.log(`Sending message: ${message}`);
        client.send(`/app/hello/${currentRoomNo}`, {}, JSON.stringify({
            chatMsg: message,
            memId: loginId,
            memName: loginName,
            roomNo: currentRoomNo
        }));
        $("#msgi").val("");
    }

    // 메시지 렌더링
    function renderMessage(vo) {
        const chatStyle = vo.memId === loginId ? "myChat" : "otherChat";
        $("#chatList").append(`
            <div class="${chatStyle} chat-box">${vo.memName}: ${vo.chatMsg}</div>
        `);
    }

    // 메인 메뉴 표시
    function displayMainMenu() {
        console.log("Displaying main menu...");
        $("#chatbotContent").html(`
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
        `);
    }

    displayMainMenu();
});

</script>

</body>
</html>
